import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_client_base.dart';
import 'feedback_service.dart';
import '../constants/app_constants.dart';
import '../models/message_model.dart';

class SupportService {
  static const String _base = AppConstants.apiBase;
  static const Duration _timeout = Duration(seconds: 10);

  static Future<List<FeedbackTicket>> tickets({bool includeClosed = false}) async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/admin/feedback?state=${includeClosed ? 'all' : 'open'}&limit=200'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode != 200) return [];
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      return ((data['tickets'] as List?) ?? [])
          .cast<Map<String, dynamic>>()
          .map(FeedbackTicket.fromJson)
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<List<FeedbackMessage>> ticketMessages(int ticketId) async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/admin/feedback/$ticketId/messages'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode != 200) return [];
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      return ((data['messages'] as List?) ?? [])
          .cast<Map<String, dynamic>>()
          .map(FeedbackMessage.fromJson)
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<FeedbackMessage?> replyToTicket(int ticketId, String body) async {
    try {
      final res = await http
          .post(
            Uri.parse('$_base/api/admin/feedback/$ticketId/messages'),
            headers: await ApiClientBase.headers(),
            body: jsonEncode({'body': body}),
          )
          .timeout(_timeout);
      if (res.statusCode != 201) return null;
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      return FeedbackMessage.fromJson(data['message'] as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  static Future<FeedbackTicket?> setTicketStatus(int ticketId, String status) async {
    try {
      final res = await http
          .patch(
            Uri.parse('$_base/api/admin/feedback/$ticketId'),
            headers: await ApiClientBase.headers(),
            body: jsonEncode({'status': status}),
          )
          .timeout(_timeout);
      if (res.statusCode != 200) return null;
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      return FeedbackTicket.fromJson(data['ticket'] as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

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
