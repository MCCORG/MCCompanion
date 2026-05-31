import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccentPreset {
  final String id;
  final String label;
  final Color color;
  const AccentPreset({required this.id, required this.label, required this.color});
}

const List<AccentPreset> accentPresets = [
  AccentPreset(id: 'green',   label: 'Green',   color: Color(0xFF67E404)),
  AccentPreset(id: 'lime',    label: 'Lime',    color: Color(0xFFA3E635)),
  AccentPreset(id: 'teal',    label: 'Teal',    color: Color(0xFF14B8A6)),
  AccentPreset(id: 'cyan',    label: 'Cyan',    color: Color(0xFF06B6D4)),
  AccentPreset(id: 'blue',    label: 'Blue',    color: Color(0xFF3B82F6)),
  AccentPreset(id: 'indigo',  label: 'Indigo',  color: Color(0xFF6366F1)),
  AccentPreset(id: 'purple',  label: 'Purple',  color: Color(0xFF8B5CF6)),
  AccentPreset(id: 'pink',    label: 'Pink',    color: Color(0xFFEC4899)),
  AccentPreset(id: 'rose',    label: 'Rose',    color: Color(0xFFF43F5E)),
  AccentPreset(id: 'red',     label: 'Red',     color: Color(0xFFEF4444)),
  AccentPreset(id: 'orange',  label: 'Orange',  color: Color(0xFFF97316)),
  AccentPreset(id: 'amber',   label: 'Amber',   color: Color(0xFFF59E0B)),
  AccentPreset(id: 'yellow',  label: 'Yellow',  color: Color(0xFFEAB308)),
  AccentPreset(id: 'white',   label: 'White',   color: Color(0xFFE2E5F5)),
];

class BgPreset {
  final String id;
  final String label;
  final Color base;
  final Color tint;
  const BgPreset({required this.id, required this.label, required this.base, required this.tint});
}

const List<BgPreset> bgPresets = [
  BgPreset(id: 'slate',  label: 'Slate',  base: Color(0xFF0E1117), tint: Color(0xFF334155)),
  BgPreset(id: 'black',  label: 'Dark',   base: Color(0xFF080808), tint: Color(0xFF1F2937)),
  BgPreset(id: 'navy',   label: 'Navy',   base: Color(0xFF080D1A), tint: Color(0xFF1E3A5F)),
  BgPreset(id: 'forest', label: 'Forest', base: Color(0xFF080F0D), tint: Color(0xFF14532D)),
  BgPreset(id: 'plum',   label: 'Plum',   base: Color(0xFF0E0812), tint: Color(0xFF4C1D95)),
  BgPreset(id: 'crimson',label: 'Crimson',base: Color(0xFF120808), tint: Color(0xFF7F1D1D)),
  BgPreset(id: 'coffee', label: 'Coffee', base: Color(0xFF100C08), tint: Color(0xFF78350F)),
];

class CardPreset {
  final String id;
  final String label;
  final Color color;
  const CardPreset({required this.id, required this.label, required this.color});
}

const List<CardPreset> cardPresets = [
  CardPreset(id: 'neutral', label: 'Neutral', color: Color(0xFF1C2033)),
  CardPreset(id: 'slate',   label: 'Slate',   color: Color(0xFF283548)),
  CardPreset(id: 'navy',    label: 'Navy',    color: Color(0xFF0F2040)),
  CardPreset(id: 'forest',  label: 'Forest',  color: Color(0xFF0F2D1F)),
  CardPreset(id: 'plum',    label: 'Plum',    color: Color(0xFF2D1548)),
  CardPreset(id: 'crimson', label: 'Crimson', color: Color(0xFF3D1212)),
  CardPreset(id: 'coffee',  label: 'Coffee',  color: Color(0xFF2D1E0F)),
];

class ThemeService extends ChangeNotifier {
  static final ThemeService instance = ThemeService._();
  ThemeService._();

  static const _keyAccent      = 'theme_accent';
  static const _keyBg          = 'theme_bg';
  static const _keyOpacity     = 'theme_accent_opacity';
  static const _keyCard        = 'theme_card';
  static const _keyCardOpacity = 'theme_card_opacity';

  AccentPreset _accent      = accentPresets[0];
  BgPreset     _bg          = bgPresets[0];
  double       _opacity     = 1.0;
  CardPreset   _card        = cardPresets[0];
  double       _cardOpacity = 1.0;

  AccentPreset get accent      => _accent;
  BgPreset     get bg          => _bg;
  double       get opacity     => _opacity;
  CardPreset   get card        => _card;
  double       get cardOpacity => _cardOpacity;

  Color get accentColor => _accent.color.withOpacity(_opacity);
  Color get accentLight => Color.lerp(_accent.color, Colors.white, 0.18)!.withOpacity(_opacity);
  Color get accentDark  => Color.lerp(_accent.color, Colors.black, 0.20)!.withOpacity(_opacity);

  Color get background         => _bg.base;
  Color get surface            => _layerColor(0.07);
  Color get surfaceRaised      => _card.color.withOpacity(_cardOpacity);
  Color get surfaceLight       => _cardLighter(0.05).withOpacity(_cardOpacity);
  Color get overlay            => _cardLighter(0.10).withOpacity(_cardOpacity);
  Color get surfaceRaisedSolid => _card.color;

  Color _layerColor(double lightness) {
    final hsl = HSLColor.fromColor(_bg.base);
    return hsl.withLightness((hsl.lightness + lightness).clamp(0.0, 1.0)).toColor();
  }

  Color _cardLighter(double lightness) {
    final hsl = HSLColor.fromColor(_card.color);
    return hsl.withLightness((hsl.lightness + lightness).clamp(0.0, 1.0)).toColor();
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final accentId = prefs.getString(_keyAccent);
    final bgId     = prefs.getString(_keyBg);
    final op       = prefs.getDouble(_keyOpacity);
    final cardId   = prefs.getString(_keyCard);
    final cardOp   = prefs.getDouble(_keyCardOpacity);

    if (accentId != null)
      _accent = accentPresets.firstWhere((p) => p.id == accentId, orElse: () => accentPresets[0]);
    if (bgId != null)
      _bg = bgPresets.firstWhere((p) => p.id == bgId, orElse: () => bgPresets[0]);
    if (op != null) _opacity = op.clamp(0.3, 1.0);
    if (cardId != null)
      _card = cardPresets.firstWhere((p) => p.id == cardId, orElse: () => cardPresets[0]);
    if (cardOp != null) _cardOpacity = cardOp.clamp(0.1, 1.0);
  }

  Future<void> setAccent(AccentPreset preset) async {
    _accent = preset;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAccent, preset.id);
    notifyListeners();
  }

  Future<void> setOpacity(double value) async {
    _opacity = value.clamp(0.3, 1.0);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyOpacity, _opacity);
    notifyListeners();
  }

  Future<void> setBg(BgPreset preset) async {
    _bg = preset;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyBg, preset.id);
    notifyListeners();
  }

  Future<void> setCard(CardPreset preset) async {
    _card = preset;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyCard, preset.id);
    notifyListeners();
  }

  Future<void> setCardOpacity(double value) async {
    _cardOpacity = value.clamp(0.1, 1.0);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyCardOpacity, _cardOpacity);
    notifyListeners();
  }

  Future<void> reset() async {
    _accent      = accentPresets[0];
    _bg          = bgPresets[0];
    _opacity     = 1.0;
    _card        = cardPresets[0];
    _cardOpacity = 1.0;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyAccent);
    await prefs.remove(_keyBg);
    await prefs.remove(_keyOpacity);
    await prefs.remove(_keyCard);
    await prefs.remove(_keyCardOpacity);
    notifyListeners();
  }
}
