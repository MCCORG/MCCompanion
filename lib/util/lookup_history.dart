import 'package:shared_preferences/shared_preferences.dart';

class LookupHistory {
  static const _key = 'lookup_recent';
  static const _limit = 8;

  static Future<List<String>> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getStringList(_key) ?? const [];
    } catch (_) {
      return const [];
    }
  }

  static Future<List<String>> add(String name) async {
    final query = name.trim();
    if (query.isEmpty) return load();
    final current = await load();
    final next = [
      query,
      ...current.where((e) => e.toLowerCase() != query.toLowerCase()),
    ].take(_limit).toList();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_key, next);
    } catch (_) {}
    return next;
  }
}
