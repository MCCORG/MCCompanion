import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/connectivity_checker.dart';
import '../../l10n/app_localizations.dart';

class ConnectivityWarningDialog extends StatelessWidget {
  final ConnectivityWarning warning;

  const ConnectivityWarningDialog({super.key, required this.warning});

  static Future<void> showIfNeeded(
    BuildContext context,
    ConnectivityCheckResult result,
  ) async {
    if (result.warning == ConnectivityWarning.none) return;
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => ConnectivityWarningDialog(warning: result.warning),
    );
  }

  bool get _isVpn => warning == ConnectivityWarning.vpnActive;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final color = _isVpn ? AppTheme.warning : AppTheme.info;
    final title = _isVpn ? loc.vpnDetected : loc.noWifi;
    final body = _isVpn ? loc.vpnActive : loc.mobileActive;
    final icon = _isVpn ? Icons.vpn_lock_rounded : Icons.wifi_off_rounded;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: AppTheme.surfaceRaised,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.35)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.12),
              blurRadius: 36,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: color.withValues(alpha: 0.35)),
              ),
              child: Icon(icon, color: color, size: 26),
            ),
            const SizedBox(height: 18),
            Text(
              title,
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              body,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 26),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  loc.continueAnyway,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}