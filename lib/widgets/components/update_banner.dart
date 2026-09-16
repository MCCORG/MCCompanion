import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import '../../services/distribution_service.dart';
import '../../services/update_service.dart';
import '../../design/design.dart';

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
    final tone = DsColor.info;

    return Container(
      margin: const EdgeInsets.fromLTRB(DsSpace.lg, DsSpace.md, DsSpace.lg, 0),
      padding: const EdgeInsets.all(DsSpace.md),
      decoration: BoxDecoration(
        color: DsColor.surface,
        borderRadius: DsRadius.cardR,
        border: Border.all(color: DsColor.tint(tone, 0.35)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: DsColor.tint(tone, 0.14),
              borderRadius: DsRadius.controlR,
            ),
            child: Icon(Icons.system_update_alt_rounded, color: tone, size: 16),
          ),
          const SizedBox(width: DsSpace.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l.updateAvailableTitle(latest), style: DsType.bodyStrong),
                const SizedBox(height: DsSpace.xxs),
                Text(
                  l.updateAvailableBody(DistributionService.version),
                  style: DsType.caption,
                ),
                const SizedBox(height: DsSpace.md),
                Row(
                  children: [
                    DsButton(
                      label: l.updateAvailableAction,
                      size: DsButtonSize.small,
                      onPressed: _open,
                    ),
                    const SizedBox(width: DsSpace.sm),
                    DsButton(
                      label: l.updateAvailableDismiss,
                      tone: DsButtonTone.quiet,
                      size: DsButtonSize.small,
                      onPressed: _dismiss,
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
