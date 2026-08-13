import '../constants/app_constants.dart';
import 'auth_service.dart';
import 'relay_service.dart';

class ApiClientBase {
  static const Duration defaultTimeout = Duration(seconds: 10);

  static Map<String, String> get _regionHeader {
    final region = RelayService.forcedRegion;
    return region == null
        ? const {}
        : {AppConstants.regionHeader: region};
  }

  static Future<Map<String, String>> headers({bool json = true}) async {
    final token = await AuthService.getIdToken();
    return {
      if (json) 'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
      ..._regionHeader,
    };
  }

  static Future<Map<String, String>> authHeaders() async {
    final token = await AuthService.getIdToken();
    return {
      if (token != null) 'Authorization': 'Bearer $token',
      ..._regionHeader,
    };
  }
}
