import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';

enum RpInputMode { browse, upload, merge }

class RpTabBar extends StatelessWidget {
  final RpInputMode mode;
  final ValueChanged<RpInputMode> onSelect;

  const RpTabBar({super.key, required this.mode, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.borderGray),
      ),
      padding: const EdgeInsets.all(3),
      child: Row(
        children: [
          _Tab(label: 'Browse', icon: Icons.explore_rounded, selected: mode == RpInputMode.browse, onTap: () => onSelect(RpInputMode.browse)),
          _Tab(label: l.rpUploadTab, icon: Icons.upload_rounded, selected: mode == RpInputMode.upload, onTap: () => onSelect(RpInputMode.upload)),
_Tab(label: l.rpMergerTitle, icon: Icons.merge_rounded, selected: mode == RpInputMode.merge, onTap: () => onSelect(RpInputMode.merge)),
        ],
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _Tab({required this.label, required this.icon, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 9),
          decoration: BoxDecoration(
            color: selected ? AppTheme.accent.withValues(alpha: 0.15) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: selected ? Border.all(color: AppTheme.accent.withValues(alpha: 0.35)) : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: selected ? AppTheme.accent : AppTheme.textMuted),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: selected ? AppTheme.accent : AppTheme.textMuted,
                  fontSize: 11,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
