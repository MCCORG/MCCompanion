import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:wakelock_plus/wakelock_plus.dart';
import '../util/logger.dart';
import '../constants/app_constants.dart';
import '../services/region_detector.dart';
import '../services/relay_service.dart';
import 'socket_handler.dart';
import 'relay_config_sender.dart';
import 'package:flutter/widgets.dart';
import 'broadcast_mode.dart';

enum RelayErrorKind { blocked, configFailed, timeout, unreachable }

class RelayError {
  final RelayErrorKind kind;
  final String? reason;
  final int? statusCode;
  final String? detail;

  const RelayError._(this.kind, {this.reason, this.statusCode, this.detail});

  factory RelayError.blocked({String? reason}) =>
      RelayError._(RelayErrorKind.blocked, reason: reason);
  factory RelayError.configFailed({required int statusCode, String? detail}) =>
      RelayError._(
        RelayErrorKind.configFailed,
        statusCode: statusCode,
        detail: detail,
      );
  factory RelayError.timeout() => const RelayError._(RelayErrorKind.timeout);
  factory RelayError.unreachable() =>
      const RelayError._(RelayErrorKind.unreachable);
}

class BroadcastManager {
  late Logger logger;

  final SocketHandler socketHandler;

  RawDatagramSocket? _socketIPv4;
  StreamSubscription<RawSocketEvent>? _subscriptionIPv4;

  bool _isBroadcasting = false;

  Function()? onAutoDisconnect;
  Function(RelayError error)? onRelayError;

  BroadcastManager({required this.socketHandler, required this.logger}) {
    socketHandler.onAllClientsDisconnected = _handleAllClientsDisconnected;
  }

  bool get isBroadcasting => _isBroadcasting;

  void _handleAllClientsDisconnected() {
    logger.info('No active clients, auto-stopping broadcast...');
    stopBroadcast();
    onAutoDisconnect?.call();
  }

  String _relayNameForIp(String ip) {
    final relay = AppConstants.relayServers.firstWhere(
      (e) => e['ip'] == ip,
      orElse: () => {'name': ip},
    );
    return relay['name'] ?? ip;
  }

  static bool _worthRetryingElsewhere(RelayConfigResult result) =>
      result.statusCode < 0 || result.statusCode >= 500;

  Future<({RelayConfigResult result, String ip, String base})> _sendWithFailover({
    required String relayIp,
    required String relayBase,
    required Future<RelayConfigResult> Function(String base) send,
  }) async {
    final first = await send(relayBase);
    if (first.success || !_worthRetryingElsewhere(first)) {
      return (result: first, ip: relayIp, base: relayBase);
    }

    final next = RelaySelection.fromIp(relayIp, RelaySource.failover)?.alternate;
    if (next == null) return (result: first, ip: relayIp, base: relayBase);

    final second = await send(next.base);
    if (!second.success) {
      return (result: first, ip: relayIp, base: relayBase);
    }

    RelayService.setRelay(next);
    return (result: second, ip: next.ip, base: next.base);
  }

  Future<List<String>> _getLocalIPAddresses() async {
    List<String> ipAddresses = [];
    try {
      for (var interface in await NetworkInterface.list(
        includeLinkLocal: false,
        type: InternetAddressType.IPv4,
      )) {
        for (var addr in interface.addresses) {
          if (addr.type == InternetAddressType.IPv4 &&
              !addr.isLoopback &&
              !addr.isLinkLocal) {
            ipAddresses.add('${addr.address} (${interface.name})');
          }
        }
      }
    } catch (e) {
      logger.error('Error getting local IP addresses: $e');
    }
    return ipAddresses;
  }

  void _logLocalIPAddresses() async {
    final addresses = await _getLocalIPAddresses();
    if (addresses.isNotEmpty) {
      logger.info('══════════════════════════════════════════');
      logger.info('📱 DEVICE IP ADDRESSES (for manual connection):');
      for (var addr in addresses) {
        logger.info(' IP: $addr');
      }
      logger.info(' Port: ${SocketHandler.proxyPort}');
      logger.info('══════════════════════════════════════════');
    } else {
      logger.info('⚠️ Could not determine local IP addresses');
    }
  }

  RelayError _relayError(int statusCode, String responseBody) {
    if (statusCode == 403) {
      try {
        final parsed = json.decode(responseBody);
        if (parsed is Map &&
            parsed['message'] != null &&
            (parsed['message'] as String).trim().isNotEmpty) {
          return RelayError.blocked(
            reason: (parsed['message'] as String).trim(),
          );
        }
      } catch (_) {}
      return RelayError.blocked();
    }

    final detail = (responseBody.isNotEmpty && responseBody.length <= 200)
        ? responseBody.replaceAll('\n', ' ')
        : null;
    return RelayError.configFailed(statusCode: statusCode, detail: detail);
  }

  Future<bool> sendRelayConfigOnly(
    String remoteHost,
    int remotePort, {
    required String relayIp,
    required String relayBase,
    required BroadcastMode mode,
    String? bedrockGamertag,
    String? resourcePackUrl,
  }) async {
    final usedRelayName = _relayNameForIp(relayIp);

    logger.info(
      'Sending config (DNS mode) to MCCompanion server "$usedRelayName" ($relayIp) via API $relayBase...',
    );

    try {
      final attempt = await _sendWithFailover(
        relayIp: relayIp,
        relayBase: relayBase,
        send: (base) => RelayConfigSender.sendConfigSimple(
          base: base,
          remoteServerIp: remoteHost,
          remoteServerPort: remotePort,
          mode: mode,
          bedrockGamertag: bedrockGamertag,
          resourcePackUrl: resourcePackUrl,
          onDebug: (message) => logger.debug('Relay config\n$message'),
        ),
      );
      final result = attempt.result;

      if (result.success) {
        return true;
      } else {
        final relayError = _relayError(result.statusCode, result.body);
        logger.error(
          'Relay rejected request (status ${result.statusCode}): ${result.body}',
        );
        onRelayError?.call(relayError);
        return false;
      }
    } on TimeoutException catch (te) {
      logger.warning('Timeout when sending config to $relayBase: $te');
      onRelayError?.call(RelayError.timeout());
      return false;
    } catch (e, st) {
      logger.error('Error sending config to $relayBase: $e\n$st');
      onRelayError?.call(RelayError.unreachable());
      return false;
    }
  }

  Future<bool> startBroadcast(
    String remoteHost,
    int remotePort, {
    required String relayIp,
    required String relayBase,
    bool isJava = false,
    required BroadcastMode mode,
    String? bedrockGamertag,
    String? authToken,
    String? resourcePackUrl,
  }) async {
    const relayPort = 19132;
    final usedRelayName = _relayNameForIp(relayIp);

    logger.info(
      'Sending config to MCCompanion server "$usedRelayName" (socket target: $relayIp) via API $relayBase...',
    );

    try {
      final attempt = await _sendWithFailover(
        relayIp: relayIp,
        relayBase: relayBase,
        send: (base) => RelayConfigSender.sendConfigSimple(
          base: base,
          remoteServerIp: remoteHost,
          remoteServerPort: remotePort,
          mode: mode,
          bedrockGamertag: bedrockGamertag,
          authToken: authToken,
          resourcePackUrl: resourcePackUrl,
          onDebug: (message) => logger.debug('Relay config\n$message'),
        ),
      );
      final result = attempt.result;

      if (!result.success) {
        final relayError = _relayError(result.statusCode, result.body);
        logger.error(
          'Relay rejected request (status ${result.statusCode}): ${result.body}',
        );
        onRelayError?.call(relayError);
        return false;
      }

      await Future.delayed(const Duration(milliseconds: 200));

      final relayAddress = InternetAddress(attempt.ip);
      logger.info(
        'Connecting to MCCompanion servers (UDP target: ${relayAddress.address})',
      );
      logger.info('MCCompanion will forward to $remoteHost:$remotePort');

      socketHandler.setRemoteIp(relayAddress);
      socketHandler.setRemotePort(relayPort);

      await stopBroadcast();

      _socketIPv4 = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        SocketHandler.proxyPort,
      );
      _socketIPv4!.broadcastEnabled = true;
      logger.info(
        'UDP broadcast socket started on 0.0.0.0 (${SocketHandler.proxyPort})',
      );

      socketHandler.setBroadcasting(true);

      _subscriptionIPv4 = _socketIPv4!.listen(
        (event) => socketHandler.handleSocketEvent(_socketIPv4!, event),
        onError: (e, st) => logger.error('Socket error: $e'),
        cancelOnError: false,
      );

      _isBroadcasting = true;
      logger.info('MCCompanion started broadcasting');
      _logLocalIPAddresses();

      return true;
    } on TimeoutException catch (te) {
      logger.warning('Timeout when sending config to $relayBase: $te');
      onRelayError?.call(RelayError.timeout());
      return false;
    } catch (e, st) {
      logger.error('Error sending config to $relayBase: $e\n$st');
      onRelayError?.call(RelayError.unreachable());
      return false;
    }
  }

  Future<void> stopBroadcast() async {
    await _subscriptionIPv4?.cancel();
    _subscriptionIPv4 = null;

    _socketIPv4?.close();
    _socketIPv4 = null;

    socketHandler.closeAllClientSockets();
    socketHandler.setBroadcasting(false);

    _isBroadcasting = false;
    logger.info('MCCompanion stopped.');

    if (WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
      try {
        await WakelockPlus.disable();
      } catch (e) {
        logger.error('WakelockPlus disable error: $e');
      }
    } else {
      logger.debug('Wakelock not disabled: no foreground activity.');
    }
  }
}
