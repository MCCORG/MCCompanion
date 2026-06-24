import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';

class RpInfoSection extends StatelessWidget {
  final void Function(BuildContext, String, Widget, {IconData icon, Color iconColor}) showDialog;

  const RpInfoSection({super.key, required this.showDialog});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Column(
        children: [
          _InfoRow(
            icon: Icons.check_circle_outline_rounded,
            iconColor: AppTheme.success,
            label: l.rpWhatWorks,
            onTap: () => showDialog(
              context, l.rpWhatWorks,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RpModalBullet(title: l.rpSupportedBedrockOnly, hint: l.rpSupportedBedrockOnlyHint, ok: true),
                  RpModalBullet(title: l.rpSupportedTexture, hint: l.rpSupportedTextureHint, ok: true),
                  Divider(height: 20, color: AppTheme.borderGray),
                  RpModalBullet(title: l.rpUnsupportedShaders, hint: l.rpUnsupportedShadersHint, ok: false),
                  RpModalBullet(title: l.rpUnsupportedAddons, hint: l.rpUnsupportedAddonsHint, ok: false),
                  Divider(height: 20, color: AppTheme.borderGray),
                  RpModalBullet(title: l.rpNoDiscord, hint: l.rpNoDiscordHint, ok: false),
                  RpModalBullet(title: l.rpNoDrive, hint: l.rpNoDriveHint, ok: false),
                  RpModalBullet(title: l.rpNoEncrypted, hint: l.rpNoEncryptedHint, ok: false),
                ],
              ),
              icon: Icons.check_circle_outline_rounded,
              iconColor: AppTheme.success,
            ),
          ),
          Divider(height: 1, color: AppTheme.borderGray, indent: 52),
          _InfoRow(
            icon: Icons.speed_rounded,
            iconColor: Colors.orangeAccent,
            label: l.rpConsolePerformanceTitle,
            onTap: () => showDialog(
              context, l.rpConsolePerformanceTitle,
              Text(l.rpConsolePerformanceBody, style: TextStyle(color: AppTheme.textSecondary, fontSize: 14, height: 1.65)),
              icon: Icons.speed_rounded,
              iconColor: Colors.orangeAccent,
            ),
          ),
          Divider(height: 1, color: AppTheme.borderGray, indent: 52),
          _InfoRow(
            icon: Icons.cleaning_services_rounded,
            iconColor: AppTheme.info,
            label: l.rpClearMinecraftTitle,
            onTap: () => showDialog(
              context, l.rpClearMinecraftTitle,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(l.rpClearWhy, style: TextStyle(color: AppTheme.textSecondary, fontSize: 13, height: 1.6)),
                  const SizedBox(height: 16),
                  RpModalStep(n: '1', text: l.rpClearStep1),
                  RpModalStep(n: '2', text: l.rpClearStep2),
                  RpModalStep(n: '3', text: l.rpClearStep3),
                ],
              ),
              icon: Icons.cleaning_services_rounded,
              iconColor: AppTheme.info,
            ),
          ),
          Divider(height: 1, color: AppTheme.borderGray, indent: 52),
          _InfoRow(
            icon: Icons.refresh_rounded,
            iconColor: const Color(0xFF8B5CF6),
            label: l.rpRelayTitle,
            onTap: () => showDialog(
              context, l.rpRelayTitle,
              Text(l.rpRelayBody, style: TextStyle(color: AppTheme.textSecondary, fontSize: 14, height: 1.65)),
              icon: Icons.refresh_rounded,
              iconColor: const Color(0xFF8B5CF6),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final VoidCallback onTap;

  const _InfoRow({required this.icon, required this.iconColor, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        child: Row(
          children: [
            Container(
              width: 30, height: 30,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 16),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(label, style: TextStyle(color: AppTheme.textPrimary, fontSize: 13, fontWeight: FontWeight.w500)),
            ),
            Icon(Icons.chevron_right_rounded, color: AppTheme.textMuted, size: 18),
          ],
        ),
      ),
    );
  }
}

class RpModalBullet extends StatelessWidget {
  final String title;
  final String hint;
  final bool ok;

  const RpModalBullet({super.key, required this.title, required this.hint, required this.ok});

  @override
  Widget build(BuildContext context) {
    final color = ok ? AppTheme.success : AppTheme.error;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 22, height: 22,
            decoration: BoxDecoration(color: color.withValues(alpha: 0.12), shape: BoxShape.circle),
            child: Icon(ok ? Icons.check_rounded : Icons.close_rounded, color: color, size: 12),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: AppTheme.textPrimary, fontSize: 13, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(hint, style: TextStyle(color: AppTheme.textMuted, fontSize: 12, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RpModalStep extends StatelessWidget {
  final String n;
  final String text;

  const RpModalStep({super.key, required this.n, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24, height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppTheme.info.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(n, style: TextStyle(color: AppTheme.info, fontSize: 12, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(text, style: TextStyle(color: AppTheme.textSecondary, fontSize: 14, height: 1.5)),
            ),
          ),
        ],
      ),
    );
  }
}
