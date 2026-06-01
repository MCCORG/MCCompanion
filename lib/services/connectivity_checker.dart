import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityWarning { none, vpnActive, mobileOnly }

class ConnectivityCheckResult {
  final ConnectivityWarning warning;

  const ConnectivityCheckResult({required this.warning});
}

class ConnectivityChecker {
  static Future<ConnectivityCheckResult> check() async {
    final results = await Connectivity().checkConnectivity();

    if (results.contains(ConnectivityResult.wifi)) {
      return const ConnectivityCheckResult(warning: ConnectivityWarning.none);
    }

    if (results.contains(ConnectivityResult.vpn)) {
      return const ConnectivityCheckResult(
        warning: ConnectivityWarning.vpnActive,
      );
    }

    if (results.contains(ConnectivityResult.mobile)) {
      return const ConnectivityCheckResult(
        warning: ConnectivityWarning.mobileOnly,
      );
    }

    return const ConnectivityCheckResult(warning: ConnectivityWarning.none);
  }
}
