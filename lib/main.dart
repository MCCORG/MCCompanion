import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';
import 'l10n/app_localizations.dart';
import 'services/locale_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await loadSavedLocale();
  runApp(const MCCompanionApp());
}

class MCCompanionApp extends StatelessWidget {
  const MCCompanionApp({super.key});

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
        );
      },
    );
  }
}