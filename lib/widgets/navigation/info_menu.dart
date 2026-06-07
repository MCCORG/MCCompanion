import 'dart:io';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';

class InfoSheetContent extends StatelessWidget {
  final VoidCallback onClose;

  const InfoSheetContent({super.key, required this.onClose});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _requestReview() async {
    final inAppReview = InAppReview.instance;

    if (Platform.isIOS || Platform.isAndroid) {
      if (await inAppReview.isAvailable()) {
        await inAppReview.requestReview();
        return;
      }
    }

    await inAppReview.openStoreListing(
      appStoreId: '6747323142',
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final maxHeight = MediaQuery.of(context).size.height * 0.88;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.background,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          border: const Border(top: BorderSide(color: AppTheme.borderGray)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onClose,
              behavior: HitTestBehavior.opaque,
              child: Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: AppTheme.borderLight,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: AppTheme.accent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        color: AppTheme.accent.withValues(alpha: 0.25),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: AppTheme.accent,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    l.infoAndLegal,
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionLabel('Support'),
                    const SizedBox(height: 8),
                    _rateTile(),
                    const SizedBox(height: 22),

                    _sectionLabel(l.legalSection),
                    const SizedBox(height: 8),
                    _legalTile(
                      icon: Icons.shield_outlined,
                      color: AppTheme.accent,
                      title: l.privacyPolicy,
                      subtitle: l.privacyPolicySubtitle,
                      onTap: () => _open('https://mccompanion.net/privacy'),
                    ),
                    const SizedBox(height: 8),
                    _legalTile(
                      icon: Icons.gavel_rounded,
                      color: const Color(0xFF7B61FF),
                      title: l.termsOfService,
                      subtitle: l.termsOfServiceSubtitle,
                      onTap: () => _open('https://mccompanion.net/terms'),
                    ),

                    const SizedBox(height: 22),

                    _sectionLabel(l.dataSourcesSection),
                    const SizedBox(height: 8),
                    _creditTile(
                      label: 'W',
                      labelColor: const Color(0xFF34D399),
                      title: l.wikiMinecraftWiki,
                      subtitle: l.creditMinecraftWikiSubtitle,
                      url: 'https://minecraft.wiki',
                    ),
                    const SizedBox(height: 8),
                    _creditTile(
                      label: 'M',
                      labelColor: const Color(0xFFF97316),
                      title: l.creditMojangTitle,
                      subtitle: l.creditMojangSubtitle,
                      url: 'https://minecraft.net',
                    ),
                    const SizedBox(height: 8),
                    _creditTile(
                      label: 'G',
                      labelColor: const Color(0xFF42A5F5),
                      title: l.creditGeyserTitle,
                      subtitle: l.creditGeyserSubtitle,
                      url: 'https://geysermc.org',
                    ),
                    const SizedBox(height: 8),
                    _creditTile(
                      label: 'X',
                      labelColor: const Color(0xFF22C55E),
                      title: l.creditXboxTitle,
                      subtitle: l.creditXboxSubtitle,
                      url: 'https://xbox.com',
                    ),

                    const SizedBox(height: 22),

                    _sectionLabel(l.aboutMCCompanionSection),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceRaisedSolid,
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: AppTheme.borderGray),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l.aboutMCCompanionDisclaimer,
                            style: TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 12,
                              height: 1.55,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            l.minecraftTrademark,
                            style: TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 12,
                              height: 1.55,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rateTile() {
    const color = Color(0xFFFBBF24);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _requestReview,
        borderRadius: BorderRadius.circular(13),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: color.withValues(alpha: 0.28)),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Center(
                  child: Icon(Icons.star_rounded, color: color, size: 22),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rate MCCompanion',
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Enjoying the app? Leave us a review ⭐',
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: color.withValues(alpha: 0.4),
                size: 13,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        color: AppTheme.textMuted,
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
      ),
    );
  }

  Widget _legalTile({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(13),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: color.withValues(alpha: 0.22)),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Center(child: Icon(icon, color: color, size: 20)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: color.withValues(alpha: 0.4),
                size: 13,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _creditTile({
    required String label,
    required Color labelColor,
    required String title,
    required String subtitle,
    required String url,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _open(url),
        borderRadius: BorderRadius.circular(13),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          decoration: BoxDecoration(
            color: AppTheme.surfaceRaisedSolid,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: AppTheme.borderGray),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: labelColor.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: labelColor,
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: AppTheme.textPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Icon(
                          Icons.open_in_new_rounded,
                          color: AppTheme.textMuted,
                          size: 13,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
