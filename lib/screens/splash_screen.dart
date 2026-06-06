import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
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
  String _appVersion = '';
  bool _pendingUpdate = false;
  ConnectivityCheckResult? _connectivityResult;

  static const String _androidStoreUrl =
      'https://play.google.com/store/apps/details?id=net.netherdev.netherLink';
  static const String _iosStoreUrl =
      'https://apps.apple.com/be/app/netherlink/id6747323142';
  static const String _windowsStoreUrl =
      'https://apps.microsoft.com/detail/9NSFPT6D8PTR';
  static const String _fallbackUrl = 'https://mccompanion.net/';

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

    final info = await PackageInfo.fromPlatform();
    if (mounted) setState(() => _appVersion = info.version);

    await Future.wait([
      _detectRelayAndCheckUpdate().then((hasUpdate) {
        _pendingUpdate = hasUpdate;
      }),
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

    if (_pendingUpdate) {
      final shouldContinue = await _showUpdateDialog();
      if (!mounted) return;
      if (!shouldContinue) return;
    }

    _navigateToHome();
  }

  Future<bool> _detectRelayAndCheckUpdate() async {
    try {
      _detectedRelay = await RegionDetector.detectBestRelay();
      RelayService.setRelay(_detectedRelay!);
      String? remoteVersion = _detectedRelay?.version;
      if (remoteVersion == null) {
        remoteVersion = await _fetchVersionFallback(_detectedRelay!.base);
      }
      if (remoteVersion != null && _appVersion.isNotEmpty) {
        return _isNewerVersion(_appVersion, remoteVersion);
      }
    } catch (_) {}
    return false;
  }

  Future<String?> _fetchVersionFallback(String base) async {
    try {
      final response = await http
          .get(Uri.parse('$base/api/version'))
          .timeout(const Duration(seconds: 6));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['version'] as String?;
      }
    } catch (_) {}
    return null;
  }

  bool _isNewerVersion(String current, String remote) {
    final c = current.split('.').map(int.tryParse).toList();
    final r = remote.split('.').map(int.tryParse).toList();
    final len = c.length > r.length ? c.length : r.length;
    for (int i = 0; i < len; i++) {
      final cv = i < c.length ? (c[i] ?? 0) : 0;
      final rv = i < r.length ? (r[i] ?? 0) : 0;
      if (rv > cv) return true;
      if (rv < cv) return false;
    }
    return false;
  }

  String get _storeUrl {
    if (kIsWeb) return _fallbackUrl;
    if (Platform.isAndroid) return _androidStoreUrl;
    if (Platform.isIOS) return _iosStoreUrl;
    if (Platform.isWindows) return _windowsStoreUrl;
    return _fallbackUrl;
  }

  Future<void> _openStore() async {
    final uri = Uri.parse(_storeUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<bool> _showUpdateDialog() async {
    final loc = AppLocalizations.of(context)!;
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: AppTheme.surfaceRaised,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppTheme.borderGray),
            boxShadow: [
              BoxShadow(
                color: AppTheme.accent.withValues(alpha: 0.15),
                blurRadius: 40,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppTheme.accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.accent.withValues(alpha: 0.35)),
                ),
                child: Center(
                  child: Icon(
                    Icons.system_update_rounded,
                    color: AppTheme.accent,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                loc.updateAvailable,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                loc.newVersion,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(ctx).pop(true),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        foregroundColor: AppTheme.textSecondary,
                        side: const BorderSide(color: AppTheme.borderGray),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(loc.later),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                        _openStore();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.accent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        loc.updateNow,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    return result ?? true;
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

  Widget _versionBadge() {
    if (_appVersion.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Text(
        'v$_appVersion',
        style: TextStyle(
          fontSize: 11,
          color: Colors.white.withValues(alpha: 0.50),
          letterSpacing: 1.4,
        ),
      ),
    );
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
              top: 0,
              right: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 16, 0),
                  child: _versionBadge(),
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
