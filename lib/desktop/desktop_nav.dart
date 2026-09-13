import 'package:flutter/material.dart';

import '../design/design.dart';

class DesktopNavEntry {
  final IconData icon;
  final String label;
  final String id;
  final VoidCallback onTap;
  final int badge;

  const DesktopNavEntry({
    required this.icon,
    required this.label,
    required this.id,
    required this.onTap,
    this.badge = 0,
  });
}

class DesktopNav extends StatelessWidget {
  final List<DesktopNavEntry> primary;
  final List<DesktopNavEntry> secondary;
  final String? activeId;
  final Widget? footer;

  const DesktopNav({
    super.key,
    required this.primary,
    required this.secondary,
    required this.activeId,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 232,
      decoration: BoxDecoration(
        color: DsColor.surfaceQuiet,
        border: Border(right: BorderSide(color: DsColor.line)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              DsSpace.lg,
              DsSpace.xl,
              DsSpace.lg,
              DsSpace.lg,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/logo.png',
                height: 18,
                errorBuilder: (_, _, _) =>
                    Text('MCCompanion', style: DsType.heading),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: DsSpace.md),
              children: [
                for (final entry in primary) _item(entry),
                const SizedBox(height: DsSpace.lg),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DsSpace.md,
                    vertical: DsSpace.sm,
                  ),
                  child: Container(height: 1, color: DsColor.line),
                ),
                const SizedBox(height: DsSpace.sm),
                for (final entry in secondary) _item(entry),
              ],
            ),
          ),
          if (footer != null)
            Padding(padding: const EdgeInsets.all(DsSpace.md), child: footer!),
        ],
      ),
    );
  }

  Widget _item(DesktopNavEntry entry) {
    final active = entry.id == activeId;
    return Padding(
      padding: const EdgeInsets.only(bottom: DsSpace.xs),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: entry.onTap,
          borderRadius: DsRadius.controlR,
          child: AnimatedContainer(
            duration: DsDuration.fast,
            padding: const EdgeInsets.symmetric(
              horizontal: DsSpace.md,
              vertical: DsSpace.md - 1,
            ),
            decoration: BoxDecoration(
              color: active
                  ? DsColor.accent.withValues(alpha: 0.14)
                  : Colors.transparent,
              borderRadius: DsRadius.controlR,
            ),
            child: Row(
              children: [
                Icon(
                  entry.icon,
                  size: 18,
                  color: active ? DsColor.accent : DsColor.textFaint,
                ),
                const SizedBox(width: DsSpace.md),
                Expanded(
                  child: Text(
                    entry.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: DsType.body.copyWith(
                      color: active ? DsColor.text : DsColor.textSoft,
                      fontWeight: active ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ),
                if (entry.badge > 0)
                  DsBadge(
                    label: entry.badge > 99 ? '99+' : '${entry.badge}',
                    color: DsColor.accent,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
