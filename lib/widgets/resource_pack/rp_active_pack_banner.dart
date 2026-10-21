import 'package:flutter/material.dart';

import '../../design/design.dart';
import '../../l10n/app_localizations.dart';

class RpActivePackBanner extends StatelessWidget {
  final String? name;
  final bool enabled;
  final ValueChanged<bool>? onToggle;
  final VoidCallback? onRemove;

  const RpActivePackBanner({
    super.key,
    this.name,
    required this.enabled,
    this.onToggle,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final hasPack = name != null;
    final on = hasPack && enabled;

    return DsCard(
      highlighted: on,
      padding: const EdgeInsets.symmetric(
        horizontal: DsSpace.lg,
        vertical: DsSpace.md,
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: DsColor.inset,
              shape: BoxShape.circle,
              border: Border.all(color: DsColor.line),
            ),
            child: Icon(
              Icons.extension_rounded,
              size: 16,
              color: on ? DsColor.accent : DsColor.textFaint,
            ),
          ),
          const SizedBox(width: DsSpace.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l.rpScreenTitle, style: DsType.caption),
                const SizedBox(height: DsSpace.xxs),
                Text(
                  hasPack ? name! : l.rpNoPackSelected,
                  style: hasPack
                      ? DsType.bodyStrong
                      : DsType.body.copyWith(color: DsColor.textFaint),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (hasPack) ...[
                  const SizedBox(height: DsSpace.xxs),
                  Row(
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: on ? DsColor.success : DsColor.textFaint,
                        ),
                      ),
                      const SizedBox(width: DsSpace.sm - 2),
                      Flexible(
                        child: Text(
                          enabled ? l.rpActiveOnConnect : l.rpDisabled,
                          style: DsType.caption,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          if (onRemove != null) ...[
            DsIconButton(
              icon: Icons.delete_outline_rounded,
              size: 36,
              onPressed: onRemove,
            ),
            const SizedBox(width: DsSpace.sm),
          ],
          DsSwitch(value: enabled, onChanged: onToggle),
        ],
      ),
    );
  }
}
