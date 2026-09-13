import 'package:flutter/material.dart';
import '../design/design.dart';
import '../services/region_detector.dart';
import '../services/relay_service.dart';
import '../services/connectivity_checker.dart';
import '../widgets/dialogs/connectivity_warning_dialog.dart';
import '../l10n/app_localizations.dart';
import '../widgets/components/animated_wordmark.dart';
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

  RelaySelection? _detectedRelay;
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
      RegionDetector.resolve()
          .then((relay) {
            _detectedRelay = relay;
            RelayService.setRelay(relay);
          })
          .catchError((_) {}),
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
        pageBuilder: (_, animation, _) =>
            AppShell(initialRelay: _detectedRelay),
        transitionsBuilder: (_, animation, _, child) =>
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
          style: DsType.caption.copyWith(fontWeight: FontWeight.w600),
        ),
      );
      if (i < labels.length - 1) {
        items.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text('·', style: DsType.caption),
          ),
        );
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DsColor.bg,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: DsSpace.xxl),
                child: AnimatedWordmark(asset: 'assets/images/logo.png'),
              ),
              const SizedBox(height: DsSpace.xxl),
              SizedBox(
                width: 96,
                child: LinearProgressIndicator(
                  minHeight: 2,
                  backgroundColor: DsColor.line,
                  color: DsColor.accent,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  DsSpace.lg,
                  0,
                  DsSpace.lg,
                  DsSpace.xl,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _featureItems([
                    AppLocalizations.of(context)!.featureLabelConnector,
                    AppLocalizations.of(context)!.featureLabelPartners,
                    AppLocalizations.of(context)!.featureLabelSkins,
                    AppLocalizations.of(context)!.featureLabelLookup,
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
