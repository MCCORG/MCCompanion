import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.88;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0E1117),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          border: Border(top: BorderSide(color: AppTheme.borderGray)),
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
                      color: AppTheme.accent.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        color: AppTheme.accent.withOpacity(0.25),
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: AppTheme.accent,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Info & Legal',
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
                    _sectionLabel('Legal'),
                    const SizedBox(height: 8),
                    _legalTile(
                      icon: Icons.shield_outlined,
                      color: AppTheme.accent,
                      title: 'Privacy Policy',
                      subtitle: 'How we collect and protect your data',
                      onTap: () => _open('https://netherlink.net/privacy'),
                    ),
                    const SizedBox(height: 8),
                    _legalTile(
                      icon: Icons.gavel_rounded,
                      color: const Color(0xFF7B61FF),
                      title: 'Terms of Service',
                      subtitle: 'Rules and conditions of use',
                      onTap: () => _open('https://netherlink.net/terms'),
                    ),

                    const SizedBox(height: 22),

                    _sectionLabel('Data Sources & Credits'),
                    const SizedBox(height: 8),
                    _creditTile(
                      label: 'W',
                      labelColor: const Color(0xFF34D399),
                      title: 'Minecraft Wiki',
                      subtitle:
                          'Used as data source for the Wiki feature. Content is provided by the community under Creative Commons.',
                      url: 'https://minecraft.wiki',
                    ),
                    const SizedBox(height: 8),
                    _creditTile(
                      label: 'M',
                      labelColor: const Color(0xFFF97316),
                      title: 'Mojang / Microsoft',
                      subtitle:
                          'Java player skins, UUIDs, and profile data via the official Mojang API.',
                      url: 'https://minecraft.net',
                    ),
                    const SizedBox(height: 8),
                    _creditTile(
                      label: 'G',
                      labelColor: const Color(0xFF42A5F5),
                      title: 'GeyserMC',
                      subtitle:
                          'Bedrock skin rendering. Skins for Bedrock players are fetched via the GeyserMC skin server.',
                      url: 'https://geysermc.org',
                    ),
                    const SizedBox(height: 8),
                    _creditTile(
                      label: 'X',
                      labelColor: const Color(0xFF22C55E),
                      title: 'Xbox / Microsoft',
                      subtitle:
                          'Bedrock account linking via Xbox Live. Gamertags and XUIDs are retrieved through the Microsoft authentication flow.',
                      url: 'https://xbox.com',
                    ),

                    const SizedBox(height: 22),

                    _sectionLabel('About NetherLink'),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceRaised,
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: AppTheme.borderGray),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NetherLink is an independent application and is not affiliated with, endorsed by, or sponsored by Mojang Studios or Microsoft Corporation.',
                            style: TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 12,
                              height: 1.55,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '"Minecraft" is a trademark of Microsoft Corporation.',
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

  Widget _sectionLabel(String text) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
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
            color: color.withOpacity(0.05),
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: color.withOpacity(0.22)),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.14),
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
                      style: const TextStyle(
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
                color: color.withOpacity(0.4),
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
            color: AppTheme.surfaceRaised,
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
                  color: labelColor.withOpacity(0.14),
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
                          style: const TextStyle(
                            color: AppTheme.textPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.open_in_new_rounded,
                          color: AppTheme.textMuted,
                          size: 13,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
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
