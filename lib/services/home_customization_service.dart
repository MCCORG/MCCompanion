import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppFeature { connector, skins, wiki, partners, lookup, tracker }

extension AppFeatureLabel on AppFeature {
  String get id => name;

  String get label => switch (this) {
    AppFeature.connector => 'Connector',
    AppFeature.skins => 'Skins',
    AppFeature.wiki => 'Wiki',
    AppFeature.partners => 'Partners',
    AppFeature.lookup => 'Lookup',
    AppFeature.tracker => 'Server Tracker',
  };

  String get imagePath => switch (this) {
    AppFeature.connector => 'assets/images/tunnel.png',
    AppFeature.skins => 'assets/images/skin.png',
    AppFeature.wiki => 'assets/images/wiki.png',
    AppFeature.partners => 'assets/images/feature.png',
    AppFeature.lookup => 'assets/images/players.png',
    AppFeature.tracker => 'assets/images/tunnel.png',
  };

  int get colorValue => switch (this) {
    AppFeature.connector => 0xFF67E404,
    AppFeature.skins => 0xFF42A5F5,
    AppFeature.wiki => 0xFF34D399,
    AppFeature.partners => 0xFFFFB300,
    AppFeature.lookup => 0xFF7B61FF,
    AppFeature.tracker => 0xFF00BCD4,
  };

  String subtitle(dynamic loc) => switch (this) {
    AppFeature.connector => 'Connect consoles to Minecraft',
    AppFeature.skins => 'Browse & manage Minecraft skins',
    AppFeature.wiki => 'Minecraft encyclopedia',
    AppFeature.partners => 'Featured servers',
    AppFeature.lookup => 'Look up Java & Bedrock profiles',
    AppFeature.tracker => 'Monitor server status & get notified',
  };
}

class HomeCustomizationService extends ChangeNotifier {
  static final HomeCustomizationService instance = HomeCustomizationService._();
  HomeCustomizationService._();

  static const _keyTileOrder = 'home_tile_order';
  static const _keyNavLeft = 'home_nav_left';
  static const _keyNavRight = 'home_nav_right';

  static const List<AppFeature> defaultTileOrder = [
    AppFeature.connector,
    AppFeature.skins,
    AppFeature.wiki,
    AppFeature.partners,
    AppFeature.lookup,
    AppFeature.tracker,
  ];

  static const AppFeature defaultNavLeft = AppFeature.skins;
  static const AppFeature defaultNavRight = AppFeature.wiki;

  static const Set<AppFeature> navSlotBlacklist = {AppFeature.connector};

  List<AppFeature> _tileOrder = List.from(defaultTileOrder);
  AppFeature _navLeft = defaultNavLeft;
  AppFeature _navRight = defaultNavRight;

  List<AppFeature> get tileOrder => List.unmodifiable(_tileOrder);
  AppFeature get navLeft => _navLeft;
  AppFeature get navRight => _navRight;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    final savedOrder = prefs.getStringList(_keyTileOrder);
    if (savedOrder != null) {
      final parsed = savedOrder
          .map((s) => AppFeature.values.where((f) => f.id == s).firstOrNull)
          .whereType<AppFeature>()
          .toList();
      for (final f in defaultTileOrder) {
        if (!parsed.contains(f)) parsed.add(f);
      }
      _tileOrder = parsed;
    }

    final savedLeft = prefs.getString(_keyNavLeft);
    if (savedLeft != null) {
      _navLeft = AppFeature.values.firstWhere(
        (f) => f.id == savedLeft,
        orElse: () => defaultNavLeft,
      );
    }

    final savedRight = prefs.getString(_keyNavRight);
    if (savedRight != null) {
      _navRight = AppFeature.values.firstWhere(
        (f) => f.id == savedRight,
        orElse: () => defaultNavRight,
      );
    }
  }

  Future<void> saveTileOrder(List<AppFeature> order) async {
    _tileOrder = List.from(order);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_keyTileOrder, order.map((f) => f.id).toList());
    notifyListeners();
  }

  Future<void> saveNavLeft(AppFeature feature) async {
    _navLeft = feature;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyNavLeft, feature.id);
    notifyListeners();
  }

  Future<void> saveNavRight(AppFeature feature) async {
    _navRight = feature;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyNavRight, feature.id);
    notifyListeners();
  }

  Future<void> reset() async {
    _tileOrder = List.from(defaultTileOrder);
    _navLeft = defaultNavLeft;
    _navRight = defaultNavRight;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyTileOrder);
    await prefs.remove(_keyNavLeft);
    await prefs.remove(_keyNavRight);
    notifyListeners();
  }
}
