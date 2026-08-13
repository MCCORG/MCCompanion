import 'dart:async';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import '../util/relay_preference_storage.dart';

enum RelaySource {
  manual,
  cached,
  geo,
  stale,
  failover,
  fallback,
}

class RelaySelection {
  final String ip;
  final String base;
  final String name;
  final String region;
  final RelaySource source;

  const RelaySelection({
    required this.ip,
    required this.base,
    required this.name,
    required this.region,
    required this.source,
  });

  static RelaySelection _of(Map<String, String> relay, RelaySource source) =>
      RelaySelection(
        ip: relay['ip']!,
        base: relay['base']!,
        name: relay['name']!,
        region: relay['region'] ?? '',
        source: source,
      );

  static String _normalise(String url) =>
      url.replaceAll(RegExp(r'/+$'), '').toLowerCase();

  static RelaySelection? fromIp(String? ip, RelaySource source) {
    if (ip == null) return null;
    for (final relay in AppConstants.relayServers) {
      if (relay['ip'] == ip) return _of(relay, source);
    }
    return null;
  }

  static RelaySelection? fromBase(String? base, RelaySource source) {
    if (base == null || base.isEmpty) return null;
    final wanted = _normalise(base);
    for (final relay in AppConstants.relayServers) {
      if (_normalise(relay['base']!) == wanted) return _of(relay, source);
    }
    return null;
  }

  static RelaySelection get first =>
      _of(AppConstants.relayServers.first, RelaySource.fallback);

  RelaySelection? get alternate {
    for (final relay in AppConstants.relayServers) {
      if (relay['ip'] != ip) return _of(relay, RelaySource.failover);
    }
    return null;
  }

  RelaySelection withSource(RelaySource next) => RelaySelection(
    ip: ip,
    base: base,
    name: name,
    region: region,
    source: next,
  );

  @override
  String toString() => '$name ($ip, via ${source.name})';
}

class RegionDetector {
  static Future<RelaySelection> resolve() async {
    final manual = RelaySelection.fromIp(
      await RelayPreferenceStorage.loadManualIp(),
      RelaySource.manual,
    );
    if (manual != null) return manual;

    final cached = await RelayPreferenceStorage.loadAutoIp();
    if (cached != null && cached.fresh) {
      final hit = RelaySelection.fromIp(cached.ip, RelaySource.cached);
      if (hit != null) return hit;
    }

    final fromEdge = await askEdge();
    if (fromEdge != null) {
      await RelayPreferenceStorage.saveAutoIp(fromEdge.ip);
      return fromEdge;
    }

    if (cached != null) {
      final stale = RelaySelection.fromIp(cached.ip, RelaySource.stale);
      if (stale != null) return stale;
    }

    return RelaySelection.first;
  }
  static Future<RelaySelection?> askEdge() async {
    try {
      final res = await http
          .get(Uri.parse('${AppConstants.apiBase}/api/health'))
          .timeout(const Duration(seconds: 6));
      return RelaySelection.fromBase(
        res.headers[AppConstants.routedToHeader],
        RelaySource.geo,
      );
    } catch (_) {
      return null;
    }
  }

  static Future<void> refreshInBackground() async {
    final manual = await RelayPreferenceStorage.loadManualIp();
    if (manual != null) return;

    final cached = await RelayPreferenceStorage.loadAutoIp();
    if (cached != null && cached.fresh) return;

    final fromEdge = await askEdge();
    if (fromEdge != null) await RelayPreferenceStorage.saveAutoIp(fromEdge.ip);
  }
}
