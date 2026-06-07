import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccentPreset {
  final String id;
  final String label;
  final Color color;
  const AccentPreset({
    required this.id,
    required this.label,
    required this.color,
  });
}

const List<AccentPreset> accentPresets = [
  AccentPreset(id: 'green', label: 'Green', color: Color(0xFF67E404)),
  AccentPreset(id: 'lime', label: 'Lime', color: Color(0xFFA3E635)),
  AccentPreset(id: 'teal', label: 'Teal', color: Color(0xFF14B8A6)),
  AccentPreset(id: 'cyan', label: 'Cyan', color: Color(0xFF06B6D4)),
  AccentPreset(id: 'blue', label: 'Blue', color: Color(0xFF3B82F6)),
  AccentPreset(id: 'indigo', label: 'Indigo', color: Color(0xFF6366F1)),
  AccentPreset(id: 'purple', label: 'Purple', color: Color(0xFF8B5CF6)),
  AccentPreset(id: 'pink', label: 'Pink', color: Color(0xFFEC4899)),
  AccentPreset(id: 'rose', label: 'Rose', color: Color(0xFFF43F5E)),
  AccentPreset(id: 'red', label: 'Red', color: Color(0xFFEF4444)),
  AccentPreset(id: 'orange', label: 'Orange', color: Color(0xFFF97316)),
  AccentPreset(id: 'amber', label: 'Amber', color: Color(0xFFF59E0B)),
  AccentPreset(id: 'yellow', label: 'Yellow', color: Color(0xFFEAB308)),
  AccentPreset(id: 'white', label: 'White', color: Color(0xFFE2E5F5)),
];

class BgPreset {
  final String id;
  final String label;
  final Color base;
  final Color tint;
  const BgPreset({
    required this.id,
    required this.label,
    required this.base,
    required this.tint,
  });
}

const List<BgPreset> bgPresets = [
  BgPreset(
    id: 'slate',
    label: 'Slate',
    base: Color(0xFF0E1117),
    tint: Color(0xFF334155),
  ),
  BgPreset(
    id: 'black',
    label: 'Dark',
    base: Color(0xFF080808),
    tint: Color(0xFF1F2937),
  ),
  BgPreset(
    id: 'navy',
    label: 'Navy',
    base: Color(0xFF080D1A),
    tint: Color(0xFF1E3A5F),
  ),
  BgPreset(
    id: 'forest',
    label: 'Forest',
    base: Color(0xFF080F0D),
    tint: Color(0xFF14532D),
  ),
  BgPreset(
    id: 'plum',
    label: 'Plum',
    base: Color(0xFF0E0812),
    tint: Color(0xFF4C1D95),
  ),
  BgPreset(
    id: 'crimson',
    label: 'Crimson',
    base: Color(0xFF120808),
    tint: Color(0xFF7F1D1D),
  ),
  BgPreset(
    id: 'coffee',
    label: 'Coffee',
    base: Color(0xFF100C08),
    tint: Color(0xFF78350F),
  ),
];

class CardPreset {
  final String id;
  final String label;
  final Color color;
  const CardPreset({
    required this.id,
    required this.label,
    required this.color,
  });
}

const List<CardPreset> cardPresets = [
  CardPreset(id: 'neutral', label: 'Neutral', color: Color(0xFF1C2033)),
  CardPreset(id: 'slate', label: 'Slate', color: Color(0xFF283548)),
  CardPreset(id: 'navy', label: 'Navy', color: Color(0xFF0F2040)),
  CardPreset(id: 'forest', label: 'Forest', color: Color(0xFF0F2D1F)),
  CardPreset(id: 'plum', label: 'Plum', color: Color(0xFF2D1548)),
  CardPreset(id: 'crimson', label: 'Crimson', color: Color(0xFF3D1212)),
  CardPreset(id: 'coffee', label: 'Coffee', color: Color(0xFF2D1E0F)),
];

int _hexToInt(String hex) => int.parse(hex.padLeft(8, 'FF'), radix: 16);
String _colorToHex(Color c) =>
    c.toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase();

class ThemeService extends ChangeNotifier {
  static final ThemeService instance = ThemeService._();
  ThemeService._();

  static const _keyAccent = 'theme_accent';
  static const _keyBg = 'theme_bg';
  static const _keyOpacity = 'theme_accent_opacity';
  static const _keyCard = 'theme_card';
  static const _keyCardOpacity = 'theme_card_opacity';
  static const _keyCustomAccent = 'theme_custom_accent';
  static const _keyCustomBg = 'theme_custom_bg';
  static const _keyCustomCard = 'theme_custom_card';
  static const _keyTextColor = 'theme_text_color';

  AccentPreset _accent = accentPresets[0];
  BgPreset _bg = bgPresets[0];
  double _opacity = 1.0;
  CardPreset _card = cardPresets[0];
  double _cardOpacity = 1.0;

  Color? _customAccent;
  Color? _customBg;
  Color? _customCard;
  Color? _customText;

  AccentPreset get accent => _accent;
  BgPreset get bg => _bg;
  double get opacity => _opacity;
  CardPreset get card => _card;
  double get cardOpacity => _cardOpacity;
  Color? get customAccent => _customAccent;
  Color? get customBg => _customBg;
  Color? get customCard => _customCard;
  Color? get customText => _customText;

  Color get _effectiveAccent => _customAccent ?? _accent.color;
  Color get _effectiveBg => _customBg ?? _bg.base;
  Color get _effectiveCard => _customCard ?? _card.color;

  Color get accentColor => _effectiveAccent.withValues(alpha: _opacity);
  Color get accentLight => Color.lerp(
    _effectiveAccent,
    Colors.white,
    0.18,
  )!.withValues(alpha: _opacity);
  Color get accentDark => Color.lerp(
    _effectiveAccent,
    Colors.black,
    0.20,
  )!.withValues(alpha: _opacity);

  Color get background => _effectiveBg;
  Color get surface => _layerColor(0.07);
  Color get surfaceRaised => _effectiveCard.withValues(alpha: _cardOpacity);
  Color get surfaceLight => _cardLighter(0.05).withValues(alpha: _cardOpacity);
  Color get overlay => _cardLighter(0.10).withValues(alpha: _cardOpacity);
  Color get surfaceRaisedSolid => _effectiveCard;

  Color get textPrimary => _customText ?? const Color(0xFFFFFFFF);
  Color get textSecondary => _customText != null
      ? Color.lerp(_customText!, Colors.black, 0.12)!
      : const Color(0xFFE2E5F5);
  Color get textMuted => _customText != null
      ? Color.lerp(_customText!, Colors.black, 0.30)!
      : const Color(0xFFB0B5CC);

  Color _layerColor(double lightness) {
    final hsl = HSLColor.fromColor(_effectiveBg);
    return hsl
        .withLightness((hsl.lightness + lightness).clamp(0.0, 1.0))
        .toColor();
  }

  Color _cardLighter(double lightness) {
    final hsl = HSLColor.fromColor(_effectiveCard);
    return hsl
        .withLightness((hsl.lightness + lightness).clamp(0.0, 1.0))
        .toColor();
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final accentId = prefs.getString(_keyAccent);
    final bgId = prefs.getString(_keyBg);
    final op = prefs.getDouble(_keyOpacity);
    final cardId = prefs.getString(_keyCard);
    final cardOp = prefs.getDouble(_keyCardOpacity);
    final custAcc = prefs.getString(_keyCustomAccent);
    final custBg = prefs.getString(_keyCustomBg);
    final custCard = prefs.getString(_keyCustomCard);
    final custText = prefs.getString(_keyTextColor);

    if (accentId != null)
      _accent = accentPresets.firstWhere(
        (p) => p.id == accentId,
        orElse: () => accentPresets[0],
      );
    if (bgId != null)
      _bg = bgPresets.firstWhere(
        (p) => p.id == bgId,
        orElse: () => bgPresets[0],
      );
    if (op != null) _opacity = op.clamp(0.3, 1.0);
    if (cardId != null)
      _card = cardPresets.firstWhere(
        (p) => p.id == cardId,
        orElse: () => cardPresets[0],
      );
    if (cardOp != null) _cardOpacity = cardOp.clamp(0.1, 1.0);
    if (custAcc != null) _customAccent = Color(_hexToInt(custAcc));
    if (custBg != null) _customBg = Color(_hexToInt(custBg));
    if (custCard != null) _customCard = Color(_hexToInt(custCard));
    if (custText != null) _customText = Color(_hexToInt(custText));
  }

  void setAccentLive(AccentPreset preset) {
    _accent = preset;
    _customAccent = null;
    notifyListeners();
  }

  void setCustomAccentLive(Color c) {
    _customAccent = c;
    notifyListeners();
  }

  void setOpacityLive(double value) {
    _opacity = value.clamp(0.3, 1.0);
    notifyListeners();
  }

  void setBgLive(BgPreset preset) {
    _bg = preset;
    _customBg = null;
    notifyListeners();
  }

  void setCustomBgLive(Color c) {
    _customBg = c;
    notifyListeners();
  }

  void setCardLive(CardPreset preset) {
    _card = preset;
    _customCard = null;
    notifyListeners();
  }

  void setCustomCardLive(Color c) {
    _customCard = c;
    notifyListeners();
  }

  void setCardOpacityLive(double value) {
    _cardOpacity = value.clamp(0.1, 1.0);
    notifyListeners();
  }

  void setTextColorLive(Color? c) {
    _customText = c;
    notifyListeners();
  }

  Future<void> saveAll() async {
    final prefs = await SharedPreferences.getInstance();
    final futures = <Future>[
      prefs.setString(_keyAccent, _accent.id),
      prefs.setString(_keyBg, _bg.id),
      prefs.setDouble(_keyOpacity, _opacity),
      prefs.setString(_keyCard, _card.id),
      prefs.setDouble(_keyCardOpacity, _cardOpacity),
    ];
    if (_customAccent != null)
      futures.add(
        prefs.setString(_keyCustomAccent, _colorToHex(_customAccent!)),
      );
    else
      futures.add(prefs.remove(_keyCustomAccent));
    if (_customBg != null)
      futures.add(prefs.setString(_keyCustomBg, _colorToHex(_customBg!)));
    else
      futures.add(prefs.remove(_keyCustomBg));
    if (_customCard != null)
      futures.add(prefs.setString(_keyCustomCard, _colorToHex(_customCard!)));
    else
      futures.add(prefs.remove(_keyCustomCard));
    if (_customText != null)
      futures.add(prefs.setString(_keyTextColor, _colorToHex(_customText!)));
    else
      futures.add(prefs.remove(_keyTextColor));
    await Future.wait(futures);
  }

  Future<void> reset() async {
    _accent = accentPresets[0];
    _bg = bgPresets[0];
    _opacity = 1.0;
    _card = cardPresets[0];
    _cardOpacity = 1.0;
    _customAccent = null;
    _customBg = null;
    _customCard = null;
    _customText = null;
    final prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.remove(_keyAccent),
      prefs.remove(_keyBg),
      prefs.remove(_keyOpacity),
      prefs.remove(_keyCard),
      prefs.remove(_keyCardOpacity),
      prefs.remove(_keyCustomAccent),
      prefs.remove(_keyCustomBg),
      prefs.remove(_keyCustomCard),
      prefs.remove(_keyTextColor),
    ]);
    notifyListeners();
  }
}
