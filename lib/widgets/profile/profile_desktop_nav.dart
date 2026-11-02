import 'package:flutter/material.dart';

import '../../design/design.dart';

class ProfileDesktopNavItem {
  final IconData icon;
  final String label;
  final int badge;

  const ProfileDesktopNavItem({
    required this.icon,
    required this.label,
    this.badge = 0,
  });
}

class ProfileDesktopNav extends StatelessWidget {
  final List<ProfileDesktopNavItem> items;
  final int selected;
  final ValueChanged<int> onSelect;

  const ProfileDesktopNav({
    super.key,
    required this.items,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < items.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: DsSpace.xs),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onSelect(i),
                borderRadius: DsRadius.controlR,
                child: AnimatedContainer(
                  duration: DsDuration.fast,
                  padding: const EdgeInsets.symmetric(
                    horizontal: DsSpace.md,
                    vertical: DsSpace.md - 1,
                  ),
                  decoration: BoxDecoration(
                    color: i == selected
                        ? DsColor.accent.withValues(alpha: 0.14)
                        : Colors.transparent,
                    borderRadius: DsRadius.controlR,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        items[i].icon,
                        size: 18,
                        color: i == selected
                            ? DsColor.accent
                            : DsColor.textFaint,
                      ),
                      const SizedBox(width: DsSpace.md),
                      Expanded(
                        child: Text(
                          items[i].label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: DsType.body.copyWith(
                            color: i == selected
                                ? DsColor.text
                                : DsColor.textSoft,
                            fontWeight: i == selected
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                      if (items[i].badge > 0)
                        DsBadge(
                          label: items[i].badge > 99
                              ? '99+'
                              : '${items[i].badge}',
                          color: DsColor.accent,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
