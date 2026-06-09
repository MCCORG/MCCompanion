import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'auth_service.dart';
import '../constants/app_constants.dart';

class FeedbackService {
  static const String _base = AppConstants.apiBase;
  static const Duration _timeout = Duration(seconds: 10);

  static Future<Map<String, String>> _headers() async {
    final token = await AuthService.getIdToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

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
    String? email,
    String? appVersion,
  }) async {
    try {
      final res = await http
          .post(
            Uri.parse('$_base/api/feedback'),
            headers: await _headers(),
            body: jsonEncode({
              'type': type,
              'title': title,
              'description': description,
              'platform': _platform,
              if (appVersion case final v?) 'appVersion': v,
              if (email case final e? when e.isNotEmpty) 'email': e,
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
}
