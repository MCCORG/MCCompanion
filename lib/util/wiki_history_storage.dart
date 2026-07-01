import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class WikiHistoryEntry {
  final int pageId;
  final String title;
  final String? thumbnailUrl;
  final DateTime visitedAt;

  const WikiHistoryEntry({
    required this.pageId,
    required this.title,
    this.thumbnailUrl,
    required this.visitedAt,
  });

  Map<String, dynamic> toJson() => {
    'pageId': pageId,
    'title': title,
    if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
    'visitedAt': visitedAt.toIso8601String(),
  };

  factory WikiHistoryEntry.fromJson(Map<String, dynamic> j) => WikiHistoryEntry(
    pageId: (j['pageId'] as num?)?.toInt() ?? 0,
    title: j['title'] as String,
    thumbnailUrl: j['thumbnailUrl'] as String?,
    visitedAt: DateTime.tryParse(j['visitedAt'] as String? ?? '') ?? DateTime.now(),
  );
}

class WikiHistoryStorage {
  static const _recentKey = 'wiki_recent_v1';
  static const _favKey = 'wiki_favourites_v1';
  static const _maxRecent = 20;

  static Future<List<WikiHistoryEntry>> loadRecent() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_recentKey);
    if (raw == null) return [];
    try {
      final list = jsonDecode(raw) as List;
      return list.map((e) => WikiHistoryEntry.fromJson(e as Map<String, dynamic>)).toList();
    } catch (_) { return []; }
  }

  static Future<void> addRecent(WikiHistoryEntry entry) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await loadRecent();
    list.removeWhere((e) => e.title == entry.title);
    list.insert(0, entry);
    final trimmed = list.take(_maxRecent).toList();
    await prefs.setString(_recentKey, jsonEncode(trimmed.map((e) => e.toJson()).toList()));
  }

  static Future<List<WikiHistoryEntry>> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_favKey);
    if (raw == null) return [];
    try {
      final list = jsonDecode(raw) as List;
      return list.map((e) => WikiHistoryEntry.fromJson(e as Map<String, dynamic>)).toList();
    } catch (_) { return []; }
  }

  static Future<bool> isFavourite(String title) async {
    final favs = await loadFavourites();
    return favs.any((e) => e.title == title);
  }

  static Future<void> toggleFavourite(WikiHistoryEntry entry) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await loadFavourites();
    final idx = list.indexWhere((e) => e.title == entry.title);
    if (idx >= 0) {
      list.removeAt(idx);
    } else {
      list.insert(0, entry);
    }
    await prefs.setString(_favKey, jsonEncode(list.map((e) => e.toJson()).toList()));
  }

  static Future<void> removeFavourite(String title) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await loadFavourites();
    list.removeWhere((e) => e.title == title);
    await prefs.setString(_favKey, jsonEncode(list.map((e) => e.toJson()).toList()));
  }
}
