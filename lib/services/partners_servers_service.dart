import 'dart:convert';
import 'dart:io';
import '../util/partners_servers.dart';
import 'relay_service.dart';

class FeaturedServersService {
  static const Duration _timeout = Duration(seconds: 5);

  static Future<List<FeaturedServer>> fetchFeaturedServers() async {
    try {
      final client = HttpClient();
      client.connectionTimeout = _timeout;

      final uri = Uri.parse('${RelayService.base}/api/featured-servers');
      final request = await client.getUrl(uri);
      final response = await request.close();

      if (response.statusCode == 200) {
        final body = await response.transform(utf8.decoder).join();
        final Map<String, dynamic> jsonResponse = json.decode(body);
        final List<dynamic> jsonList = jsonResponse['servers'] as List<dynamic>;
        return jsonList.map((json) => FeaturedServer.fromJson(json)).toList();
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}
