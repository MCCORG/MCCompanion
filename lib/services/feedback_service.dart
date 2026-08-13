import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'api_client_base.dart';
import '../constants/app_constants.dart';

class FeedbackService {
  static const String _base = AppConstants.apiBase;
  static const Duration _timeout = Duration(seconds: 10);

  static final ValueNotifier<int> unreadTickets = ValueNotifier(0);

  static String get _platform {
    if (Platform.isAndroid) return 'android';
    if (Platform.isIOS) return 'ios';
    if (Platform.isWindows) return 'windows';
    if (Platform.isMacOS) return 'macos';
    return 'other';
  }

  static Future<({bool ok, int? issueNumber, String? issueUrl})> submit({
    required String type,
    required String title,
    required String description,
    String? appVersion,
  }) async {
    try {
      final res = await http
          .post(
            Uri.parse('$_base/api/feedback'),
            headers: await ApiClientBase.headers(),
            body: jsonEncode({
              'type': type,
              'title': title,
              'description': description,
              'platform': _platform,
              'appVersion': ?appVersion,
            }),
          )
          .timeout(_timeout);

      if (res.statusCode == 201) {
        final data = jsonDecode(res.body) as Map<String, dynamic>;
        return (
          ok: true,
          issueNumber: data['issueNumber'] as int?,
          issueUrl: data['issueUrl'] as String?,
        );
      }
      return (ok: false, issueNumber: null, issueUrl: null);
    } catch (_) {
      return (ok: false, issueNumber: null, issueUrl: null);
    }
  }

  static Future<List<FeedbackTicket>> myTickets() async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/feedback/me'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode != 200) return [];
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      final tickets = (data['tickets'] as List)
          .map((e) => FeedbackTicket.fromJson(e as Map<String, dynamic>))
          .toList();
      unreadTickets.value =
          data['unreadTotal'] as int? ??
          tickets.fold(0, (sum, t) => sum + t.unread);
      return tickets;
    } catch (_) {
      return [];
    }
  }

  static Future<List<FeedbackMessage>> messages(int ticketId) async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/feedback/$ticketId/messages'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode != 200) return [];
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      return (data['messages'] as List)
          .map((e) => FeedbackMessage.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<FeedbackMessage?> reply(int ticketId, String body) async {
    try {
      final res = await http
          .post(
            Uri.parse('$_base/api/feedback/$ticketId/messages'),
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
}

class FeedbackTicket {
  final int id;
  final String? uid;
  final String? username;
  final String type;
  final String title;
  final String description;
  final String status;
  final String? platform;
  final String? appVersion;
  final DateTime createdAt;

  final int unread;

  const FeedbackTicket({
    required this.id,
    required this.uid,
    required this.username,
    required this.type,
    required this.title,
    required this.description,
    required this.status,
    required this.platform,
    required this.appVersion,
    required this.createdAt,
    this.unread = 0,
  });

  bool get isBug => type == 'bug';
  bool get isClosed =>
      status == 'implemented' ||
      status == 'not_planned' ||
      status == 'duplicate';

  factory FeedbackTicket.fromJson(Map<String, dynamic> j) => FeedbackTicket(
    id: j['id'] as int,
    uid: j['uid'] as String?,
    username: j['username'] as String?,
    type: j['type'] as String? ?? 'bug',
    title: j['title'] as String? ?? '',
    description: j['description'] as String? ?? '',
    status: j['status'] as String? ?? 'open',
    platform: j['platform'] as String?,
    appVersion: j['appVersion'] as String?,
    createdAt:
        DateTime.tryParse(j['createdAt'] as String? ?? '') ?? DateTime.now(),
    unread: j['unread'] as int? ?? 0,
  );

  FeedbackTicket copyWith({int? unread}) => FeedbackTicket(
    id: id,
    uid: uid,
    username: username,
    type: type,
    title: title,
    description: description,
    status: status,
    platform: platform,
    appVersion: appVersion,
    createdAt: createdAt,
    unread: unread ?? this.unread,
  );
}

class FeedbackMessage {
  final int id;
  final String body;
  final bool fromAdmin;
  final DateTime createdAt;

  const FeedbackMessage({
    required this.id,
    required this.body,
    required this.fromAdmin,
    required this.createdAt,
  });

  factory FeedbackMessage.fromJson(Map<String, dynamic> j) => FeedbackMessage(
    id: j['id'] as int,
    body: j['body'] as String? ?? '',
    fromAdmin: j['fromAdmin'] as bool? ?? false,
    createdAt:
        DateTime.tryParse(j['createdAt'] as String? ?? '') ?? DateTime.now(),
  );
}
