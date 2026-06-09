import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';
import '../models/message_model.dart';
import 'auth_service.dart';
import '../constants/app_constants.dart';
import 'relay_service.dart';

class MessageService {
  static const String _base = AppConstants.apiBase;
  static String get _wsBase => RelayService.wsBase;

  static WebSocketChannel? _channel;
  static StreamSubscription<dynamic>? _sub;
  static final _incoming = StreamController<MessageModel>.broadcast();
  static Stream<MessageModel> get incoming => _incoming.stream;

  static final _presenceController =
      StreamController<({String uid, bool online})>.broadcast();
  static Stream<({String uid, bool online})> get presenceStream =>
      _presenceController.stream;

  static bool _connected = false;
  static Timer? _reconnectTimer;

  static Future<Map<String, String>> _headers() async {
    final token = await AuthService.getIdToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

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
          try {
            final json = jsonDecode(raw as String) as Map<String, dynamic>;
            final type = json['type'] as String?;
            if (type == 'message') {
              _incoming.add(
                MessageModel.fromJson(json['data'] as Map<String, dynamic>),
              );
            } else if (type == 'presence') {
              _presenceController.add((
                uid: json['uid'] as String,
                online: json['online'] as bool,
              ));
            } else if (type == 'ping') {
              _channel?.sink.add(jsonEncode({'type': 'pong'}));
            }
          } catch (_) {}
        },
        onDone: _scheduleReconnect,
        onError: (_) => _scheduleReconnect(),
      );
    } catch (_) {
      _connected = false;
      _scheduleReconnect();
    }
  }

  static void _scheduleReconnect() {
    _connected = false;
    _sub?.cancel();
    _channel = null;
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 5), connect);
  }

  /// Call this when the app returns to foreground to ensure the connection
  /// is alive (Android kills WebSockets when backgrounded).
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

  static Future<List<ConversationModel>> getConversations() async {
    try {
      final resp = await http.get(
        Uri.parse('$_base/api/messages/conversations'),
        headers: await _headers(),
      );
      if (resp.statusCode != 200) return [];
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      return (data['conversations'] as List)
          .map((e) => ConversationModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<List<MessageModel>> getMessages(
    String username, {
    String? before,
  }) async {
    try {
      final uri = Uri.parse(
        '$_base/api/messages/$username',
      ).replace(queryParameters: {if (before != null) 'before': before});
      final resp = await http.get(uri, headers: await _headers());
      if (resp.statusCode != 200) return [];
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      return (data['messages'] as List)
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<MessageModel?> sendMessage(
    String username,
    String content,
  ) async {
    try {
      final resp = await http.post(
        Uri.parse('$_base/api/messages/$username'),
        headers: await _headers(),
        body: jsonEncode({'content': content}),
      );
      if (resp.statusCode != 201) return null;
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      return MessageModel.fromJson(data['message'] as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  static Future<void> markRead(String username) async {
    try {
      await http.patch(
        Uri.parse('$_base/api/messages/$username/read'),
        headers: await _headers(),
      );
    } catch (_) {}
  }
}
