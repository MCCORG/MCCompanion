import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/theme_service.dart';

class AppTheme {

  static Color get brand      => ThemeService.instance.accentColor;
  static Color get brandDim   => ThemeService.instance.accentDark;

  static Color get accent      => ThemeService.instance.accentColor;
  static Color get accentLight => ThemeService.instance.accentLight;
  static Color get accentDark  => ThemeService.instance.accentDark;

  static Color get primaryAccent      => accent;
  static Color get primaryAccentLight => accentLight;
  static Color get primaryAccentDark  => accentDark;

  static Color get background    => ThemeService.instance.background;
  static Color get backgroundDark => ThemeService.instance.background;
  static Color get surface            => ThemeService.instance.surface;
  static Color get surfaceDark        => ThemeService.instance.surface;
  static Color get surfaceRaised      => ThemeService.instance.surfaceRaised;
  static Color get surfaceCard        => ThemeService.instance.surfaceRaised;
  static Color get surfaceLight       => ThemeService.instance.surfaceLight;
  static Color get overlay            => ThemeService.instance.overlay;
  static Color get surfaceRaisedSolid => ThemeService.instance.surfaceRaisedSolid;

  static const Color borderDim   = Color(0xFF1C1F2E);
  static const Color borderGray  = Color(0xFF272B3C);
  static const Color borderLight = Color(0xFF353A50);

  static Color get textPrimary   => ThemeService.instance.textPrimary;
  static Color get textSecondary => ThemeService.instance.textSecondary;
  static Color get textMuted     => ThemeService.instance.textMuted;
  static const Color textDisabled  = Color(0xFF4A5070);

  static const Color success   = Color(0xFF34D399);
  static const Color warning   = Color(0xFFFBBF24);
  static const Color error     = Color(0xFFF87171);
  static const Color info      = Color(0xFF60A5FA);
  static const Color xboxGreen = Color(0xFF107C10);
  static const Color javaBlue  = Color(0xFF1565C0);

  static const Color modeXbox     = Color(0xFF22C55E);
  static const Color modeNintendo = Color(0xFFEF4444);
  static const Color modeFriends  = Color(0xFF8B5CF6);
  static const Color modeJava     = Color(0xFFF97316);

  static ThemeData get darkTheme {
    final a   = accent;
    final al  = accentLight;
    final bg  = background;
    final sf  = surface;
    final sr  = surfaceRaised;
    final ov  = overlay;
    final tp  = textPrimary;
    final ts  = textSecondary;
    final tm  = textMuted;

    Color onColor(Color c) =>
        ThemeData.estimateBrightnessForColor(c) == Brightness.dark
            ? Colors.white
            : const Color(0xFF0E1117);
    final onA  = onColor(a);
    final onAl = onColor(al);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: a,
        onPrimary: onA,
        secondary: al,
        onSecondary: onAl,
        error: error,
        onError: Colors.white,
        background: bg,
        onBackground: textPrimary,
        surface: sf,
        onSurface: textPrimary,
        outline: borderGray,
        surfaceVariant: sr,
        onSurfaceVariant: textSecondary,
      ),
      scaffoldBackgroundColor: bg,

      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          systemStatusBarContrastEnforced: false,
          systemNavigationBarContrastEnforced: false,
        ),
      ),

      cardTheme: CardThemeData(
        color: sf,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: borderGray),
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: borderGray,
        thickness: 1,
        space: 1,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: onA,
          backgroundColor: a,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: al,
          side: const BorderSide(color: borderLight),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: al,
          textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: sr,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        hintStyle: TextStyle(color: tm, fontSize: 13),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: borderGray)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: a, width: 1.5)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: error)),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: borderDim)),
      ),

      listTileTheme: ListTileThemeData(tileColor: Colors.transparent, iconColor: ts, textColor: tp),
      iconTheme: IconThemeData(color: ts, size: 20),

      textTheme: TextTheme(
        displayLarge: TextStyle(color: tp, fontSize: 28, fontWeight: FontWeight.w700),
        titleLarge:   TextStyle(color: tp, fontSize: 18, fontWeight: FontWeight.w600),
        titleMedium:  TextStyle(color: tp, fontSize: 15, fontWeight: FontWeight.w600),
        bodyLarge:    TextStyle(color: tp,   fontSize: 14),
        bodyMedium:   TextStyle(color: ts, fontSize: 13),
        bodySmall:    TextStyle(color: tm,     fontSize: 11),
        labelLarge:   TextStyle(color: ts, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 1.2),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: ov,
        contentTextStyle: TextStyle(color: tp, fontSize: 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: const BorderSide(color: borderGray)),
        behavior: SnackBarBehavior.floating,
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: sr,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: borderGray)),
        titleTextStyle: TextStyle(color: tp, fontSize: 16, fontWeight: FontWeight.w600),
        contentTextStyle: TextStyle(color: ts, fontSize: 13),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: bg,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        elevation: 0,
      ),

      popupMenuTheme: PopupMenuThemeData(
        color: ov,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: borderGray)),
        textStyle: TextStyle(color: tp, fontSize: 13),
      ),

      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(color: ov, borderRadius: BorderRadius.circular(8), border: Border.all(color: borderGray)),
        textStyle: TextStyle(color: tp, fontSize: 12),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return a;
          return Colors.transparent;
        }),
        side: const BorderSide(color: borderLight, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return a;
          return textMuted;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return a.withValues(alpha: 0.35);
          return borderGray;
        }),
      ),
    );
  }
}
