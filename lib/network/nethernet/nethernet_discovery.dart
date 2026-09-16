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

  Future<bool> start() async {
    if (_socket != null) return true;
    try {
      final socket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        NetherNetProtocol.discoveryPort,
        reuseAddress: true,
        reusePort: Platform.isIOS || Platform.isMacOS,
      );
      socket.broadcastEnabled = true;
      _socket = socket;
      _subscription = socket.listen(
        _onEvent,
        onError: (Object e) =>
            logger.error('NetherNet discovery socket error: $e'),
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

  Future<void> stop() async {
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
    if (body.length < 30) return;
    final view = ByteData.view(body.buffer, body.offsetInBytes, body.length);
    final recipientId = view.getUint64(18, Endian.little);
    if (recipientId != networkId && recipientId != 0) return;

    final declared = view.getUint32(26, Endian.little);
    final available = body.length - 30;
    if (available <= 0 || available < declared) return;

    final message = utf8.decode(
      Uint8List.sublistView(body, 30),
      allowMalformed: true,
    );
    if (message == 'Ping') return;

    final parts = message.split(' ');
    if (parts.length < 2) return;

    final connectionId = int.tryParse(parts[1]);
    if (connectionId == null) return;

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

  void sendSignal({
    required int recipientId,
    required String type,
    required int connectionId,
    required String payload,
  }) {
    final address = _peers[recipientId];
    final port = _peerPorts[recipientId];
    if (address == null || port == null) return;

    final message = payload.isEmpty
        ? '$type $connectionId'
        : '$type $connectionId $payload';

    final packet = NetherNetProtocol.buildDiscoveryPacket(
      packetId: NetherNetProtocol.idDiscoveryMessage,
      networkId: networkId,
      tail: NetherNetProtocol.buildMessageTail(
        recipientId: recipientId,
        message: message,
      ),
    );
    _send(packet, address, port);
  }

  void broadcastAdvertisement() {
    final pong = _pongData;
    if (pong == null) return;
    final packet = NetherNetProtocol.buildDiscoveryPacket(
      packetId: NetherNetProtocol.idDiscoveryResponse,
      networkId: networkId,
      tail: pong,
    );
    _send(
      packet,
      InternetAddress('255.255.255.255'),
      NetherNetProtocol.discoveryPort,
    );
  }

  void _send(Uint8List body, InternetAddress address, int port) {
    final socket = _socket;
    if (socket == null) return;
    try {
      socket.send(NetherNetProtocol.encryptPacket(body), address, port);
    } catch (e) {
      logger.error('NetherNet send failed: $e');
    }
  }
}
