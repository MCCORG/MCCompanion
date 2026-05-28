import 'package:flutter/material.dart';

class AppTheme {
  static const Color brand      = Color(0xFF67E404);
  static const Color brandDim   = Color(0xFF4DAF00);

  static const Color accent      = Color(0xFF67E404);
  static const Color accentLight = Color(0xFF80F505);
  static const Color accentDark  = Color(0xFF4DAF00);

  static const Color primaryAccent      = accent;
  static const Color primaryAccentLight = accentLight;
  static const Color primaryAccentDark  = accentDark;

  static const Color background    = Color(0xBF0E1117);
  static const Color backgroundDark = background;
  static const Color surface       = Color(0xCC13161E);
  static const Color surfaceDark   = surface;
  static const Color surfaceRaised = Color(0xD91A1D28);
  static const Color surfaceCard   = surfaceRaised;
  static const Color surfaceLight  = Color(0xE0222636);
  static const Color overlay       = Color(0xE02A2E40);

  static const Color borderDim   = Color(0xFF1C1F2E);
  static const Color borderGray  = Color(0xFF272B3C);
  static const Color borderLight = Color(0xFF353A50);

  static const Color textPrimary   = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFE2E5F5);
  static const Color textMuted     = Color(0xFFB0B5CC);
  static const Color textDisabled  = Color(0xFF4A5070);

  static const Color success = Color(0xFF34D399);
  static const Color warning = Color(0xFFFBBF24);
  static const Color error   = Color(0xFFF87171);
  static const Color info    = Color(0xFF60A5FA);

  static const Color modeXbox     = Color(0xFF22C55E);
  static const Color modeNintendo = Color(0xFFEF4444);
  static const Color modeFriends  = Color(0xFF8B5CF6);
  static const Color modeJava     = Color(0xFFF97316);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: accent,
        onPrimary: Colors.white,
        secondary: accentLight,
        onSecondary: Colors.white,
        error: error,
        onError: Colors.white,
        background: background,
        onBackground: textPrimary,
        surface: surface,
        onSurface: textPrimary,
        outline: borderGray,
        surfaceVariant: surfaceRaised,
        onSurfaceVariant: textSecondary,
      ),
      scaffoldBackgroundColor: background,

      cardTheme: CardThemeData(
        color: surface,
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
          foregroundColor: Colors.white,
          backgroundColor: accent,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: accentLight,
          side: const BorderSide(color: borderLight),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: accentLight,
          textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceRaised,
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        hintStyle: const TextStyle(color: textMuted, fontSize: 13),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: borderGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: accent, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: error),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: borderDim),
        ),
      ),

      listTileTheme: const ListTileThemeData(
        tileColor: Colors.transparent,
        iconColor: textSecondary,
        textColor: textPrimary,
      ),

      iconTheme: const IconThemeData(color: textSecondary, size: 20),

      textTheme: const TextTheme(
        displayLarge: TextStyle(
            color: textPrimary, fontSize: 28, fontWeight: FontWeight.w700),
        titleLarge: TextStyle(
            color: textPrimary, fontSize: 18, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
            color: textPrimary, fontSize: 15, fontWeight: FontWeight.w600),
        bodyLarge:  TextStyle(color: textPrimary,   fontSize: 14),
        bodyMedium: TextStyle(color: textSecondary, fontSize: 13),
        bodySmall:  TextStyle(color: textMuted,     fontSize: 11),
        labelLarge: TextStyle(
            color: textSecondary,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: overlay,
        contentTextStyle:
            const TextStyle(color: textPrimary, fontSize: 13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: borderGray),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: surfaceRaised,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: borderGray),
        ),
        titleTextStyle: const TextStyle(
            color: textPrimary, fontSize: 16, fontWeight: FontWeight.w600),
        contentTextStyle:
            const TextStyle(color: textSecondary, fontSize: 13),
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: surfaceRaised,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        elevation: 0,
      ),

      popupMenuTheme: PopupMenuThemeData(
        color: overlay,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: borderGray),
        ),
        textStyle: const TextStyle(color: textPrimary, fontSize: 13),
      ),

      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: overlay,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderGray),
        ),
        textStyle: const TextStyle(color: textPrimary, fontSize: 12),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return accent;
          return Colors.transparent;
        }),
        side: const BorderSide(color: borderLight, width: 1.5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)),
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return accent;
          return textMuted;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return accent.withOpacity(0.35);
          }
          return borderGray;
        }),
      ),
    );
  }
}