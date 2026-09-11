import 'package:flutter/material.dart';

import 'ds_tokens.dart';

class DsTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool selected;
  final bool dense;

  const DsTile({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconColor,
    this.leading,
    this.trailing,
    this.onTap,
    this.selected = false,
    this.dense = false,
  });

  @override
  Widget build(BuildContext context) {
    final tint = iconColor ?? DsColor.accent;
    final glyphSize = dense ? 36.0 : 42.0;

    final leadingWidget =
        leading ??
        (icon == null
            ? null
            : Container(
                width: glyphSize,
                height: glyphSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: tint.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(DsRadius.control - 2),
                ),
                child: Icon(icon, size: dense ? 17 : 19, color: tint),
              ));

    final row = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DsSpace.lg,
        vertical: dense ? DsSpace.md : DsSpace.lg - 2,
      ),
      child: Row(
        children: [
          if (leadingWidget != null) ...[
            leadingWidget,
            const SizedBox(width: DsSpace.md),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: DsType.bodyStrong,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: DsSpace.xxs),
                  Text(
                    subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: DsType.caption,
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: DsSpace.md),
            trailing!,
          ] else if (onTap != null) ...[
            const SizedBox(width: DsSpace.sm),
            Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: DsColor.textFaint,
            ),
          ],
        ],
      ),
    );

    final content = onTap == null
        ? row
        : Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: DsRadius.cardR,
              child: row,
            ),
          );

    return AnimatedContainer(
      duration: DsDuration.fast,
      decoration: BoxDecoration(
        color: DsColor.surface,
        borderRadius: DsRadius.cardR,
        border: Border.all(
          color: selected
              ? DsColor.accent.withValues(alpha: 0.55)
              : DsColor.line,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: content,
    );
  }
}
