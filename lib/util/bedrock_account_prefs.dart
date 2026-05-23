import 'package:shared_preferences/shared_preferences.dart';

class BedrockAccountPrefs {
  static const _key = 'selected_bedrock_xuid';

  static Future<String?> getSelectedXuid() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_key);
    } catch (_) {
      return null;
    }
  }

  static Future<void> setSelectedXuid(String xuid) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_key, xuid);
    } catch (_) {}
  }
}
