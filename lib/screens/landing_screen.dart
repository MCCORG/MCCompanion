import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../util/partners_servers.dart';
import '../widgets/components/header_nav_bar.dart';
import '../widgets/featured_server_hero.dart';

class LandingScreen extends StatelessWidget {
  final VoidCallback onGoToConnector;
  final VoidCallback onGoToSkins;
  final VoidCallback onGoToWiki;
  final VoidCallback onGoToPartners;
  final VoidCallback onGoToPlayerLookup;
  final Future<List<FeaturedServer>>? partnerServersFuture;
  final TextEditingController ipController;
  final TextEditingController portController;
  final VoidCallback? onWebsiteTap;
  final VoidCallback? onDiscordTap;
  final VoidCallback? onLanguageTap;
  final VoidCallback? onInfoTap;

  const LandingScreen({
    super.key,
    required this.onGoToConnector,
    required this.onGoToSkins,
    required this.onGoToWiki,
    required this.onGoToPartners,
    required this.onGoToPlayerLookup,
    required this.partnerServersFuture,
    required this.ipController,
    required this.portController,
    this.onWebsiteTap,
    this.onDiscordTap,
    this.onLanguageTap,
    this.onInfoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Row(
            children: [
              const Text(
                'Home',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              HeaderNavBar(
                items: [
                  HeaderNavItem(label: 'Website', onTap: onWebsiteTap),
                  HeaderNavItem(label: 'Discord', onTap: onDiscordTap),
                  HeaderNavItem(label: 'Language', onTap: onLanguageTap),
                  HeaderNavItem(label: 'Info', onTap: onInfoTap),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: FeaturedServerHero(
            partnerServersFuture: partnerServersFuture,
            ipController: ipController,
            portController: portController,
            onSelected: onGoToConnector,
          ),
        ),
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              child: _buildGrid(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGrid() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: _QuickCard(
                title: 'Console Connect',
                subtitle: 'Connect to servers via relay',
                color: AppTheme.accent,
                imagePath: 'assets/images/tunnel.png',
                onTap: onGoToConnector,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _QuickCard(
                title: 'Minecraft Skins',
                subtitle: 'View & edit Java & Bedrock skins',
                color: const Color(0xFF42A5F5),
                imagePath: 'assets/images/skin.png',
                onTap: onGoToSkins,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _QuickCard(
                title: 'Minecraft Wiki',
                subtitle: 'Mobs, blocks, recipes & more',
                color: AppTheme.success,
                imagePath: 'assets/images/wiki.png',
                onTap: onGoToWiki,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _QuickCard(
                title: 'Partner Servers',
                subtitle: 'Featured Minecraft servers',
                color: const Color(0xFFFFB300),
                imagePath: 'assets/images/feature.png',
                onTap: onGoToPartners,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        _QuickCardWide(
          title: 'Minecraft User Lookup',
          subtitle: 'Look up Java & Bedrock profiles',
          color: const Color(0xFF7B61FF),
          imagePath: 'assets/images/players.png',
          onTap: onGoToPlayerLookup,
        ),
      ],
    );
  }
}

class _QuickCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final Color color;
  final String imagePath;
  final VoidCallback onTap;

  const _QuickCard({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.imagePath,
    required this.onTap,
  });

  @override
  State<_QuickCard> createState() => _QuickCardState();
}

class _QuickCardState extends State<_QuickCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedOpacity(
        opacity: _pressed ? 0.65 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          decoration: BoxDecoration(
            color: AppTheme.surfaceRaised,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                widget.imagePath,
                width: 64,
                height: 64,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 12),
              Text(
                widget.title,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (widget.subtitle.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  widget.subtitle,
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 11,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickCardWide extends StatefulWidget {
  final String title;
  final String subtitle;
  final Color color;
  final String imagePath;
  final VoidCallback onTap;

  const _QuickCardWide({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.imagePath,
    required this.onTap,
  });

  @override
  State<_QuickCardWide> createState() => _QuickCardWideState();
}

class _QuickCardWideState extends State<_QuickCardWide> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedOpacity(
        opacity: _pressed ? 0.65 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
          decoration: BoxDecoration(
            color: AppTheme.surfaceRaised,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.imagePath,
                width: 64,
                height: 64,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.subtitle,
                      style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppTheme.textMuted,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
