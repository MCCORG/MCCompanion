import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:async';
import '../util/logger.dart';

class _ClientState {
  final RawDatagramSocket socket;
  final InternetAddress address;
  final int port;
  DateTime lastActivity;

  _ClientState({
    required this.socket,
    required this.address,
    required this.port,
    required this.lastActivity,
  });
}

class SocketHandler {
  final Logger logger;
  SocketHandler({required this.logger});

  static const int proxyPort = 19132;
  static const String serverName = 'MCCompanion';
  static const int protocolVersion = 1;
  static const String gameVersion = '1';
  static const int onlinePlayers = 1;
  static const int maxPlayers = 10;
  static final BigInt serverId = BigInt.parse('18403264178514827767');
  static const String levelName = 'MCCompanion';
  static const String gameMode = 'Survival';
  static const int gameModeId = 1;
  static const Duration clientTimeout = Duration(seconds: 30);
  static const Duration checkInterval = Duration(seconds: 5);

  static final Uint8List magicBytes = Uint8List.fromList([
    0x00,
    0xff,
    0xff,
    0x00,
    0xfe,
    0xfe,
    0xfe,
    0xfe,
    0xfd,
    0xfd,
    0xfd,
    0xfd,
    0x12,
    0x34,
    0x56,
    0x78,
  ]);

  static final Uint8List _serverGuidBytes = () {
    final bd = ByteData(8)..setUint64(0, serverId.toInt(), Endian.big);
    return bd.buffer.asUint8List();
  }();

  bool _broadcasting = false;
  InternetAddress? _remoteIp;
  int _remotePort = 19132;

  final Map<String, _ClientState> _clients = {};

  final Set<String> _pendingClients = {};

  Timer? _timeoutCheckTimer;
  Function()? onAllClientsDisconnected;

  void setBroadcasting(bool broadcasting) {
    _broadcasting = broadcasting;
    broadcasting ? _startTimeoutChecker() : _stopTimeoutChecker();
  }

  void setRemoteIp(InternetAddress ip) => _remoteIp = ip;
  void setRemotePort(int port) => _remotePort = port;

  void _startTimeoutChecker() {
    _timeoutCheckTimer?.cancel();
    _timeoutCheckTimer = Timer.periodic(
      checkInterval,
      (_) => _checkClientTimeouts(),
    );
    logger.debug('Client timeout checker started');
  }

  void _stopTimeoutChecker() {
    _timeoutCheckTimer?.cancel();
    _timeoutCheckTimer = null;
  }

  void _checkClientTimeouts() {
    if (_clients.isEmpty) return;

    final now = DateTime.now();

    final timedOut = [
      for (final entry in _clients.entries)
        if (now.difference(entry.value.lastActivity) > clientTimeout) entry.key,
    ];

    for (final key in timedOut) {
      logger.info(
        'Client $key timed out (inactive for '
        '${now.difference(_clients[key]!.lastActivity).inSeconds}s)',
      );
      _removeClient(key);
    }

    if (_clients.isEmpty && timedOut.isNotEmpty) {
      logger.info('All clients disconnected');
      onAllClientsDisconnected?.call();
    }
  }

  void _removeClient(String clientKey) {
    _clients[clientKey]?.socket.close();
    _clients.remove(clientKey);
    logger.debug('Removed client: $clientKey');
  }

  Uint8List _createOfflinePong(Uint8List pingPayload) {
    final motdString =
        'MCPE;$serverName;$protocolVersion;$gameVersion;'
        '$onlinePlayers;$maxPlayers;$serverId;$levelName;'
        '$gameMode;$gameModeId;$proxyPort;$proxyPort;';

    final motdBytes = utf8.encode(motdString);
    final motdLength = ByteData(2)..setUint16(0, motdBytes.length, Endian.big);

    return (BytesBuilder()
          ..add([0x1c])
          ..add(pingPayload)
          ..add(_serverGuidBytes)
          ..add(magicBytes)
          ..add(motdLength.buffer.asUint8List())
          ..add(motdBytes))
        .toBytes();
  }

  void handleSocketEvent(RawDatagramSocket socket, RawSocketEvent event) {
    if (event != RawSocketEvent.read) return;

    final dg = socket.receive();
    if (dg == null) return;

    final data = dg.data;
    if (data.isEmpty) return;

    final clientKey = '${dg.address.address}:${dg.port}';

    if (data[0] == 0x01 && data.length >= 9) {
      final pongPacket = _createOfflinePong(Uint8List.sublistView(data, 1, 9));
      socket.send(pongPacket, dg.address, dg.port);
      logger.debug('Responded to ping from $clientKey');
      return;
    }

    if (_broadcasting &&
        _remoteIp != null &&
        dg.address.address == _remoteIp!.address &&
        dg.port == _remotePort) {
      for (final state in _clients.values) {
        if (socket.address.type == state.address.type) {
          socket.send(data, state.address, state.port);
          logger.debug(
            '[SERVER → CLIENT] $_remoteIp:$_remotePort → '
            '${state.address.address}:${state.port} | ${data.length} bytes',
          );
        } else {
          logger.debug(
            'Skipping send to ${state.address.address} due to IP version mismatch',
          );
        }
      }
      return;
    }

    final existing = _clients[clientKey];
    if (existing != null) {
      existing.lastActivity = DateTime.now();
      if (_broadcasting && _remoteIp != null) {
        existing.socket.send(data, _remoteIp!, _remotePort);
        logger.debug(
          '[CLIENT → SERVER] $clientKey → $_remoteIp:$_remotePort | ${data.length} bytes',
        );
      }
      return;
    }

    if (_pendingClients.contains(clientKey)) return;
    _pendingClients.add(clientKey);

    RawDatagramSocket.bind(InternetAddress.anyIPv4, 0)
        .then((serverSocket) {
          _pendingClients.remove(clientKey);

          final state = _ClientState(
            socket: serverSocket,
            address: dg.address,
            port: dg.port,
            lastActivity: DateTime.now(),
          );
          _clients[clientKey] = state;
          logger.info('New client connected: $clientKey');

          serverSocket.listen((serverEvent) {
            if (serverEvent != RawSocketEvent.read) return;
            final resp = serverSocket.receive();
            if (resp == null) return;
            socket.send(resp.data, state.address, state.port);
            state.lastActivity = DateTime.now();
            logger.debug(
              '[SERVER → CLIENT] $_remoteIp:$_remotePort → $clientKey | ${resp.data.length} bytes',
            );
          });

          if (_broadcasting && _remoteIp != null) {
            serverSocket.send(data, _remoteIp!, _remotePort);
            logger.debug(
              '[CLIENT → SERVER] $clientKey → $_remoteIp:$_remotePort | ${data.length} bytes',
            );
          }
        })
        .catchError((e, st) {
          _pendingClients.remove(clientKey);
          logger.error('Failed to create socket for $clientKey: $e\n$st');
        });
  }

  void closeAllClientSockets() {
    _stopTimeoutChecker();
    _pendingClients.clear();
    for (final state in _clients.values) {
      state.socket.close();
    }
    _clients.clear();
    logger.debug('All client sockets closed and cleared.');
  }

  bool get isBroadcasting => _broadcasting;
  int get activeClientCount => _clients.length;
}
