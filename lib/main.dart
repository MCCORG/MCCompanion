import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';
import 'l10n/app_localizations.dart';
import 'services/locale_provider.dart';
import 'services/home_customization_service.dart';
import 'services/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await loadSavedLocale();
  await HomeCustomizationService.instance.load();
  await ThemeService.instance.load();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark, 
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  runApp(const MCCompanionApp());
}

class MCCompanionApp extends StatefulWidget {
  const MCCompanionApp({super.key});

  @override
  State<MCCompanionApp> createState() => _MCCompanionAppState();
}

class _MCCompanionAppState extends State<MCCompanionApp> {
  @override
  void initState() {
    super.initState();
    ThemeService.instance.addListener(_onThemeChanged);
  }

  @override
  void dispose() {
    ThemeService.instance.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onThemeChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale?>(
      valueListenable: appLocale,
      builder: (context, locale, child) {
        return MaterialApp(
          title: 'MCCompanion',
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          localeResolutionCallback:
              (Locale? platformLocale, Iterable<Locale> supportedLocales) {
                if (locale != null) return locale;
                if (platformLocale != null) {
                  for (final supported in supportedLocales) {
                    if (supported.languageCode == platformLocale.languageCode) {
                      return supported;
                    }
                  }
                }
                return const Locale('en');
              },
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            overscroll: false,
            physics: const ClampingScrollPhysics(),
          ),
          theme: AppTheme.darkTheme,
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            final isDesktop = Platform.isMacOS || Platform.isWindows || Platform.isLinux;
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(isDesktop ? 1.12 : 1.0),
              ),
              child: child!,
            );
          },
        );
      },
    );
  }
}