import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_client_base.dart';
import '../constants/app_constants.dart';

class ReportService {
  static const String _base = AppConstants.apiBase;
  static const Duration _timeout = Duration(seconds: 8);

  static Future<bool> submitReport({
    required String reportedUsername,
    required String reason,
    String? additionalInfo,
  }) async {
    try {
      final res = await http
          .post(
            Uri.parse('$_base/api/reports'),
            headers: await ApiClientBase.headers(),
            body: jsonEncode({
              'reportedUsername': reportedUsername,
              'reason': reason,
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
