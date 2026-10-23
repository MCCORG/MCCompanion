import 'package:flutter/material.dart';

import '../../design/design.dart';

class RpFilterChip extends StatelessWidget {
  final String label;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  const RpFilterChip({
    super.key,
    required this.label,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: DsRadius.pillR,
        child: AnimatedContainer(
          duration: DsDuration.fast,
          padding: const EdgeInsets.symmetric(
            horizontal: DsSpace.md,
            vertical: DsSpace.sm - 2,
          ),
          decoration: BoxDecoration(
            color: selected ? color : color.withValues(alpha: 0.10),
            borderRadius: DsRadius.pillR,
            border: Border.all(
              color: color.withValues(alpha: selected ? 1 : 0.28),
            ),
          ),
          child: Text(
            label,
            style: DsType.caption.copyWith(
              color: selected ? DsColor.onAccent : color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
