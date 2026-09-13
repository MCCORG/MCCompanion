import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';

enum AppFeature { connector, skins, partners, lookup, tracker }

extension AppFeatureLabel on AppFeature {
  String get id => name;

  String label(AppLocalizations l) => switch (this) {
    AppFeature.connector => l.featureLabelConnector,
    AppFeature.skins => l.featureLabelSkins,
    AppFeature.partners => l.featureLabelPartners,
    AppFeature.lookup => l.featureLabelLookup,
    AppFeature.tracker => l.featureLabelTracker,
  };

  int get colorValue => switch (this) {
    AppFeature.connector => 0xFF67E404,
    AppFeature.skins => 0xFF42A5F5,
    AppFeature.partners => 0xFFFFB300,
    AppFeature.lookup => 0xFF7B61FF,
    AppFeature.tracker => 0xFF00BCD4,
  };
}

class HomeCustomizationService extends ChangeNotifier {
  static final HomeCustomizationService instance = HomeCustomizationService._();
  HomeCustomizationService._();

  static const _keyNavOuter = 'home_nav_outer';
  static const _keyNavFar = 'home_nav_far';
  static const _keyNavLeft = 'home_nav_left';
  static const _keyNavRight = 'home_nav_right';
  static const _keyOnboardingDone = 'home_onboarding_done';

  static const AppFeature defaultNavOuter = AppFeature.partners;
  static const AppFeature defaultNavFar = AppFeature.tracker;
  static const AppFeature defaultNavLeft = AppFeature.skins;
  static const AppFeature defaultNavRight = AppFeature.lookup;

  static const Set<AppFeature> navSlotBlacklist = {AppFeature.connector};

  AppFeature? _navOuter = defaultNavOuter;
  AppFeature? _navFar = defaultNavFar;
  AppFeature? _navLeft = defaultNavLeft;
  AppFeature? _navRight = defaultNavRight;
  bool _onboardingDone = false;

  AppFeature? get navOuter => _navOuter;
  AppFeature? get navFar => _navFar;
  AppFeature? get navLeft => _navLeft;
  AppFeature? get navRight => _navRight;
  bool get isOnboardingDone => _onboardingDone;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    final savedOuter = prefs.getString(_keyNavOuter);
    if (savedOuter == 'none') {
      _navOuter = null;
    } else if (savedOuter != null) {
      _navOuter =
          AppFeature.values.where((f) => f.id == savedOuter).firstOrNull ??
          defaultNavOuter;
    }

    final savedFar = prefs.getString(_keyNavFar);
    if (savedFar == 'none') {
      _navFar = null;
    } else if (savedFar != null) {
      _navFar =
          AppFeature.values.where((f) => f.id == savedFar).firstOrNull ??
          defaultNavFar;
    }

    final savedLeft = prefs.getString(_keyNavLeft);
    if (savedLeft == 'none') {
      _navLeft = null;
    } else if (savedLeft != null) {
      _navLeft =
          AppFeature.values.where((f) => f.id == savedLeft).firstOrNull ??
          defaultNavLeft;
    }

    final savedRight = prefs.getString(_keyNavRight);
    if (savedRight == 'none') {
      _navRight = null;
    } else if (savedRight != null) {
      _navRight =
          AppFeature.values.where((f) => f.id == savedRight).firstOrNull ??
          defaultNavRight;
    }

    _onboardingDone = prefs.getBool(_keyOnboardingDone) ?? false;
  }

  Future<void> completeOnboarding() async {
    _onboardingDone = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyOnboardingDone, true);
    notifyListeners();
  }

  Future<void> saveNavOuter(AppFeature? feature) async {
    _navOuter = feature;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyNavOuter, feature?.id ?? 'none');
    notifyListeners();
  }

  Future<void> saveNavFar(AppFeature? feature) async {
    _navFar = feature;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyNavFar, feature?.id ?? 'none');
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

  Future<void> reset() async {
    _navOuter = defaultNavOuter;
    _navFar = defaultNavFar;
    _navLeft = defaultNavLeft;
    _navRight = defaultNavRight;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyNavOuter);
    await prefs.remove(_keyNavFar);
    await prefs.remove(_keyNavLeft);
    await prefs.remove(_keyNavRight);
    notifyListeners();
  }
}
