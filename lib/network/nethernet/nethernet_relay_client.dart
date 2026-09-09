import 'dart:convert';
import 'dart:io';

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
  }) async {
    final body = jsonEncode({
      'connectionId': connectionId.toUnsigned(64).toString(),
      'networkId': networkId.toUnsigned(64).toString(),
      'sdp': sdp,
    });
    final json = await _post('/nethernet/offer', body);
    final answer = json?['answer'] as String?;
    if (answer == null) return null;
    final raw = (json?['candidates'] as List?) ?? const [];
    return (answer: answer, candidates: raw.cast<String>());
  }

  static const Duration _timeout = Duration(seconds: 15);

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
