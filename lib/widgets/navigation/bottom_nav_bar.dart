import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../../services/navigation_controller.dart';
import '../../services/home_customization_service.dart';
import '../../constants/app_constants.dart';
import '../../theme/app_theme.dart';

class BottomGlassSimpleNavBar extends StatelessWidget {
  final NavigationController? navigationController;
  final VoidCallback? onHomeTap;
  final VoidCallback? onConnectorTap;
  final VoidCallback? onProfileTap;
  final String? activeItem;
  final bool dark;
  final String? selectedRelayIp;
  final void Function(String?)? onRelayChanged;

  final AppFeature navLeftFeature;
  final AppFeature navRightFeature;
  final VoidCallback? onNavLeftTap;
  final VoidCallback? onNavRightTap;
  final bool navLeftActive;
  final bool navRightActive;

  const BottomGlassSimpleNavBar({
    super.key,
    required this.navigationController,
    this.onHomeTap,
    this.onConnectorTap,
    this.onProfileTap,
    this.activeItem,
    this.dark = true,
    this.selectedRelayIp,
    this.navLeftFeature = AppFeature.skins,
    this.navRightFeature = AppFeature.wiki,
    this.onNavLeftTap,
    this.onNavRightTap,
    this.navLeftActive = false,
    this.navRightActive = false,
    this.onRelayChanged,
  });

  static FaIconData _iconFor(AppFeature feature) => switch (feature) {
    AppFeature.connector => FontAwesomeIcons.play,
    AppFeature.skins => FontAwesomeIcons.shirt,
    AppFeature.wiki => FontAwesomeIcons.bookOpen,
    AppFeature.partners => FontAwesomeIcons.server,
    AppFeature.lookup => FontAwesomeIcons.magnifyingGlass,
    AppFeature.tracker => FontAwesomeIcons.satellite,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: AppTheme.borderGray, width: 0.8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.45),
                  blurRadius: 28,
                  spreadRadius: 0,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Builder(
              builder: (context) {
                final l = AppLocalizations.of(context)!;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _NavItem(
                      icon: FontAwesomeIcons.house,
                      label: l.home,
                      isActive: activeItem == 'home',
                      onTap: onHomeTap,
                    ),
                    _NavItem(
                      icon: _iconFor(navLeftFeature),
                      label: navLeftFeature.label(l),
                      isActive: navLeftActive,
                      onTap: onNavLeftTap,
                    ),
                    _NavFab(
                      isActive: activeItem == 'connector',
                      onTap: onConnectorTap,
                    ),
                    _NavItem(
                      icon: _iconFor(navRightFeature),
                      label: navRightFeature.label(l),
                      isActive: navRightActive,
                      onTap: onNavRightTap,
                    ),
                    _NavItem(
                      icon: FontAwesomeIcons.user,
                      label: l.navProfile,
                      isActive: activeItem == 'profile',
                      onTap: onProfileTap,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final FaIconData icon;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppTheme.brand : AppTheme.textMuted;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
              child: Align(
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  width: isActive ? 18 : 0,
                  height: 2,
                  decoration: BoxDecoration(
                    color: AppTheme.brand,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            FaIcon(icon, size: 18, color: color),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                  letterSpacing: -0.1,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavFab extends StatelessWidget {
  final bool isActive;
  final VoidCallback? onTap;

  const _NavFab({required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Align(
          alignment: Alignment.center,
          heightFactor: 1.0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? AppTheme.brand : AppTheme.surfaceRaisedSolid,
              border: Border.all(
                color: isActive ? AppTheme.brand : AppTheme.borderGray,
                width: isActive ? 1.5 : 1.0,
              ),
              boxShadow: [
                if (isActive)
                  BoxShadow(
                    color: AppTheme.brand.withValues(alpha: 0.35),
                    blurRadius: 14,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  )
                else
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.30),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
              ],
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.play,
                size: 18,
                color: isActive ? Colors.white : AppTheme.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MoreSheetContent extends StatelessWidget {
  final AppLocalizations loc;
  final NavigationController navigationController;
  final String? selectedRelayIp;
  final VoidCallback onClose;
  final void Function(String?) onRelayChanged;

  const MoreSheetContent({
    super.key,
    required this.loc,
    required this.navigationController,
    required this.onClose,
    required this.onRelayChanged,
    this.selectedRelayIp,
  });

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.85;

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
                      color: AppTheme.accent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        color: AppTheme.accent.withValues(alpha: 0.25),
                      ),
                    ),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.ellipsis,
                        color: AppTheme.accent,
                        size: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    loc.relay,
                    style: const TextStyle(
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
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _RegionSelector(
                      selectedIp: selectedRelayIp,
                      onChanged: onRelayChanged,
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
}

class _RegionSelector extends StatelessWidget {
  final String? selectedIp;
  final void Function(String?) onChanged;
  const _RegionSelector({required this.selectedIp, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppLocalizations.of(context)!.nldServerLabelShort,
          style: const TextStyle(
            color: AppTheme.textMuted,
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: AppConstants.relayServers.map((relay) {
            final ip = relay['ip'] as String;
            final name = relay['name'] as String;
            final isSelected = selectedIp == ip;
            final isFirst = relay == AppConstants.relayServers.first;

            return Expanded(
              child: GestureDetector(
                onTap: () => onChanged(ip),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.only(
                    right: isFirst ? 6 : 0,
                    left: isFirst ? 0 : 6,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppTheme.accent.withValues(alpha: 0.10)
                        : AppTheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? AppTheme.accent.withValues(alpha: 0.45)
                          : AppTheme.borderGray,
                      width: isSelected ? 1.5 : 1.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppTheme.brand
                              : AppTheme.textDisabled,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Text(
                        name,
                        style: TextStyle(
                          color: isSelected
                              ? AppTheme.textPrimary
                              : AppTheme.textSecondary,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
