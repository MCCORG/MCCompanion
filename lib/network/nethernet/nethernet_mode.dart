import 'dart:async';

import '../../util/logger.dart';
import 'nethernet_discovery.dart';
import 'nethernet_protocol.dart';
import 'nethernet_relay_client.dart';

class NetherNetModeResult {
  final bool started;
  final String? error;

  const NetherNetModeResult(this.started, [this.error]);
}

class NetherNetMode {
  final Logger logger;
  NetherNetDiscovery? _discovery;
  NetherNetRelayClient? _relay;
  Timer? _scanTimer;

  final List<String> events = [];
  void Function()? onUpdate;

  final Completer<void> _firstClient = Completer<void>();

  NetherNetMode({required this.logger});

  bool get running => _discovery?.running ?? false;

  int get peerCount => _discovery?.peers.length ?? 0;

  Future<NetherNetModeResult> start({
    required String serverName,
    required String remoteHost,
    required int remotePort,
    String? relayHost,
    int relayPort = 8787,
  }) async {
    await stop();

    _relay = relayHost == null
        ? null
        : NetherNetRelayClient(host: relayHost, port: relayPort);

    final discovery = NetherNetDiscovery(logger: logger);
    discovery.setAdvertisement(
      serverName: serverName,
      levelName: '$remoteHost:$remotePort',
      playerCount: 0,
      maxPlayerCount: 20,
    );

    discovery.onDiscoveryRequest = (address, port, count) {
      if (!_firstClient.isCompleted) _firstClient.complete();
      if (count == 1) _log('Client found at ${address.address}');
    };

    discovery.onSignal = (signal) {
      if (signal.type == NetherNetProtocol.signalConnectRequest) {
        unawaited(_forwardOffer(discovery, signal));
      }
    };

    final ok = await discovery.start();
    if (!ok) {
      return const NetherNetModeResult(
        false,
        'Could not bind port 7551. Is something already using it?',
      );
    }

    _discovery = discovery;
    _scanTimer = Timer.periodic(
      const Duration(seconds: 2),
      (_) => discovery.broadcastAdvertisement(),
    );
    _log('Broadcasting as "$serverName"');
    return const NetherNetModeResult(true);
  }

  Future<bool> waitForClient(Duration timeout) async {
    if (_firstClient.isCompleted) return true;
    try {
      await _firstClient.future.timeout(timeout);
      return true;
    } on TimeoutException {
      return false;
    }
  }

  Future<void> _forwardOffer(
    NetherNetDiscovery discovery,
    NetherNetSignal signal,
  ) async {
    final relay = _relay;
    if (relay == null) {
      _log('No relay configured, cannot forward the offer');
      return;
    }

    final result = await relay.sendOffer(
      connectionId: signal.connectionId,
      networkId: signal.senderId,
      sdp: signal.payload,
    );

    if (result == null) {
      _log('Relay returned no answer');
      return;
    }

    discovery.sendSignal(
      recipientId: signal.senderId,
      type: NetherNetProtocol.signalConnectResponse,
      connectionId: signal.connectionId,
      payload: result.answer,
    );

    for (final candidate in result.candidates) {
      discovery.sendSignal(
        recipientId: signal.senderId,
        type: NetherNetProtocol.signalCandidateAdd,
        connectionId: signal.connectionId,
        payload: candidate,
      );
    }

    _log('Client handed over to the relay');
  }

  Future<void> stop() async {
    _relay?.close();
    _relay = null;
    _scanTimer?.cancel();
    _scanTimer = null;
    await _discovery?.stop();
    _discovery = null;
  }

  void _log(String message) {
    final stamp = DateTime.now().toIso8601String().substring(11, 19);
    events.insert(0, '$stamp  $message');
    if (events.length > 50) events.removeLast();
    logger.info('[NetherNet] $message');
    onUpdate?.call();
  }
}
