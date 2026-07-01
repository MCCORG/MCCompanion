import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_client_base.dart';
import '../constants/app_constants.dart';

class AppNotification {
  final int id;
  final String type;
  final String? actorUsername;
  final String? actorAvatar;
  final String? targetType;
  final String? targetId;
  final String? targetName;
  final bool read;
  final DateTime createdAt;

  const AppNotification({
    required this.id,
    required this.type,
    this.actorUsername,
    this.actorAvatar,
    this.targetType,
    this.targetId,
    this.targetName,
    required this.read,
    required this.createdAt,
  });

  factory AppNotification.fromJson(Map<String, dynamic> j) => AppNotification(
        id: j['id'] as int,
        type: j['type'] as String,
        actorUsername: j['actor_username'] as String?,
        actorAvatar: j['actor_avatar'] as String?,
        targetType: j['target_type'] as String?,
        targetId: j['target_id'] as String?,
        targetName: j['target_name'] as String?,
        read: j['read'] as bool? ?? false,
        createdAt: DateTime.parse(j['created_at'] as String),
      );
}

class NotificationApiService {
  static const String _base = AppConstants.apiBase;
  static const Duration _timeout = Duration(seconds: 8);


  static Future<({List<AppNotification> notifications, int unreadCount})>
      getNotifications({int limit = 30}) async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/notifications').replace(queryParameters: {'limit': '$limit'}),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        final list = (body['notifications'] as List<dynamic>)
            .map((e) => AppNotification.fromJson(e as Map<String, dynamic>))
            .toList();
        return (
          notifications: list,
          unreadCount: (body['unreadCount'] as int?) ?? 0,
        );
      }
    } catch (_) {}
    return (notifications: <AppNotification>[], unreadCount: 0);
  }

  static Future<bool> markAllRead(List<int> ids) async {
    if (ids.isEmpty) return true;
    try {
      final res = await http
          .post(
            Uri.parse('$_base/api/notifications/read'),
            headers: await ApiClientBase.headers(),
            body: jsonEncode({'ids': ids}),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  static Future<Map<String, bool>> getPrefs() async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/notifications/prefs'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        final prefs = body['prefs'] as Map<String, dynamic>? ?? {};
        return prefs.map((k, v) => MapEntry(k, v as bool? ?? true));
      }
    } catch (_) {}
    return {};
  }

  static Future<Map<String, bool>?> updatePrefs(
      Map<String, bool> prefs) async {
    try {
      final res = await http
          .patch(
            Uri.parse('$_base/api/notifications/prefs'),
            headers: await ApiClientBase.headers(),
            body: jsonEncode(prefs),
          )
          .timeout(_timeout);
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        final updated = body['prefs'] as Map<String, dynamic>? ?? {};
        return updated.map((k, v) => MapEntry(k, v as bool? ?? true));
      }
    } catch (_) {}
    return null;
  }
}
