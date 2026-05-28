import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';
import '../constants/app_constants.dart';

class ReportService {
  static const String _base = AppConstants.apiBase;
  static const Duration _timeout = Duration(seconds: 8);

  static Future<Map<String, String>> _headers() async {
    final token = await AuthService.getIdToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<bool> submitReport({
    required String reportedUsername,
    required String reason,
    int? messageId,
    String? additionalInfo,
  }) async {
    try {
      final res = await http
          .post(
            Uri.parse('$_base/api/reports'),
            headers: await _headers(),
            body: jsonEncode({
              'reportedUsername': reportedUsername,
              'reason': reason,
              if (messageId != null) 'messageId': messageId,
              if (additionalInfo?.isNotEmpty == true)
                'additionalInfo': additionalInfo,
            }),
          )
          .timeout(_timeout);
      return res.statusCode == 201;
    } catch (_) {
      return false;
    }
  }
}
