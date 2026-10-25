import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import '../../util/logger.dart';
import 'nethernet_protocol.dart';

class NetherNetSignal {
  final String type;
  final int connectionId;
  final String payload;
  final int senderId;
  final InternetAddress address;

  NetherNetSignal({
    required this.type,
    required this.connectionId,
    required this.payload,
    required this.senderId,
    required this.address,
  });
}

class NetherNetDiscovery {
  RawDatagramSocket? _socket;
  StreamSubscription<RawSocketEvent>? _subscription;
  RawDatagramSocket? _outboundSocket;
  StreamSubscription<RawSocketEvent>? _outboundSubscription;
  Timer? _rebindTimer;

  final Logger logger;
  final int networkId;
  Uint8List? _pongData;

  String nonce = '';

  final Map<int, InternetAddress> _peers = {};
  final Map<int, int> _peerPorts = {};
  final Set<String> _localAddresses = {};

  void Function(int senderId, InternetAddress address)? onPeerSeen;
  void Function(InternetAddress address, int port, int requestCount)?
  onDiscoveryRequest;
  void Function(NetherNetSignal signal)? onSignal;

  final Map<String, int> _requestCounts = {};

  NetherNetDiscovery({required this.logger, int? networkId})
    : networkId = networkId ?? _randomNetworkId();

  static int _randomNetworkId() {
    final rng = Random.secure();
    return (rng.nextInt(0xFFFFFFFF) << 32) | rng.nextInt(0xFFFFFFFF);
  }

  bool get running => _outboundSocket != null || _socket != null;

  Map<int, InternetAddress> get peers => Map.unmodifiable(_peers);

  void setAdvertisement({
    required String serverName,
    required String levelName,
    int playerCount = 0,
    int maxPlayerCount = 10,
    int? protocol,
    String? gameVersion,
  }) {
    nonce = NetherNetProtocol.randomNonce();
    _pongData = NetherNetProtocol.buildPongData(
      serverName: serverName,
      levelName: levelName,
      playerCount: playerCount,
      maxPlayerCount: maxPlayerCount,
      nonce: nonce,
      protocol: protocol ?? NetherNetProtocol.defaultProtocol,
      gameVersion: gameVersion ?? NetherNetProtocol.defaultGameVersion,
    );
  }

  void Function()? onLocalNetworkBlocked;
  bool _blockedReported = false;
  bool _stopped = true;
  bool _recovering = false;

  Future<bool> start() async {
    if (_outboundSocket != null) return true;
    _stopped = false;
    try {
      await _refreshLocalAddresses();
      final outbound = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
      outbound.broadcastEnabled = true;
      _outboundSocket = outbound;
      if (!_recovering) _blockedReported = false;
      _outboundSubscription = outbound.listen(
        (event) => _onEvent(outbound, event),
        onError: (Object e) {
          if (_isLocalNetworkBlocked(e)) {
            _reportBlocked(e);
          } else {
            logger.error('NetherNet outbound socket error: $e');
          }
          _recover();
        },
        onDone: _recover,
      );

      final boundDiscovery = await _bindDiscoverySocket();
      if (!boundDiscovery) {
        await stop();
        return false;
      }

      logger.info(
        'NetherNet discovery listening on ${NetherNetProtocol.discoveryPort} '
        '(outbound ${outbound.port}, networkId ${networkId.toUnsigned(64)})',
      );
      return true;
    } catch (e, st) {
      logger.error('NetherNet discovery could not bind: $e\n$st');
      await stop();
      return false;
    }
  }

  Future<bool> _bindDiscoverySocket() async {
    if (_stopped || _socket != null) return _socket != null;
    try {
      final socket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        NetherNetProtocol.discoveryPort,
        reuseAddress: true,
        reusePort: Platform.isIOS || Platform.isMacOS,
      );
      if (_stopped || _socket != null) {
        socket.close();
        return _socket != null;
      }
      socket.broadcastEnabled = true;
      _socket = socket;
      _subscription = socket.listen(
        (event) => _onEvent(socket, event),
        onError: (Object e) {
          if (_isLocalNetworkBlocked(e)) {
            _reportBlocked(e);
          } else {
            logger.error('NetherNet discovery socket error: $e');
          }
          _recover();
        },
        onDone: () {
          if (_socket == socket) _recover();
        },
      );
      return true;
    } catch (e, st) {
      logger.error('NetherNet discovery could not bind port 7551: $e\n$st');
      return false;
    }
  }

  void _releaseDiscoverySocketTemporarily() {
    _rebindTimer?.cancel();
    final socket = _socket;
    final sub = _subscription;
    _socket = null;
    _subscription = null;
    if (sub != null) unawaited(sub.cancel());
    socket?.close();
    _rebindTimer = Timer(const Duration(seconds: 5), () async {
      if (_stopped) return;
      if (!await _bindDiscoverySocket() && !_stopped) {
        _releaseDiscoverySocketTemporarily();
      }
    });
  }

  Future<void> _recover() async {
    if (_stopped || _recovering) return;
    _recovering = true;
    try {
      _rebindTimer?.cancel();
      _rebindTimer = null;
      await _subscription?.cancel();
      _subscription = null;
      _socket?.close();
      _socket = null;
      await _outboundSubscription?.cancel();
      _outboundSubscription = null;
      _outboundSocket?.close();
      _outboundSocket = null;
      await Future<void>.delayed(const Duration(milliseconds: 500));
      if (!_stopped && await start()) {
        logger.info('NetherNet discovery socket restarted');
      }
    } finally {
      _recovering = false;
    }
  }

  Future<void> stop() async {
    _stopped = true;
    _rebindTimer?.cancel();
    _rebindTimer = null;
    await _subscription?.cancel();
    _subscription = null;
    _socket?.close();
    _socket = null;
    await _outboundSubscription?.cancel();
    _outboundSubscription = null;
    _outboundSocket?.close();
    _outboundSocket = null;
    _peers.clear();
    _peerPorts.clear();
    _localAddresses.clear();
    _requestCounts.clear();
    logger.info('NetherNet discovery stopped');
  }

  void _onEvent(RawDatagramSocket socket, RawSocketEvent event) {
    if (event != RawSocketEvent.read) return;

    final datagram = socket.receive();
    if (datagram == null) return;

    final body = NetherNetProtocol.decryptPacket(
      Uint8List.fromList(datagram.data),
    );
    if (body == null || body.length < 18) return;

    final view = ByteData.view(body.buffer, body.offsetInBytes, body.length);
    final packetId = view.getUint16(0, Endian.little);
    final senderId = view.getUint64(2, Endian.little);

    if (senderId == networkId || senderId == 0) return;

    final isNewPeer = !_peers.containsKey(senderId);
    _peers[senderId] = datagram.address;
    _peerPorts[senderId] = datagram.port;
    if (isNewPeer) onPeerSeen?.call(senderId, datagram.address);

    switch (packetId) {
      case NetherNetProtocol.idDiscoveryRequest:
        final key = datagram.address.address;
        final count = (_requestCounts[key] ?? 0) + 1;
        _requestCounts[key] = count;
        _sendResponse(datagram.address, datagram.port, 0);
        onDiscoveryRequest?.call(datagram.address, datagram.port, count);
        break;
      case NetherNetProtocol.idDiscoveryMessage:
        _handleMessage(body, senderId, datagram.address);
        break;
      default:
        logger.info(
          'NetherNet packet 0x${packetId.toRadixString(16)} from '
          '${datagram.address.address} ignored',
        );
        break;
    }
  }

  void _sendResponse(InternetAddress address, int port, int recipientId) {
    final pong = _pongData;
    if (pong == null) return;
    final packet = NetherNetProtocol.buildDiscoveryPacket(
      packetId: NetherNetProtocol.idDiscoveryResponse,
      networkId: networkId,
      recipientId: recipientId,
      tail: pong,
    );
    _send(packet, address, port);
  }

  void _handleMessage(Uint8List body, int senderId, InternetAddress address) {
    if (body.length < 30) {
      logger.info('NetherNet message too short (${body.length} bytes)');
      return;
    }
    final view = ByteData.view(body.buffer, body.offsetInBytes, body.length);
    final recipientId = view.getUint64(18, Endian.little);
    if (recipientId != networkId && recipientId != 0) {
      logger.info('NetherNet message for another recipient ignored');
      return;
    }

    final declared = view.getUint32(26, Endian.little);
    final available = body.length - 30;
    if (available <= 0 || available < declared) {
      logger.info(
        'NetherNet message length mismatch (declared $declared, got $available)',
      );
      return;
    }

    final message = utf8.decode(
      Uint8List.sublistView(body, 30, 30 + declared),
      allowMalformed: true,
    );
    if (message == 'Ping') return;

    final parts = message.split(' ');
    final connectionId = parts.length < 2
        ? null
        : NetherNetProtocol.parseUnsigned(parts[1]);
    if (connectionId == null) {
      logger.info('NetherNet message not understood: ${parts.first}');
      return;
    }
    logger.info(
      'NetherNet signal ${parts[0]} (connection ${NetherNetProtocol.unsignedString(connectionId)}) from '
      '${address.address}',
    );

    final payload = parts.length > 2 ? parts.sublist(2).join(' ') : '';
    onSignal?.call(
      NetherNetSignal(
        type: parts[0],
        connectionId: connectionId,
        payload: payload,
        senderId: senderId,
        address: address,
      ),
    );
  }

  bool sendSignal({
    required int recipientId,
    required String type,
    required int connectionId,
    required String payload,
  }) {
    final address = _peers[recipientId];
    final port = _peerPorts[recipientId];
    if (address == null || port == null) return false;

    if (port == NetherNetProtocol.discoveryPort && _isSameDevice(address)) {
      _releaseDiscoverySocketTemporarily();
    }

    final message = payload.isEmpty
        ? '$type ${NetherNetProtocol.unsignedString(connectionId)}'
        : '$type ${NetherNetProtocol.unsignedString(connectionId)} $payload';

    final packet = NetherNetProtocol.buildDiscoveryPacket(
      packetId: NetherNetProtocol.idDiscoveryMessage,
      networkId: networkId,
      tail: NetherNetProtocol.buildMessageTail(
        recipientId: recipientId,
        message: message,
      ),
    );
    return _send(packet, address, port);
  }

  Future<void> broadcastAdvertisement() async {
    final pong = _pongData;
    if (pong == null) return;
    final packet = NetherNetProtocol.buildDiscoveryPacket(
      packetId: NetherNetProtocol.idDiscoveryResponse,
      networkId: networkId,
      tail: pong,
    );
    final directed = await _directedBroadcastAddresses();
    for (final address in directed) {
      _send(packet, address, NetherNetProtocol.discoveryPort);
    }
  }

  static const _wanInterfacePrefixes = [
    'pdp_ip',
    'rmnet',
    'ccmni',
    'utun',
    'ipsec',
    'tun',
    'ppp',
    'docker',
    'veth',
  ];

  bool _isSameDevice(InternetAddress address) =>
      address.isLoopback || _localAddresses.contains(address.address);

  Future<void> _refreshLocalAddresses() async {
    try {
      final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
      );
      _localAddresses
        ..clear()
        ..addAll(interfaces.expand((i) => i.addresses).map((a) => a.address));
    } catch (_) {}
  }

  Future<List<InternetAddress>> _directedBroadcastAddresses() async {
    try {
      final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
      );
      _localAddresses
        ..clear()
        ..addAll(interfaces.expand((i) => i.addresses).map((a) => a.address));
      final result = <InternetAddress>[];
      for (final interface in interfaces) {
        final name = interface.name.toLowerCase();
        if (_wanInterfacePrefixes.any(name.startsWith)) continue;
        for (final address in interface.addresses) {
          if (address.isLoopback || address.isLinkLocal) continue;
          final octets = address.rawAddress;
          result.add(
            InternetAddress.fromRawAddress(
              Uint8List.fromList([octets[0], octets[1], octets[2], 255]),
            ),
          );
        }
      }
      return result;
    } catch (_) {
      return const [];
    }
  }

  bool _send(Uint8List body, InternetAddress address, int port) {
    final socket = _outboundSocket ?? _socket;
    if (socket == null) return false;
    try {
      final sent = socket.send(
        NetherNetProtocol.encryptPacket(body),
        address,
        port,
      );
      return sent > 0;
    } catch (e) {
      if (_isLocalNetworkBlocked(e)) {
        _reportBlocked(e);
        return false;
      }
      logger.error('NetherNet send failed: $e');
      return false;
    }
  }

  bool _isLocalNetworkBlocked(Object e) {
    if (!Platform.isIOS && !Platform.isMacOS) return false;
    if (e is! SocketException) return false;
    final code = e.osError?.errorCode;
    return code == 65 || code == 51;
  }

  void _reportBlocked(Object e) {
    if (_blockedReported) return;
    _blockedReported = true;
    logger.error('NetherNet local network is blocked: $e');
    onLocalNetworkBlocked?.call();
  }
}
