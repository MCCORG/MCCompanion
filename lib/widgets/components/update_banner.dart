import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import '../../services/distribution_service.dart';
import '../../services/update_service.dart';
import '../../theme/app_theme.dart';

class UpdateBanner extends StatefulWidget {
  const UpdateBanner({super.key});

  @override
  State<UpdateBanner> createState() => _UpdateBannerState();
}

class _UpdateBannerState extends State<UpdateBanner> {
  String? _latest;

  @override
  void initState() {
    super.initState();
    _check();
  }

  Future<void> _check() async {
    if (!await UpdateService.updateAvailable()) return;
    final latest = await UpdateService.latestVersion();
    if (!mounted) return;
    setState(() => _latest = latest);
  }

  Future<void> _dismiss() async {
    final latest = _latest;
    if (latest != null) await UpdateService.dismiss(latest);
    if (!mounted) return;
    setState(() => _latest = null);
  }

  Future<void> _open() async {
    await launchUrl(
      Uri.parse(UpdateService.downloadPage),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    final latest = _latest;
    if (latest == null) return const SizedBox.shrink();

    final l = AppLocalizations.of(context)!;
    const tone = AppTheme.info;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: tone.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: tone.withValues(alpha: 0.45)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.system_update_alt_rounded, color: tone, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.updateAvailableTitle(latest),
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(
                  l.updateAvailableBody(DistributionService.version),
                  style: TextStyle(
                      fontSize: 12, color: AppTheme.textSecondary),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    TextButton(
                      onPressed: _open,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        foregroundColor: tone,
                      ),
                      child: Text(l.updateAvailableAction),
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: _dismiss,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        foregroundColor: AppTheme.textSecondary,
                      ),
                      child: Text(l.updateAvailableDismiss),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
