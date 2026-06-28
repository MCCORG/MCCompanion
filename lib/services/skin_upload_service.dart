import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'auth_service.dart';
import '../constants/app_constants.dart';

class SkinUploadService {
  static const String _base = AppConstants.apiBase;
  static const Duration _timeout = Duration(seconds: 15);

  static Future<Map<String, String>> _headers() async {
    final token = await AuthService.getIdToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<String> uploadSkin({
    required String skinId,
    required String name,
    required String filePath,
  }) async {
    final headers = await _headers();

    final presignRes = await http
        .post(
          Uri.parse('$_base/api/skins/me/presign'),
          headers: headers,
          body: jsonEncode({'skinId': skinId, 'name': name}),
        )
        .timeout(_timeout);

    if (presignRes.statusCode != 200) {
      final body = jsonDecode(presignRes.body);
      throw Exception(body['message'] ?? 'Could not get upload URL');
    }

    final presign = jsonDecode(presignRes.body) as Map<String, dynamic>;
    final uploadUrl = presign['uploadUrl'] as String;
    final r2Key = presign['r2Key'] as String;
    final publicUrl = presign['publicUrl'] as String;

    final bytes = await File(filePath).readAsBytes();
    final putRes = await http
        .put(
          Uri.parse(uploadUrl),
          headers: {'Content-Type': 'image/png'},
          body: bytes,
        )
        .timeout(_timeout);

    if (putRes.statusCode != 200) {
      throw Exception('Upload to storage failed (${putRes.statusCode})');
    }

    final confirmRes = await http
        .post(
          Uri.parse('$_base/api/skins/me/confirm'),
          headers: headers,
          body: jsonEncode({'r2Key': r2Key, 'name': name, 'isPublic': true}),
        )
        .timeout(_timeout);

    if (confirmRes.statusCode != 201) {
      final body = jsonDecode(confirmRes.body);
      throw Exception(body['message'] ?? 'Could not confirm upload');
    }

    return publicUrl;
  }

  static Future<List<Map<String, dynamic>>> getMySkins() async {
    final res = await http
        .get(Uri.parse('$_base/api/skins/me'), headers: await _headers())
        .timeout(_timeout);
    if (res.statusCode == 200) {
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      return List<Map<String, dynamic>>.from(body['skins'] as List);
    }
    return [];
  }

  static Future<void> deleteSkin(String skinId) async {
    await http
        .delete(
          Uri.parse('$_base/api/skins/me/$skinId'),
          headers: await _headers(),
        )
        .timeout(_timeout);
  }
}
