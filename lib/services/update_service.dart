import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'distribution_service.dart';

class UpdateService {
  static const String _releasesLatest =
      'https://github.com/MCCORG/MCCompanion/releases/latest';
  static const String downloadPage = 'https://mccompanion.net/download';
  static const String _cachedVersionKey = 'update:latest_version';
  static const String _checkedAtKey = 'update:checked_at';
  static const String _dismissedKey = 'update:dismissed_version';

  static const Duration _checkEvery = Duration(hours: 24);
  static const Duration _timeout = Duration(seconds: 8);

  static Future<String?> latestVersion({bool force = false}) async {
    if (!DistributionService.isStandalone) return null;

    final prefs = await SharedPreferences.getInstance();
    final cached = prefs.getString(_cachedVersionKey);

    if (!force && cached != null) {
      final checkedAt = prefs.getInt(_checkedAtKey) ?? 0;
      final age = DateTime.now().millisecondsSinceEpoch - checkedAt;
      if (age < _checkEvery.inMilliseconds) return cached;
    }

    final fetched = await _fetchLatest();
    if (fetched == null) return cached;

    await prefs.setString(_cachedVersionKey, fetched);
    await prefs.setInt(_checkedAtKey, DateTime.now().millisecondsSinceEpoch);
    return fetched;
  }

  static Future<bool> updateAvailable() async {
    if (!DistributionService.isStandalone) return false;

    final latest = await latestVersion();
    if (latest == null) return false;

    final running = DistributionService.version;
    if (running.isEmpty) return false;
    if (!isNewer(latest, running)) return false;

    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_dismissedKey) != latest;
  }

  static Future<void> dismiss(String version) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_dismissedKey, version);
  }

  static Future<String?> _fetchLatest() async {
    try {
      final request = http.Request('GET', Uri.parse(_releasesLatest))
        ..followRedirects = false;
      final response = await request.send().timeout(_timeout);

      final location = response.headers['location'] ?? '';
      final match = RegExp(r'/tag/v(\d+\.\d+\.\d+)$').firstMatch(location);
      if (match != null) return match.group(1);

      return await _fetchLatestFromApi();
    } catch (_) {
      return null;
    }
  }

  static Future<String?> _fetchLatestFromApi() async {
    try {
      final response = await http
          .get(Uri.parse(
              'https://api.github.com/repos/MCCORG/MCCompanion/releases/latest'))
          .timeout(_timeout);
      if (response.statusCode != 200) return null;

      final tag = (jsonDecode(response.body)['tag_name'] ?? '').toString();
      final match = RegExp(r'^v(\d+\.\d+\.\d+)$').firstMatch(tag);
      return match?.group(1);
    } catch (_) {
      return null;
    }
  }

  static bool isNewer(String candidate, String current) {
    final a = _parse(candidate);
    final b = _parse(current);
    if (a == null || b == null) return false;

    for (var i = 0; i < 3; i++) {
      if (a[i] != b[i]) return a[i] > b[i];
    }
    return false;
  }

  static List<int>? _parse(String version) {
    final match = RegExp(r'^(\d+)\.(\d+)\.(\d+)').firstMatch(version.trim());
    if (match == null) return null;
    return [
      int.parse(match.group(1)!),
      int.parse(match.group(2)!),
      int.parse(match.group(3)!),
    ];
  }
}
