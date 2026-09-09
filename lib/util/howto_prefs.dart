import 'package:shared_preferences/shared_preferences.dart';

enum HowToTopic { xbox, nintendo, friends, direct }

class HowToPrefs {
  static const _prefix = 'howto_auto_show_';

  static const _legacyKey = 'howto_auto_show';

  static String _keyFor(HowToTopic topic) => '$_prefix${topic.name}';

  static Future<bool> isAutoShowEnabled(HowToTopic topic) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_keyFor(topic)) ??
          prefs.getBool(_legacyKey) ??
          true;
    } catch (_) {
      return true;
    }
  }

  static Future<void> setAutoShow(HowToTopic topic, bool enabled) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_keyFor(topic), enabled);
    } catch (_) {}
  }
}
