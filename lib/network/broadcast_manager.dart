import 'dart:async';
import 'dart:convert';
import '../util/logger.dart';
import '../constants/app_constants.dart';
import '../services/region_detector.dart';
import '../services/relay_service.dart';
import 'relay_config_sender.dart';
import 'broadcast_mode.dart';

enum ConnectionErrorKind {
  blocked,
  configFailed,
  timeout,
  unreachable,
  hostNotFound,
  localPortBusy,
  addressNotSupported,
}

class ConnectionError {
  final ConnectionErrorKind kind;
  final String? reason;
  final int? statusCode;
  final String? detail;

  const ConnectionError._(
    this.kind, {
    this.reason,
    this.statusCode,
    this.detail,
  });

  factory ConnectionError.blocked({String? reason}) =>
      ConnectionError._(ConnectionErrorKind.blocked, reason: reason);
  factory ConnectionError.configFailed({
    required int statusCode,
    String? detail,
  }) => ConnectionError._(
    ConnectionErrorKind.configFailed,
    statusCode: statusCode,
    detail: detail,
  );
  factory ConnectionError.timeout() =>
      const ConnectionError._(ConnectionErrorKind.timeout);
  factory ConnectionError.unreachable() =>
      const ConnectionError._(ConnectionErrorKind.unreachable);
  factory ConnectionError.hostNotFound({String? reason}) =>
      ConnectionError._(ConnectionErrorKind.hostNotFound, reason: reason);
  factory ConnectionError.localPortBusy() =>
      const ConnectionError._(ConnectionErrorKind.localPortBusy);
  factory ConnectionError.addressNotSupported({String? reason}) =>
      ConnectionError._(
        ConnectionErrorKind.addressNotSupported,
        reason: reason,
      );
}

class BroadcastManager {
  late Logger logger;

  Function(ConnectionError error)? onConnectionError;

  BroadcastManager({required this.logger});

  String _relayNameForIp(String ip) {
    final relay = AppConstants.relayServers.firstWhere(
      (e) => e['ip'] == ip,
      orElse: () => {'name': ip},
    );
    return relay['name'] ?? ip;
  }

  static bool _worthRetryingElsewhere(RelayConfigResult result) =>
      result.statusCode < 0 || result.statusCode >= 500;

  Future<({RelayConfigResult result, String ip, String base})>
  _sendWithFailover({
    required String relayIp,
    required String relayBase,
    required Future<RelayConfigResult> Function(String base) send,
  }) async {
    final first = await send(relayBase);
    if (first.success || !_worthRetryingElsewhere(first)) {
      return (result: first, ip: relayIp, base: relayBase);
    }

    final next = RelaySelection.fromIp(
      relayIp,
      RelaySource.failover,
    )?.alternate;
    if (next == null) return (result: first, ip: relayIp, base: relayBase);

    final second = await send(next.base);
    if (!second.success) {
      return (result: first, ip: relayIp, base: relayBase);
    }

    RelayService.setRelay(next);
    return (result: second, ip: next.ip, base: next.base);
  }

  ConnectionError _connectionError(int statusCode, String responseBody) {
    if (statusCode == 403) {
      try {
        final parsed = json.decode(responseBody);
        if (parsed is Map &&
            parsed['message'] != null &&
            (parsed['message'] as String).trim().isNotEmpty) {
          return ConnectionError.blocked(
            reason: (parsed['message'] as String).trim(),
          );
        }
      } catch (_) {}
      return ConnectionError.blocked();
    }

    final detail = (responseBody.isNotEmpty && responseBody.length <= 200)
        ? responseBody.replaceAll('\n', ' ')
        : null;
    return ConnectionError.configFailed(statusCode: statusCode, detail: detail);
  }

  Future<bool> sendRelayConfigOnly(
    String remoteHost,
    int remotePort, {
    required String relayIp,
    required String relayBase,
    required BroadcastMode mode,
    String? bedrockGamertag,
    String? authToken,
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
          authToken: authToken,
          resourcePackUrl: resourcePackUrl,
          onDebug: (message) => logger.debug('Relay config\n$message'),
        ),
      );
      final result = attempt.result;

      if (result.success) {
        return true;
      } else {
        final relayError = _connectionError(result.statusCode, result.body);
        logger.error(
          'Relay rejected request (status ${result.statusCode}): ${result.body}',
        );
        onConnectionError?.call(relayError);
        return false;
      }
    } on TimeoutException catch (te) {
      logger.warning('Timeout when sending config to $relayBase: $te');
      onConnectionError?.call(ConnectionError.timeout());
      return false;
    } catch (e, st) {
      logger.error('Error sending config to $relayBase: $e\n$st');
      onConnectionError?.call(ConnectionError.unreachable());
      return false;
    }
  }
}
