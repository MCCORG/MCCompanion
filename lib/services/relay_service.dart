import '../constants/app_constants.dart';
import 'region_detector.dart';

class RelayService {
  static RelayPingResult? _current;

  static void setRelay(RelayPingResult relay) => _current = relay;

  static String get base {
    final b = _current?.base ?? AppConstants.relayServers[0]['base']!;
    return b.replaceAll(RegExp(r'/$'), '');
  }

  static String get wsBase => base.replaceFirst('https://', 'wss://');
}
