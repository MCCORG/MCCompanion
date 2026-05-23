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
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                            ],
                          ),
                        ],
                      ),
                    ),
                    _buildFeaturedServers(context),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _buildGrid(context),
                ),
                const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGrid(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _QuickCard(
                  title: 'Connector',
                  subtitle: 'Connect to servers via relay',
                  color: AppTheme.accent,
                  imagePath: 'assets/images/tunnel.png',
                  onTap: onGoToConnector,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _QuickCard(
                  title: 'Skins',
                  subtitle: 'View & edit Java skins',
                  color: const Color(0xFF42A5F5),
                  imagePath: 'assets/images/skin.png',
                  onTap: onGoToSkins,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _QuickCard(
                  title: 'Wiki',
                  subtitle: 'Mobs, blocks, recipes & more',
                  color: AppTheme.success,
                  imagePath: 'assets/images/wiki.png',
                  onTap: onGoToWiki,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _QuickCard(
                  title: 'Featured',
                  subtitle: 'Partner Minecraft servers',
                  color: const Color(0xFFFFB300),
                  imagePath: 'assets/images/feature.png',
                  onTap: onGoToPartners,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        _QuickCard(
          title: 'Minecraft User Lookup',
          subtitle: 'Look up Java & Bedrock profiles',
          color: const Color(0xFF7B61FF),
          imagePath: 'assets/images/players.png',
          onTap: onGoToPlayerLookup,
        ),
      ],
    );
  }

  Widget _buildFeaturedServers(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: FeaturedServerHero(
        partnerServersFuture: partnerServersFuture,
        ipController: ipController,
        portController: portController,
        onSelected: onGoToConnector,
      ),
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
        decoration: BoxDecoration(
          color: _pressed
              ? AppTheme.surfaceRaised.withOpacity(0.75)
              : AppTheme.surface.withOpacity(0.60),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.12),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppTheme.borderGray,
                  width: 0.8,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 11,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 11,
              color: AppTheme.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}
