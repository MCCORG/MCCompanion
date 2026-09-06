import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'auth_service.dart';
import '../constants/app_constants.dart';
import 'relay_service.dart';

class PresenceService {
  static int _failCount = 0;

  static String get _wsBase {
    final preferred = RelayService.wsBase;
    if ((_failCount ~/ 2) % 2 == 0) return preferred;
    final alt = AppConstants.relayServers.firstWhere(
      (r) => r['base'] != preferred,
      orElse: () => AppConstants.relayServers.first,
    );
    return alt['base']!;
  }

  static WebSocketChannel? _channel;
  static StreamSubscription<dynamic>? _sub;

  static final _presenceController =
      StreamController<({String uid, bool online})>.broadcast();
  static Stream<({String uid, bool online})> get presenceStream =>
      _presenceController.stream;

  static bool _connected = false;
  static Timer? _reconnectTimer;

  static Future<void> connect() async {
    if (_connected) return;
    final token = await AuthService.getIdToken();
    if (token == null) return;

    try {
      _channel = WebSocketChannel.connect(
        Uri.parse('$_wsBase/ws?token=${Uri.encodeComponent(token)}'),
      );
      _connected = true;
      _reconnectTimer?.cancel();

      _sub = _channel!.stream.listen(
        (raw) {
          _failCount = 0;
          try {
            final json = jsonDecode(raw as String) as Map<String, dynamic>;
            final type = json['type'] as String?;
            if (type == 'presence') {
              _presenceController.add((
                uid: json['uid'] as String,
                online: json['online'] as bool,
              ));
            } else if (type == 'ping') {
              _channel?.sink.add(jsonEncode({'type': 'pong'}));
            }
          } catch (e) {
            debugPrint('[PresenceService.connect] parse error: $e');
          }
        },
        onDone: _scheduleReconnect,
        onError: (_) => _scheduleReconnect(),
      );
    } catch (e) {
      debugPrint('[PresenceService.connect] $e');
      _connected = false;
      _scheduleReconnect();
    }
  }

  static const List<int> _backoffSeconds = [5, 10, 20, 40, 60];

  static void _scheduleReconnect() {
    _connected = false;
    if (_failCount < 1000) _failCount++;
    _sub?.cancel();
    _channel = null;
    _reconnectTimer?.cancel();
    final index = (_failCount - 1).clamp(0, _backoffSeconds.length - 1);
    _reconnectTimer = Timer(
      Duration(seconds: _backoffSeconds[index]),
      connect,
    );
  }

  static Future<void> reconnectIfNeeded() async {
    if (!_connected) {
      _reconnectTimer?.cancel();
      await connect();
    }
  }

  static void disconnect() {
    _reconnectTimer?.cancel();
    _sub?.cancel();
    _channel?.sink.close();
    _channel = null;
    _connected = false;
  }
}
