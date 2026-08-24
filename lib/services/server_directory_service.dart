import 'dart:convert';
import 'dart:io';

import '../constants/app_constants.dart';
import '../util/directory_server.dart';
import 'auth_service.dart';

class ServerDirectoryService {
  static const Duration _timeout = Duration(seconds: 8);
  static const int pageSize = 20;

  static Future<DirectoryPage> fetchServers({
    String? search,
    String? tag,
    String? edition,
    String sort = 'votes',
    int page = 0,
  }) async {
    final query = <String, String>{
      'limit': '$pageSize',
      'offset': '${page * pageSize}',
      'sort': sort,
      if (search != null && search.trim().isNotEmpty) 'search': search.trim(),
      if (tag != null && tag.isNotEmpty) 'tag': tag,
      if (edition != null && edition.isNotEmpty) 'edition': edition,
    };

    final body = await _get(Uri.parse('${AppConstants.apiBase}/api/servers')
        .replace(queryParameters: query));
    if (body == null) return DirectoryPage.empty;

    final servers = (body['servers'] as List<dynamic>? ?? const [])
        .map((json) => DirectoryServer.fromJson(json as Map<String, dynamic>))
        .toList(growable: false);

    return DirectoryPage(
      servers: servers,
      total: body['total'] as int? ?? servers.length,
    );
  }

  static Future<List<ServerTag>> fetchTags() async {
    final body = await _get(Uri.parse('${AppConstants.apiBase}/api/servers/tags'));
    if (body == null) return const [];

    return (body['tags'] as List<dynamic>? ?? const [])
        .map((json) => ServerTag.fromJson(json as Map<String, dynamic>))
        .toList(growable: false);
  }

  static Future<DirectoryServer?> fetchServer(String slug) async {
    final body = await _get(
      Uri.parse('${AppConstants.apiBase}/api/servers/$slug?days=30'),
    );
    final server = body?['server'];
    return server is Map<String, dynamic>
        ? DirectoryServer.fromJson(server)
        : null;
  }

  static Future<VoteCounts> fetchVotes(String slug) async {
    final body = await _get(
      Uri.parse('${AppConstants.apiBase}/api/servers/$slug/votes'),
    );
    return VoteCounts.fromJson(body?['votes'] as Map<String, dynamic>?);
  }

  static Future<VoteResult> vote({
    required String slug,
    required String username,
  }) async {
    final token = await AuthService.getIdToken();
    if (token == null) {
      return const VoteResult(ok: false, error: 'sign_in_required');
    }

    HttpClient? client;
    try {
      client = HttpClient()..connectionTimeout = _timeout;
      final request = await client.postUrl(
        Uri.parse('${AppConstants.apiBase}/api/servers/$slug/vote'),
      );
      request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
      request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $token');
      request.write(json.encode({'username': username}));

      final response = await request.close().timeout(_timeout);
      final body = await response.transform(utf8.decoder).join();
      final decoded = json.decode(body);
      final map = decoded is Map<String, dynamic> ? decoded : const {};

      if (response.statusCode == 200) {
        return VoteResult(
          ok: true,
          delivered: map['delivered'] == true,
          votes: VoteCounts.fromJson(map['votes'] as Map<String, dynamic>?),
        );
      }

      return VoteResult(
        ok: false,
        error: map['error'] as String?,
        message: map['message'] as String?,
      );
    } catch (_) {
      return const VoteResult(ok: false, error: 'network');
    } finally {
      client?.close(force: true);
    }
  }

  static Future<Map<String, dynamic>?> _get(Uri uri) async {
    HttpClient? client;
    try {
      client = HttpClient()..connectionTimeout = _timeout;
      final request = await client.getUrl(uri);
      final response = await request.close().timeout(_timeout);
      if (response.statusCode != 200) return null;

      final body = await response.transform(utf8.decoder).join();
      final decoded = json.decode(body);
      return decoded is Map<String, dynamic> ? decoded : null;
    } catch (_) {
      return null;
    } finally {
      client?.close(force: true);
    }
  }
}
