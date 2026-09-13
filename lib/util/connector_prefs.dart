import 'package:shared_preferences/shared_preferences.dart';

import 'user_servers.dart';

class ConnectorPrefs {
  static const String _lastServerKey = 'connector_last_server';
  static const String _modeKey = 'connector_mode';

  static String _keyOf(UserServer s) => '${s.address}:${s.port}';

  static Future<void> saveLastServer(UserServer server) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastServerKey, _keyOf(server));
  }

  static Future<UserServer?> loadLastServer(List<UserServer> servers) async {
    final prefs = await SharedPreferences.getInstance();
    final key = prefs.getString(_lastServerKey);
    if (key == null) return null;
    for (final server in servers) {
      if (_keyOf(server) == key) return server;
    }
    return null;
  }

  static Future<void> saveMode(String mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_modeKey, mode);
  }

  static Future<String?> loadMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_modeKey);
  }
}
