import 'package:mc_server_info/mc_server_info.dart';
import 'java_server_ping.dart';

class ServerStatus {
  final bool isOnline;
  final int? players;
  final int? maxPlayers;
  final String? version;
  final String? gameType;
  final String? software;

  const ServerStatus({
    required this.isOnline,
    this.players,
    this.maxPlayers,
    this.version,
    this.gameType,
    this.software,
  });

  static const ServerStatus offline = ServerStatus(isOnline: false);
}

class ServerStatusService {
  ServerStatusService._();

  static final Map<String, ServerStatus> _cache     = {};
  static final Map<String, DateTime>     _lastFetch = {};
  static const Duration _cacheDuration = Duration(minutes: 2);
  static const Duration _timeout       = Duration(seconds: 5);

  static Future<ServerStatus> getStatus(
    String address,
    int port, {
    bool isJava = false,
  }) async {
    final key = '$address:$port';
    final now = DateTime.now();

    final cached   = _cache[key];
    final fetchedAt = _lastFetch[key];
    if (cached != null &&
        fetchedAt != null &&
        now.difference(fetchedAt) < _cacheDuration) {
      return cached;
    }

    final status = isJava
        ? await _pingJava(address, port)
        : await _pingBedrock(address, port);

    _cache[key]     = status;
    _lastFetch[key] = now;
    return status;
  }

  static Future<ServerStatus> _pingJava(String address, int port) async {
    final result = await JavaServerPing.ping(address, port, timeout: _timeout);
    return ServerStatus(
      isOnline:   result.isOnline,
      players:    result.players,
      maxPlayers: result.maxPlayers,
      version:    result.version,
    );
  }

  static Future<ServerStatus> _pingBedrock(String address, int port) async {
    try {
      final info = await MinecraftServerInfo.get(
        host: address,
        port: port,
        timeout: _timeout,
      );
      return ServerStatus(
        isOnline:   info.isOnline,
        players:    info.isOnline ? info.players    : null,
        maxPlayers: info.isOnline ? info.maxPlayers : null,
        version:    info.isOnline && info.version.isNotEmpty  ? info.version  : null,
        gameType:   info.isOnline && info.gameType.isNotEmpty ? info.gameType : null,
        software:   info.isOnline && info.software.isNotEmpty ? info.software : null,
      );
    } catch (_) {
      return ServerStatus.offline;
    }
  }

  static void invalidate(String address, int port) {
    _cache.remove('$address:$port');
    _lastFetch.remove('$address:$port');
  }

  static void clearAll() {
    _cache.clear();
    _lastFetch.clear();
  }
}