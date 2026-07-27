import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResourcePackPrefs {
  static const _keyUrl = 'resource_pack_url';
  static const _keyEnabled = 'resource_pack_enabled';
  static const _keyFilename = 'resource_pack_filename';
  static const _keyIsUpload = 'resource_pack_is_upload';

  static final ValueNotifier<int> revision = ValueNotifier<int>(0);

  static void _notify() => revision.value++;

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

  static Future<void> setEnabled(bool enabled) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_keyEnabled, enabled);
      _notify();
    } catch (_) {}
  }

  static Future<String?> getFilename() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_keyFilename);
    } catch (_) {
      return null;
    }
  }

  static Future<bool> isUpload() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_keyIsUpload) ?? false;
    } catch (_) {
      return false;
    }
  }

  static Future<void> save({
    required String? url,
    required bool enabled,
    String? filename,
    bool isUpload = false,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (url != null && url.isNotEmpty) {
        await prefs.setString(_keyUrl, url);
      } else {
        await prefs.remove(_keyUrl);
      }
      if (filename != null && filename.isNotEmpty) {
        await prefs.setString(_keyFilename, filename);
      } else {
        await prefs.remove(_keyFilename);
      }
      await prefs.setBool(_keyIsUpload, isUpload);
      await prefs.setBool(_keyEnabled, enabled);
      _notify();
    } catch (_) {}
  }

  static Future<void> clear() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_keyUrl);
      await prefs.remove(_keyFilename);
      await prefs.remove(_keyIsUpload);
      await prefs.setBool(_keyEnabled, false);
      _notify();
    } catch (_) {}
  }

  static Future<String?> getActiveUrl() async {
    if (!await isEnabled()) return null;
    final url = await getUrl();
    return (url != null && url.isNotEmpty) ? url : null;
  }
}
