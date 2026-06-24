import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';

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

    return Container(
      decoration: BoxDecoration(
        color: hasPack && enabled ? AppTheme.accent.withValues(alpha: 0.08) : AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasPack && enabled ? AppTheme.accent.withValues(alpha: 0.35) : AppTheme.borderGray,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(
              color: hasPack && enabled ? AppTheme.accent.withValues(alpha: 0.15) : AppTheme.surfaceRaisedSolid,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.layers_rounded,
              color: hasPack && enabled ? AppTheme.accent : AppTheme.textMuted,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hasPack ? name! : l.rpNoPackSelected,
                  style: TextStyle(
                    color: hasPack ? AppTheme.textPrimary : AppTheme.textMuted,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (hasPack) ...[
                  const SizedBox(height: 2),
                  Text(
                    enabled ? l.rpActiveOnConnect : l.rpDisabled,
                    style: TextStyle(color: enabled ? AppTheme.accent : AppTheme.textMuted, fontSize: 11),
                  ),
                ],
              ],
            ),
          ),
          if (onRemove != null)
            IconButton(
              onPressed: onRemove,
              icon: Icon(Icons.delete_outline_rounded, color: AppTheme.textMuted, size: 18),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          const SizedBox(width: 8),
          Switch(value: enabled, onChanged: onToggle),
        ],
      ),
    );
  }
}
