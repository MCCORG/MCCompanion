import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import '../services/api_client_base.dart';
import '../models/tracked_server_model.dart';

class TrackerSlots {
  final int used;
  final int total;
  final int remaining;

  const TrackerSlots({required this.used, required this.total, required this.remaining});

  factory TrackerSlots.fromJson(Map<String, dynamic> json) => TrackerSlots(
    used: json['used'] as int,
    total: json['total'] as int,
    remaining: json['remaining'] as int,
  );
}

class TrackerData {
  final List<TrackedServer> servers;
  final TrackerSlots slots;

  const TrackerData({required this.servers, required this.slots});
}

class TrackerApiService {
  TrackerApiService._();

  static const String _base = AppConstants.apiBase;

  static Future<TrackerData?> getServers() async {
    try {
      final res = await http.get(
        Uri.parse('$_base/api/tracker/servers'),
        headers: await ApiClientBase.headers(),
      );
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        final list = body['servers'] as List<dynamic>;
        return TrackerData(
          servers: list.map((e) => TrackedServer.fromJson(e as Map<String, dynamic>)).toList(),
          slots: TrackerSlots.fromJson(body['slots'] as Map<String, dynamic>),
        );
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  static Future<({TrackedServer? server, String? error})> addServer({
    required String name,
    required String ip,
    required int port,
    required String platform,
  }) async {
    try {
      final res = await http.post(
        Uri.parse('$_base/api/tracker/servers'),
        headers: await ApiClientBase.headers(),
        body: jsonEncode({'name': name, 'ip': ip, 'port': port, 'platform': platform}),
      );
      if (res.statusCode == 201) {
        final server = TrackedServer.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
        return (server: server, error: null);
      }
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      final code = body['error'] as String?;
      if (code == 'no_slots') return (server: null, error: 'no_slots');
      return (server: null, error: body['message'] as String? ?? 'unknown_error');
    } catch (_) {
      return (server: null, error: 'network_error');
    }
  }

  static Future<TrackedServer?> updateServer(
    String serverId, {
    String? name,
    String? ip,
    int? port,
    String? platform,
    bool? notificationsEnabled,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (name != null) body['name'] = name;
      if (ip != null) body['ip'] = ip;
      if (port != null) body['port'] = port;
      if (platform != null) body['platform'] = platform;
      if (notificationsEnabled != null) body['notificationsEnabled'] = notificationsEnabled;

      final res = await http.patch(
        Uri.parse('$_base/api/tracker/servers/$serverId'),
        headers: await ApiClientBase.headers(),
        body: jsonEncode(body),
      );
      if (res.statusCode == 200) {
        return TrackedServer.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  static Future<bool> deleteServer(String serverId) async {
    try {
      final res = await http.delete(
        Uri.parse('$_base/api/tracker/servers/$serverId'),
        headers: await ApiClientBase.headers(),
      );
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }
}
