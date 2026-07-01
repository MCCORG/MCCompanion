import 'auth_service.dart';

class ApiClientBase {
  static const Duration defaultTimeout = Duration(seconds: 10);

  static Future<Map<String, String>> headers({bool json = true}) async {
    final token = await AuthService.getIdToken();
    return {
      if (json) 'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<Map<String, String>> authHeaders() async {
    final token = await AuthService.getIdToken();
    return {
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }
}
