import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_client_base.dart';
import '../constants/app_constants.dart';
import '../models/message_model.dart';

class SupportService {
  static const String _base = AppConstants.apiBase;
  static const Duration _timeout = Duration(seconds: 10);

  static Future<List<ConversationModel>> getConversations() async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/admin/support/conversations'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode != 200) return [];
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      return ((data['conversations'] as List?) ?? [])
          .cast<Map<String, dynamic>>()
          .map(ConversationModel.fromJson)
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<
    ({List<MessageModel> messages, String? supportUid, Map<int, String> sentBy})
  >
  getMessages(String username) async {
    try {
      final res = await http
          .get(
            Uri.parse(
              '$_base/api/admin/support/messages/${Uri.encodeComponent(username)}',
            ),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode != 200) {
        return (
          messages: <MessageModel>[],
          supportUid: null,
          sentBy: <int, String>{},
        );
      }
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      final raw = ((data['messages'] as List?) ?? [])
          .cast<Map<String, dynamic>>();
      final sentBy = <int, String>{};
      final messages = raw.map((j) {
        final m = MessageModel.fromJson(j);
        final by = j['sentByUsername'] as String?;
        if (by != null) sentBy[m.id] = by;
        return m;
      }).toList();
      return (
        messages: messages,
        supportUid: data['supportUid'] as String?,
        sentBy: sentBy,
      );
    } catch (_) {
      return (
        messages: <MessageModel>[],
        supportUid: null,
        sentBy: <int, String>{},
      );
    }
  }

  static Future<bool> send(String username, String content) async {
    try {
      final res = await http
          .post(
            Uri.parse(
              '$_base/api/admin/support/messages/${Uri.encodeComponent(username)}',
            ),
            headers: await ApiClientBase.headers(),
            body: jsonEncode({'content': content}),
          )
          .timeout(_timeout);
      return res.statusCode == 201;
    } catch (_) {
      return false;
    }
  }
}
