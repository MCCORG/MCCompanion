import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import 'java_server_ping.dart';

class ServerStatus {
  final bool isOnline;
  final int? players;
  final int? maxPlayers;
  final String? name;
  final String? version;
  final String? gameType;
  final String? software;

  const ServerStatus({
    required this.isOnline,
    this.players,
    this.maxPlayers,
    this.name,
    this.version,
    this.gameType,
    this.software,
  });

  static const ServerStatus offline = ServerStatus(isOnline: false);
}

class ServerStatusService {
  ServerStatusService._();

  static final Map<String, ServerStatus> _cache = {};
  static final Map<String, DateTime> _lastFetch = {};
  static const Duration _cacheDuration = Duration(minutes: 2);
  static const Duration _timeout = Duration(seconds: 5);

  static Future<ServerStatus> getStatus(
    String address,
    int port, {
    bool isJava = false,
  }) async {
    final key = '$address:$port';
    final now = DateTime.now();

    final cached = _cache[key];
    final fetchedAt = _lastFetch[key];
    if (cached != null &&
        fetchedAt != null &&
        now.difference(fetchedAt) < _cacheDuration) {
      return cached;
    }

    final status = isJava
        ? await _pingJava(address, port)
        : await _pingBedrock(address, port);

    _cache[key] = status;
    _lastFetch[key] = now;
    return status;
  }

  static Future<ServerStatus> _pingJava(String address, int port) async {
    final result = await JavaServerPing.ping(address, port, timeout: _timeout);
    return ServerStatus(
      isOnline: result.isOnline,
      players: result.players,
      maxPlayers: result.maxPlayers,
      version: result.version,
    );
  }

  static Future<ServerStatus> _pingBedrock(String address, int port) async {
    try {
      final uri = Uri.parse(
        '${AppConstants.apiBase}/api/servers/status',
      ).replace(queryParameters: {'host': address});
      final response = await http.get(uri).timeout(_timeout);
      if (response.statusCode != 200) return ServerStatus.offline;

      final json = jsonDecode(response.body);
      if (json is! Map || json['online'] != true) return ServerStatus.offline;

      final version = json['version'];
      final name = json['name'];
      return ServerStatus(
        isOnline: true,
        players: (json['players'] as num?)?.toInt(),
        maxPlayers: (json['maxPlayers'] as num?)?.toInt(),
        name: name is String && name.trim().isNotEmpty ? name.trim() : null,
        version: version is String && version.isNotEmpty ? version : null,
      );
    } catch (_) {
      return ServerStatus.offline;
    }
  }
}
