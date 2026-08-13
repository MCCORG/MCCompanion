import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_servers.dart';

class UserServersStorage {
  static const String _fileName = 'user_servers.json';

  static const String _defaultKeyPref = 'connector_default_server';

  static String _keyOf(UserServer s) => '${s.address}:${s.port}';

  static Future<UserServer?> loadDefaultServer([List<UserServer>? servers]) async {
    final prefs = await SharedPreferences.getInstance();
    final key = prefs.getString(_defaultKeyPref);
    if (key == null) return null;

    final list = servers ?? await loadServers();
    for (final s in list) {
      if (_keyOf(s) == key) return s;
    }
    return null;
  }

  static Future<void> setDefaultServer(UserServer? server) async {
    final prefs = await SharedPreferences.getInstance();
    if (server == null) {
      await prefs.remove(_defaultKeyPref);
    } else {
      await prefs.setString(_defaultKeyPref, _keyOf(server));
    }
  }

  static Future<bool> isDefaultServer(UserServer server) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_defaultKeyPref) == _keyOf(server);
  }

  static Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$_fileName');
  }

  static Future<List<UserServer>> loadServers() async {
    try {
      final file = await _getFile();
      if (!await file.exists()) return [];

      final String contents = await file.readAsString();
      final List<dynamic> decoded = jsonDecode(contents);
      return decoded.map((json) => UserServer.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<void> saveServers(List<UserServer> servers) async {
    final file = await _getFile();
    final List<Map<String, dynamic>> jsonList = servers
        .map((s) => s.toJson())
        .toList();
    await file.writeAsString(jsonEncode(jsonList));
  }

  static Future<void> addServer(UserServer server) async {
    final servers = await loadServers();
    servers.add(server);
    await saveServers(servers);
  }

  static Future<void> removeServer(int index) async {
    final servers = await loadServers();
    if (index >= 0 && index < servers.length) {
      final removed = servers.removeAt(index);
      if (await isDefaultServer(removed)) await setDefaultServer(null);
      await saveServers(servers);
    }
  }

  static Future<void> updateServer(int index, UserServer server) async {
    final servers = await loadServers();
    if (index >= 0 && index < servers.length) {
      // The preference is keyed on address:port, so editing either of those
      // would leave it pointing at a server that no longer exists. Move it
      // along rather than letting the star quietly go out.
      if (await isDefaultServer(servers[index])) await setDefaultServer(server);
      servers[index] = server;
      await saveServers(servers);
    }
  }
}
