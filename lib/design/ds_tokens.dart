import 'package:flutter/material.dart';

import '../services/theme_service.dart';

class DsSpace {
  const DsSpace._();

  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;

  static const double gutter = 20;
  static const double section = 28;
}

class DsRadius {
  const DsRadius._();

  static const double control = 14;
  static const double card = 18;
  static const double sheet = 24;
  static const double pill = 999;

  static BorderRadius get controlR => BorderRadius.circular(control);
  static BorderRadius get cardR => BorderRadius.circular(card);
  static BorderRadius get pillR => BorderRadius.circular(pill);
}

class DsDuration {
  const DsDuration._();

  static const Duration fast = Duration(milliseconds: 120);
  static const Duration normal = Duration(milliseconds: 200);
}

class DsColor {
  const DsColor._();

  static ThemeService get _t => ThemeService.instance;

  static Color get bg => _t.background;
  static Color get surface => _t.surfaceRaisedSolid;
  static Color get surfaceQuiet =>
      Color.alphaBlend(Colors.white.withValues(alpha: 0.03), _t.background);
  static Color get inset =>
      Color.alphaBlend(Colors.black.withValues(alpha: 0.22), _t.background);

  static Color get accent => _t.accentColor;
  static Color get onAccent =>
      _t.accentColor.computeLuminance() > 0.45 ? Colors.black : Colors.white;

  static Color get text => _t.textPrimary;
  static Color get textSoft => _t.textSecondary;
  static Color get textFaint => _t.textMuted;
  static Color get textDisabled => _t.textMuted.withValues(alpha: 0.45);

  static Color get line => _t.textPrimary.withValues(alpha: 0.08);
  static Color get lineStrong => _t.textPrimary.withValues(alpha: 0.16);

  static const Color success = Color(0xFF3FBF6F);
  static const Color warning = Color(0xFFE0A320);
  static const Color danger = Color(0xFFE05252);
  static const Color info = Color(0xFF4C8DFF);

  static Color tint(Color base, double alpha) => base.withValues(alpha: alpha);
}

class DsType {
  const DsType._();

  static TextStyle get display => TextStyle(
    color: DsColor.text,
    fontSize: 28,
    height: 1.15,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.6,
  );

  static TextStyle get title => TextStyle(
    color: DsColor.text,
    fontSize: 20,
    height: 1.2,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
  );

  static TextStyle get heading => TextStyle(
    color: DsColor.text,
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.1,
  );

  static TextStyle get body => TextStyle(
    color: DsColor.text,
    fontSize: 15,
    height: 1.35,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get bodyStrong => body.copyWith(fontWeight: FontWeight.w600);

  static TextStyle get label => TextStyle(
    color: DsColor.textSoft,
    fontSize: 13,
    height: 1.3,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get caption => TextStyle(
    color: DsColor.textFaint,
    fontSize: 12.5,
    height: 1.35,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get mono => TextStyle(
    color: DsColor.textSoft,
    fontSize: 12.5,
    height: 1.3,
    fontWeight: FontWeight.w500,
    fontFeatures: const [FontFeature.tabularFigures()],
  );
}
