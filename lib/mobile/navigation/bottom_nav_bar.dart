import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import '../../widgets/components/app_blur.dart';
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../../services/navigation_controller.dart';
import '../../services/home_customization_service.dart';
import '../../constants/app_constants.dart';
import '../../theme/app_theme.dart';
import '../../widgets/components/app_sheet.dart';
import '../../theme/app_tokens.dart';

class BottomGlassSimpleNavBar extends StatelessWidget {
  final VoidCallback? onConnectorTap;
  final String? activeItem;

  final AppFeature? navFarFeature;
  final AppFeature? navOuterFeature;
  final AppFeature? navLeftFeature;
  final AppFeature? navRightFeature;
  final VoidCallback? onNavFarTap;
  final VoidCallback? onNavOuterTap;
  final VoidCallback? onNavLeftTap;
  final VoidCallback? onNavRightTap;
  final bool navFarActive;
  final bool navOuterActive;
  final bool navLeftActive;
  final bool navRightActive;

  const BottomGlassSimpleNavBar({
    super.key,
    this.onConnectorTap,
    this.activeItem,
    this.navFarFeature,
    this.navOuterFeature,
    this.navLeftFeature,
    this.navRightFeature,
    this.onNavFarTap,
    this.onNavOuterTap,
    this.onNavLeftTap,
    this.onNavRightTap,
    this.navFarActive = false,
    this.navOuterActive = false,
    this.navLeftActive = false,
    this.navRightActive = false,
  });

  static FaIconData _iconFor(AppFeature feature) => switch (feature) {
    AppFeature.connector => FontAwesomeIcons.play,
    AppFeature.skins => FontAwesomeIcons.shirt,
    AppFeature.partners => FontAwesomeIcons.server,
    AppFeature.lookup => FontAwesomeIcons.magnifyingGlass,
    AppFeature.tracker => FontAwesomeIcons.heartPulse,
  };

  static const double _height = 52;
  static const double _gap = 16;

  static double insetOf(BuildContext context) {
    final safeBottom = MediaQuery.paddingOf(context).bottom;
    return (safeBottom < 8 ? 8 : safeBottom) + 6 + _height + _gap;
  }

  static const double _radius = 26;
  static const double _bubbleInset = 5;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final items =
        <({FaIconData icon, String label, bool active, VoidCallback? onTap})>[
          if (navOuterFeature != null)
            (
              icon: _iconFor(navOuterFeature!),
              label: navOuterFeature!.label(l),
              active: navOuterActive,
              onTap: onNavOuterTap,
            ),
          if (navLeftFeature != null)
            (
              icon: _iconFor(navLeftFeature!),
              label: navLeftFeature!.label(l),
              active: navLeftActive,
              onTap: onNavLeftTap,
            ),
          (
            icon: FontAwesomeIcons.play,
            label: l.featureLabelConnector,
            active: activeItem == 'connector',
            onTap: onConnectorTap,
          ),
          if (navRightFeature != null)
            (
              icon: _iconFor(navRightFeature!),
              label: navRightFeature!.label(l),
              active: navRightActive,
              onTap: onNavRightTap,
            ),
          if (navFarFeature != null)
            (
              icon: _iconFor(navFarFeature!),
              label: navFarFeature!.label(l),
              active: navFarActive,
              onTap: onNavFarTap,
            ),
        ];
    final activeIndex = items.indexWhere((item) => item.active);
    final shape = BorderRadius.circular(_radius);

    return SafeArea(
      top: false,
      minimum: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 6, 28, 0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: shape,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: shape,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: AppBlur.sigmaFor(24),
                sigmaY: AppBlur.sigmaFor(24),
              ),
              child: Container(
                height: _height,
                decoration: BoxDecoration(
                  borderRadius: shape,
                  color: AppTheme.surfaceRaised.withValues(alpha: 0.55),
                ),
                foregroundDecoration: BoxDecoration(
                  borderRadius: shape,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withValues(alpha: 0.14),
                      Colors.white.withValues(alpha: 0.03),
                    ],
                  ),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.16),
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final slot = constraints.maxWidth / items.length;
                    return Stack(
                      children: [
                        if (activeIndex >= 0)
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 280),
                            curve: Curves.easeOutCubic,
                            left: activeIndex * slot + _bubbleInset,
                            top: _bubbleInset,
                            bottom: _bubbleInset,
                            width: slot - _bubbleInset * 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  _radius - _bubbleInset,
                                ),
                                color: Colors.white.withValues(alpha: 0.14),
                              ),
                            ),
                          ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            for (final item in items)
                              _NavItem(
                                icon: item.icon,
                                label: item.label,
                                isActive: item.active,
                                onTap: item.onTap,
                              ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
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
    final color = isActive
        ? AppTheme.textPrimary
        : AppTheme.textPrimary.withValues(alpha: 0.6);

    return Expanded(
      child: Semantics(
        button: true,
        selected: isActive,
        label: label,
        child: GestureDetector(
          onTap: onTap == null
              ? null
              : () {
                  HapticFeedback.selectionClick();
                  onTap!();
                },
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: AnimatedScale(
              scale: isActive ? 1.1 : 1,
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutBack,
              child: FaIcon(icon, size: 20, color: color),
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
    return AppSheet(
      onClose: onClose,
      maxHeightFactor: 0.85,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: AppTheme.accent.withValues(alpha: 0.12),
                    borderRadius: AppRadius.small,
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
          style: TextStyle(
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
                        : AppTheme.surfaceRaised,
                    borderRadius: AppRadius.medium,
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
