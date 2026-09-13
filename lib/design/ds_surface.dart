import 'package:flutter/material.dart';

import 'ds_tokens.dart';

class DsCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final bool highlighted;
  final Color? accent;

  const DsCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(DsSpace.lg),
    this.onTap,
    this.highlighted = false,
    this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final tint = accent ?? DsColor.accent;

    final body = AnimatedContainer(
      duration: DsDuration.fast,
      padding: padding,
      decoration: BoxDecoration(
        color: DsColor.surface,
        borderRadius: DsRadius.cardR,
        border: Border.all(
          color: highlighted ? tint.withValues(alpha: 0.55) : DsColor.line,
        ),
      ),
      child: child,
    );

    if (onTap == null) return body;

    return Material(
      color: Colors.transparent,
      child: InkWell(onTap: onTap, borderRadius: DsRadius.cardR, child: body),
    );
  }
}

class DsDivider extends StatelessWidget {
  final double indent;

  const DsDivider({super.key, this.indent = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: EdgeInsets.only(left: indent),
      color: DsColor.line,
    );
  }
}

class DsEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? message;
  final Widget? action;

  const DsEmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.message,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DsSpace.lg,
        vertical: DsSpace.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: DsColor.surfaceQuiet,
              borderRadius: DsRadius.controlR,
              border: Border.all(color: DsColor.line),
            ),
            child: Icon(icon, size: 24, color: DsColor.textFaint),
          ),
          const SizedBox(height: DsSpace.lg),
          Text(title, style: DsType.bodyStrong, textAlign: TextAlign.center),
          if (message != null) ...[
            const SizedBox(height: DsSpace.xs),
            Text(message!, style: DsType.caption, textAlign: TextAlign.center),
          ],
          if (action != null) ...[const SizedBox(height: DsSpace.lg), action!],
        ],
      ),
    );
  }
}
