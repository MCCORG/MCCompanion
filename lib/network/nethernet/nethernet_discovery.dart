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

  final Logger logger;
  final int networkId;
  Uint8List? _pongData;

  String nonce = '';

  final Map<int, InternetAddress> _peers = {};
  final Map<int, int> _peerPorts = {};

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

  bool get running => _socket != null;

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
    if (_socket != null) return true;
    _stopped = false;
    try {
      final socket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        NetherNetProtocol.discoveryPort,
        reuseAddress: true,
        reusePort: Platform.isIOS || Platform.isMacOS,
      );
      socket.broadcastEnabled = true;
      _socket = socket;
      if (!_recovering) _blockedReported = false;
      _subscription = socket.listen(
        _onEvent,
        onError: (Object e) {
          if (_isLocalNetworkBlocked(e)) {
            _reportBlocked(e);
          } else {
            logger.error('NetherNet discovery socket error: $e');
          }
          _recover();
        },
        onDone: _recover,
      );
      logger.info(
        'NetherNet discovery listening on ${NetherNetProtocol.discoveryPort} '
        '(networkId ${networkId.toUnsigned(64)})',
      );
      return true;
    } catch (e, st) {
      logger.error('NetherNet discovery could not bind: $e\n$st');
      return false;
    }
  }

  Future<void> _recover() async {
    if (_stopped || _recovering) return;
    _recovering = true;
    try {
      await _subscription?.cancel();
      _subscription = null;
      _socket?.close();
      _socket = null;
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
    await _subscription?.cancel();
    _subscription = null;
    _socket?.close();
    _socket = null;
    _peers.clear();
    _peerPorts.clear();
    _requestCounts.clear();
    logger.info('NetherNet discovery stopped');
  }

  void _onEvent(RawSocketEvent event) {
    if (event != RawSocketEvent.read) return;
    final socket = _socket;
    if (socket == null) return;

    final datagram = socket.receive();
    if (datagram == null) return;

    final body = NetherNetProtocol.decryptPacket(
      Uint8List.fromList(datagram.data),
    );
    if (body == null || body.length < 18) return;

    final view = ByteData.view(body.buffer, body.offsetInBytes, body.length);
    final packetId = view.getUint16(0, Endian.little);
    final senderId = view.getUint64(2, Endian.little);

    if (senderId == networkId) return;

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
      Uint8List.sublistView(body, 30),
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
    _send(packet, address, port);
    return true;
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

  Future<List<InternetAddress>> _directedBroadcastAddresses() async {
    try {
      final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
      );
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

  void _send(Uint8List body, InternetAddress address, int port) {
    final socket = _socket;
    if (socket == null) return;
    try {
      socket.send(NetherNetProtocol.encryptPacket(body), address, port);
    } catch (e) {
      if (_isLocalNetworkBlocked(e)) {
        _reportBlocked(e);
        return;
      }
      logger.error('NetherNet send failed: $e');
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
