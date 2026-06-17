import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/region_detector.dart';
import '../services/relay_service.dart';
import '../services/connectivity_checker.dart';
import '../widgets/dialogs/connectivity_warning_dialog.dart';
import '../l10n/app_localizations.dart';
import 'app_shell.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  RelayPingResult? _detectedRelay;
  ConnectivityCheckResult? _connectivityResult;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _startSequence();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  Future<void> _startSequence() async {
    _fadeController.forward();

    await Future.wait([
      RegionDetector.detectBestRelay().then((relay) {
        _detectedRelay = relay;
        RelayService.setRelay(relay);
      }).catchError((_) {}),
      ConnectivityChecker.check().then((result) {
        _connectivityResult = result;
      }),
      Future.delayed(const Duration(milliseconds: 2000)),
    ]);

    if (!mounted) return;

    if (_connectivityResult != null) {
      await ConnectivityWarningDialog.showIfNeeded(
        context,
        _connectivityResult!,
      );
      if (!mounted) return;
    }

    _navigateToHome();
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, animation, __) =>
            AppShell(initialRelay: _detectedRelay),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  List<Widget> _featureItems(List<String> labels) {
    final items = <Widget>[];
    for (int i = 0; i < labels.length; i++) {
      items.add(
        Text(
          labels[i],
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.75),
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
            shadows: const [Shadow(color: Colors.black54, blurRadius: 6)],
          ),
        ),
      );
      if (i < labels.length - 1) {
        items.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '·',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.35),
                fontSize: 12,
                shadows: const [Shadow(color: Colors.black54, blurRadius: 6)],
              ),
            ),
          ),
        );
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/splash.png', fit: BoxFit.cover),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Center(
                    child: Image.asset('assets/images/logo.png', height: 340),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _featureItems([
                      AppLocalizations.of(context)!.splashFeatureConnect,
                      AppLocalizations.of(context)!.splashFeatureFriends,
                      AppLocalizations.of(context)!.splashFeatureChat,
                      AppLocalizations.of(context)!.splashFeatureSkins,
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
