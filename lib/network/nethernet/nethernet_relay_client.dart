import 'dart:convert';
import 'dart:io';

import 'nethernet_protocol.dart';

class NetherNetRelayClient {
  final String host;
  final int port;

  NetherNetRelayClient({required this.host, this.port = 8787});

  final HttpClient _client = HttpClient()
    ..connectionTimeout = const Duration(seconds: 8);

  Uri _uri(String path, [Map<String, String>? query]) => Uri(
    scheme: 'http',
    host: host,
    port: port,
    path: path,
    queryParameters: query,
  );

  Future<({String answer, List<String> candidates})?> sendOffer({
    required int connectionId,
    required int networkId,
    required String sdp,
    String? nonce,
  }) async {
    final body = jsonEncode({
      'connectionId': NetherNetProtocol.unsignedString(connectionId),
      'networkId': NetherNetProtocol.unsignedString(networkId),
      'sdp': sdp,
      'nonce': ?nonce,
    });
    final json = await _post('/nethernet/offer', body);
    final answer = json?['answer'] as String?;
    if (answer == null) return null;
    final raw = (json?['candidates'] as List?) ?? const [];
    return (answer: answer, candidates: raw.cast<String>());
  }

  static const int _signalingPort = 19132;

  Future<({int protocol, String version})?> fetchInfo() async {
    final results = await Future.wait([
      _readInfo(
        Uri(scheme: 'http', host: host, port: _signalingPort, path: '/v1/join'),
      ),
      _readInfo(_uri('/nethernet/info')),
    ]);
    return results[0] ?? results[1];
  }

  Future<({int protocol, String version})?> _readInfo(Uri uri) async {
    try {
      final request = await _client.getUrl(uri).timeout(_infoTimeout);
      request.headers.set(HttpHeaders.acceptHeader, 'application/json');
      final response = await request.close().timeout(_infoTimeout);
      final text = await response
          .transform(utf8.decoder)
          .join()
          .timeout(_infoTimeout);
      if (response.statusCode != 200) return null;
      final json = jsonDecode(text);
      if (json is! Map) return null;
      final protocol = json['protocol'];
      final version = json['version'];
      if (protocol is! int || version is! String) return null;
      return (protocol: protocol, version: version);
    } catch (_) {
      return null;
    }
  }

  Future<bool> sendCandidate({
    required int connectionId,
    required String candidate,
  }) async {
    final body = jsonEncode({
      'connectionId': NetherNetProtocol.unsignedString(connectionId),
      'candidate': candidate,
    });
    final json = await _post('/nethernet/candidate', body);
    return json?['ok'] == true;
  }

  static const Duration _timeout = Duration(seconds: 15);
  static const Duration _infoTimeout = Duration(seconds: 3);

  Future<Map<String, dynamic>?> _post(String path, String body) async {
    try {
      final request = await _client.postUrl(_uri(path)).timeout(_timeout);
      request.headers.contentType = ContentType.json;
      request.write(body);
      final response = await request.close().timeout(_timeout);
      final text = await response
          .transform(utf8.decoder)
          .join()
          .timeout(_timeout);
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw HttpException('${response.statusCode}: $text');
      }
      return jsonDecode(text) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  void close() => _client.close(force: true);
}
