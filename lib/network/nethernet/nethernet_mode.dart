import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../util/logger.dart';
import '../bedrock_version.dart';
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
  void Function()? onLocalNetworkBlocked;

  final Completer<void> _firstClient = Completer<void>();
  final ValueNotifier<bool> clientSeen = ValueNotifier(false);

  NetherNetMode({required this.logger});

  bool get running => _discovery?.running ?? false;

  int get peerCount => _discovery?.peers.length ?? 0;

  Future<NetherNetModeResult> start({
    required String serverName,
    required String remoteHost,
    required int remotePort,
    String? relayHost,
    int relayPort = 8787,
    int playerCount = 0,
    int maxPlayerCount = 20,
  }) async {
    await stop();
    clientSeen.value = false;

    _relay = relayHost == null
        ? null
        : NetherNetRelayClient(host: relayHost, port: relayPort);

    await BedrockVersion.loadCached();
    final info = await _relay?.fetchInfo();
    if (info != null) {
      await BedrockVersion.update(
        protocol: info.protocol,
        gameVersion: info.version,
      );
      _log('Relay speaks protocol ${info.protocol} (${info.version})');
    }

    final discovery = NetherNetDiscovery(logger: logger);
    discovery.setAdvertisement(
      serverName: serverName,
      levelName: 'MCCompanion: $remoteHost',
      playerCount: playerCount,
      maxPlayerCount: maxPlayerCount,
    );

    discovery.onLocalNetworkBlocked = () => onLocalNetworkBlocked?.call();

    discovery.onDiscoveryRequest = (address, port, count) {
      clientSeen.value = true;
      if (!_firstClient.isCompleted) _firstClient.complete();
      if (count == 1) _log('Client found at ${address.address}');
    };

    discovery.onSignal = (signal) {
      switch (signal.type) {
        case NetherNetProtocol.signalConnectRequest:
          unawaited(_forwardOffer(discovery, signal));
        case NetherNetProtocol.signalCandidateAdd:
          unawaited(_forwardCandidate(signal));
        case NetherNetProtocol.signalConnectError:
          _log('Client reported a connect error');
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
      nonce: discovery.nonce,
    );

    if (result == null) {
      _log('Relay returned no answer');
      return;
    }

    final answerSent = discovery.sendSignal(
      recipientId: signal.senderId,
      type: NetherNetProtocol.signalConnectResponse,
      connectionId: signal.connectionId,
      payload: result.answer,
    );

    if (!answerSent) {
      _log('Could not send the relay answer to the client');
      return;
    }

    var candidatesSent = 0;
    for (final candidate in result.candidates) {
      final sent = discovery.sendSignal(
        recipientId: signal.senderId,
        type: NetherNetProtocol.signalCandidateAdd,
        connectionId: signal.connectionId,
        payload: candidate,
      );
      if (sent) candidatesSent++;
    }

    _log(
      'Client handed over to the relay (answer ${result.answer.length} bytes, '
      '$candidatesSent/${result.candidates.length} candidates sent)',
    );
  }

  Future<void> _forwardCandidate(NetherNetSignal signal) async {
    final relay = _relay;
    if (relay == null) return;
    final ok = await relay.sendCandidate(
      connectionId: signal.connectionId,
      candidate: signal.payload,
    );
    if (!ok) _log('Relay did not accept a client candidate');
  }

  Future<void> stop() async {
    _relay?.close();
    _relay = null;
    _scanTimer?.cancel();
    _scanTimer = null;
    await _discovery?.stop();
    _discovery = null;
    clientSeen.value = false;
  }

  void _log(String message) {
    final stamp = DateTime.now().toIso8601String().substring(11, 19);
    events.insert(0, '$stamp  $message');
    if (events.length > 50) events.removeLast();
    logger.info('[NetherNet] $message');
    onUpdate?.call();
  }
}
