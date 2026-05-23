import '../constants/app_constants.dart';

class RelayHelper {
  static String apiBaseFor(String ip) {
    final relay = AppConstants.relayServers.firstWhere(
      (e) => e['ip'] == ip,
      orElse: () => {'base': 'https://$ip'},
    );
    final base = (relay['base'] ?? 'https://$ip').toString();
    return base.replaceAll(RegExp(r'/$'), '');
  }
}
