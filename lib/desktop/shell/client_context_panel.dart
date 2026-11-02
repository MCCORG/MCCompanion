import 'package:flutter/material.dart';

import '../../design/design.dart';
import 'client_models.dart';

class ClientContextPanel extends StatelessWidget {
  static const double width = 220;

  final ClientSection section;
  final String? activeItemId;

  const ClientContextPanel({
    super.key,
    required this.section,
    required this.activeItemId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
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
          Container(height: 1, color: DsColor.line),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(DsSpace.md),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    DsSpace.md,
                    DsSpace.sm,
                    DsSpace.md,
                    DsSpace.sm,
                  ),
                  child: Text(
                    section.label.toUpperCase(),
                    style: DsType.caption.copyWith(
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                for (final item in section.items)
                  _ItemTile(item: item, active: item.id == activeItemId),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemTile extends StatelessWidget {
  final ClientSectionItem item;
  final bool active;

  const _ItemTile({required this.item, required this.active});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DsSpace.xs),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: item.onTap,
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
            child: Text(
              item.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: DsType.body.copyWith(
                color: active ? DsColor.text : DsColor.textSoft,
                fontWeight: active ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ClientItemStrip extends StatelessWidget {
  final ClientSection section;
  final String? activeItemId;

  const ClientItemStrip({
    super.key,
    required this.section,
    required this.activeItemId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: DsColor.line)),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: DsSpace.md,
          vertical: DsSpace.sm,
        ),
        children: [
          for (final item in section.items)
            Padding(
              padding: const EdgeInsets.only(right: DsSpace.sm),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: item.onTap,
                  borderRadius: DsRadius.controlR,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: DsSpace.md),
                    decoration: BoxDecoration(
                      color: item.id == activeItemId
                          ? DsColor.accent.withValues(alpha: 0.14)
                          : Colors.transparent,
                      borderRadius: DsRadius.controlR,
                    ),
                    child: Text(
                      item.label,
                      maxLines: 1,
                      style: DsType.label.copyWith(
                        color: item.id == activeItemId
                            ? DsColor.text
                            : DsColor.textSoft,
                        fontWeight: item.id == activeItemId
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
