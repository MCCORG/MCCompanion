import 'package:flutter/foundation.dart';
import '../util/relay_preference_storage.dart';
import 'region_detector.dart';

class RelayService {
  static final ValueNotifier<RelaySelection?> selection =
      ValueNotifier<RelaySelection?>(null);

  static RelaySelection get active => selection.value ?? RelaySelection.first;

  static void setRelay(RelaySelection relay) => selection.value = relay;

  static Future<void> setManual(RelaySelection relay) async {
    selection.value = relay.withSource(RelaySource.manual);
    await RelayPreferenceStorage.saveManualIp(relay.ip);
  }

  static RelaySelection? failover() {
    final next = active.alternate;
    if (next == null) return null;
    selection.value = next;
    return next;
  }

  static String get base => active.base.replaceAll(RegExp(r'/+$'), '');

  static String get wsBase => base.replaceFirst('https://', 'wss://');

  static String? get forcedRegion {
    final current = selection.value;
    if (current == null || current.source != RelaySource.manual) return null;
    return current.region.isEmpty ? null : current.region;
  }
}
