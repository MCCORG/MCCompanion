import 'package:shared_preferences/shared_preferences.dart';

class ResourcePackPrefs {
  static const _keyUrl     = 'resource_pack_url';
  static const _keyEnabled = 'resource_pack_enabled';

  static Future<String?> getUrl() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_keyUrl);
    } catch (_) {
      return null;
    }
  }

  static Future<bool> isEnabled() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_keyEnabled) ?? false;
    } catch (_) {
      return false;
    }
  }

  static Future<void> save({required String? url, required bool enabled}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (url != null && url.isNotEmpty) {
        await prefs.setString(_keyUrl, url);
      } else {
        await prefs.remove(_keyUrl);
      }
      await prefs.setBool(_keyEnabled, enabled);
    } catch (_) {}
  }

  static Future<String?> getActiveUrl() async {
    if (!await isEnabled()) return null;
    final url = await getUrl();
    return (url != null && url.isNotEmpty) ? url : null;
  }
}
