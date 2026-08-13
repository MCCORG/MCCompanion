import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';

enum AppFeature { connector, skins, wiki, partners, lookup, tracker }

extension AppFeatureLabel on AppFeature {
  String get id => name;

  String label(AppLocalizations l) => switch (this) {
    AppFeature.connector => l.featureLabelConnector,
    AppFeature.skins => l.featureLabelSkins,
    AppFeature.wiki => l.featureLabelWiki,
    AppFeature.partners => l.featureLabelPartners,
    AppFeature.lookup => l.featureLabelLookup,
    AppFeature.tracker => l.featureLabelTracker,
  };

  String get imagePath => switch (this) {
    AppFeature.connector => 'assets/images/tunnel.png',
    AppFeature.skins => 'assets/images/skin.png',
    AppFeature.wiki => 'assets/images/wiki.png',
    AppFeature.partners => 'assets/images/feature.png',
    AppFeature.lookup => 'assets/images/players.png',
    AppFeature.tracker => 'assets/images/tracker.png',
  };

  int get colorValue => switch (this) {
    AppFeature.connector => 0xFF67E404,
    AppFeature.skins => 0xFF42A5F5,
    AppFeature.wiki => 0xFF34D399,
    AppFeature.partners => 0xFFFFB300,
    AppFeature.lookup => 0xFF7B61FF,
    AppFeature.tracker => 0xFF00BCD4,
  };

  String subtitle(AppLocalizations l) => switch (this) {
    AppFeature.connector => l.featureSubtitleConnector,
    AppFeature.skins => l.featureSubtitleSkins,
    AppFeature.wiki => l.featureSubtitleWiki,
    AppFeature.partners => l.featureSubtitlePartners,
    AppFeature.lookup => l.featureSubtitleLookup,
    AppFeature.tracker => l.featureSubtitleTracker,
  };
}

class HomeCustomizationService extends ChangeNotifier {
  static final HomeCustomizationService instance = HomeCustomizationService._();
  HomeCustomizationService._();

  static const _keyTileOrder = 'home_tile_order';
  static const _keyNavLeft = 'home_nav_left';
  static const _keyNavRight = 'home_nav_right';
  static const _keyHiddenTiles = 'home_hidden_tiles';
  static const _keyWideTile = 'home_wide_tile';
  static const _keyOnboardingDone = 'home_onboarding_done';
  static const _keyStartPage = 'home_start_page';

  static const int minVisibleTiles = 1;

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
  static const Set<AppFeature> alwaysVisible = {};

  List<AppFeature> _tileOrder = List.from(defaultTileOrder);
  AppFeature? _navLeft = defaultNavLeft;
  AppFeature? _navRight = defaultNavRight;
  Set<AppFeature> _hiddenTiles = {};
  AppFeature? _wideTile;
  bool _onboardingDone = false;
  AppFeature _startPage = AppFeature.connector;

  List<AppFeature> get tileOrder => List.unmodifiable(_tileOrder);
  AppFeature? get navLeft => _navLeft;
  AppFeature? get navRight => _navRight;
  Set<AppFeature> get hiddenTiles => Set.unmodifiable(_hiddenTiles);
  AppFeature? get wideTile => _wideTile;
  bool get isOnboardingDone => _onboardingDone;
  AppFeature get startPage => _startPage;

  List<AppFeature> get visibleTiles =>
      _tileOrder.where((f) => !_hiddenTiles.contains(f)).toList();

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
    if (savedLeft == 'none') {
      _navLeft = null;
    } else if (savedLeft != null) {
      _navLeft = AppFeature.values.where((f) => f.id == savedLeft).firstOrNull ?? defaultNavLeft;
    }

    final savedRight = prefs.getString(_keyNavRight);
    if (savedRight == 'none') {
      _navRight = null;
    } else if (savedRight != null) {
      _navRight = AppFeature.values.where((f) => f.id == savedRight).firstOrNull ?? defaultNavRight;
    }

    final savedHidden = prefs.getStringList(_keyHiddenTiles);
    if (savedHidden != null) {
      _hiddenTiles = savedHidden
          .map((s) => AppFeature.values.where((f) => f.id == s).firstOrNull)
          .whereType<AppFeature>()
          .where((f) => !alwaysVisible.contains(f))
          .toSet();
    }

    final savedWide = prefs.getString(_keyWideTile);
    if (savedWide != null) {
      _wideTile = AppFeature.values.where((f) => f.id == savedWide).firstOrNull;
      if (_wideTile != null && _hiddenTiles.contains(_wideTile)) {
        _wideTile = null;
      }
    }

    _onboardingDone = prefs.getBool(_keyOnboardingDone) ?? false;
    _useLandingAsStart = prefs.getBool('home_use_landing') ?? true;
    final savedStart = prefs.getString(_keyStartPage);
    if (savedStart != null) {
      _startPage = AppFeature.values.firstWhere(
        (f) => f.id == savedStart,
        orElse: () => AppFeature.connector,
      );
    }
  }

  bool _useLandingAsStart = true;
  bool get useLandingAsStart => _useLandingAsStart;

  Future<void> resetOnboarding() async {
    _onboardingDone = false;
    _useLandingAsStart = true;
    _startPage = AppFeature.connector;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyOnboardingDone);
    await prefs.remove(_keyStartPage);
    await prefs.remove('home_use_landing');
    notifyListeners();
  }

  Future<void> completeOnboarding(
    AppFeature startPage, {
    bool useLanding = true,
  }) async {
    _onboardingDone = true;
    _startPage = startPage;
    _useLandingAsStart = useLanding;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyOnboardingDone, true);
    await prefs.setString(_keyStartPage, startPage.id);
    await prefs.setBool('home_use_landing', useLanding);
    notifyListeners();
  }

  Future<void> saveTileOrder(List<AppFeature> order) async {
    _tileOrder = List.from(order);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_keyTileOrder, order.map((f) => f.id).toList());
    notifyListeners();
  }

  Future<void> saveNavLeft(AppFeature? feature) async {
    _navLeft = feature;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyNavLeft, feature?.id ?? 'none');
    notifyListeners();
  }

  Future<void> saveNavRight(AppFeature? feature) async {
    _navRight = feature;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyNavRight, feature?.id ?? 'none');
    notifyListeners();
  }

  Future<void> saveHiddenTiles(Set<AppFeature> hidden) async {
    _hiddenTiles = Set.from(hidden.where((f) => !alwaysVisible.contains(f)));
    if (_wideTile != null && _hiddenTiles.contains(_wideTile)) _wideTile = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _keyHiddenTiles,
      _hiddenTiles.map((f) => f.id).toList(),
    );
    if (_wideTile == null) await prefs.remove(_keyWideTile);
    notifyListeners();
  }

  Future<void> saveWideTile(AppFeature? tile) async {
    _wideTile = tile;
    final prefs = await SharedPreferences.getInstance();
    if (tile == null) {
      await prefs.remove(_keyWideTile);
    } else {
      await prefs.setString(_keyWideTile, tile.id);
    }
    notifyListeners();
  }

  Future<void> reset() async {
    _tileOrder = List.from(defaultTileOrder);
    _navLeft = defaultNavLeft;
    _navRight = defaultNavRight;
    _hiddenTiles = {};
    _wideTile = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyTileOrder);
    await prefs.remove(_keyNavLeft);
    await prefs.remove(_keyNavRight);
    await prefs.remove(_keyHiddenTiles);
    await prefs.remove(_keyWideTile);
    notifyListeners();
  }
}
