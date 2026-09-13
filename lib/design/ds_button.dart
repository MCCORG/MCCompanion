import 'package:flutter/material.dart';

import 'ds_tokens.dart';

enum DsButtonTone { accent, neutral, quiet, danger }

enum DsButtonSize { small, medium, large }

class DsButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final DsButtonTone tone;
  final DsButtonSize size;
  final bool expand;
  final bool busy;
  final Color? accent;

  const DsButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.tone = DsButtonTone.accent,
    this.size = DsButtonSize.medium,
    this.expand = false,
    this.busy = false,
    this.accent,
  });

  double get _height => switch (size) {
    DsButtonSize.small => 36,
    DsButtonSize.medium => 46,
    DsButtonSize.large => 54,
  };

  double get _fontSize => switch (size) {
    DsButtonSize.small => 13,
    DsButtonSize.medium => 14.5,
    DsButtonSize.large => 15.5,
  };

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !busy;
    final tint = accent ?? DsColor.accent;

    final Color background;
    final Color foreground;
    final BoxBorder? border;

    switch (tone) {
      case DsButtonTone.accent:
        background = enabled ? tint : DsColor.surfaceQuiet;
        foreground = enabled ? DsColor.onAccent : DsColor.textDisabled;
        border = enabled ? null : Border.all(color: DsColor.line);
      case DsButtonTone.neutral:
        background = DsColor.surfaceQuiet;
        foreground = enabled ? DsColor.text : DsColor.textDisabled;
        border = Border.all(color: DsColor.line);
      case DsButtonTone.quiet:
        background = Colors.transparent;
        foreground = enabled ? DsColor.textSoft : DsColor.textDisabled;
        border = null;
      case DsButtonTone.danger:
        background = DsColor.danger.withValues(alpha: enabled ? 0.16 : 0.08);
        foreground = enabled ? DsColor.danger : DsColor.textDisabled;
        border = Border.all(
          color: DsColor.danger.withValues(alpha: enabled ? 0.45 : 0.18),
        );
    }

    final child = busy
        ? SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2, color: foreground),
          )
        : Row(
            mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: _fontSize + 4, color: foreground),
                const SizedBox(width: DsSpace.sm),
              ],
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: foreground,
                    fontSize: _fontSize,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.1,
                  ),
                ),
              ),
            ],
          );

    return Semantics(
      button: true,
      enabled: enabled,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: DsRadius.controlR,
          child: AnimatedContainer(
            duration: DsDuration.fast,
            height: _height,
            padding: const EdgeInsets.symmetric(horizontal: DsSpace.lg),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: background,
              borderRadius: DsRadius.controlR,
              border: border,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class DsIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Color? color;
  final double size;

  const DsIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.color,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    final button = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: DsRadius.controlR,
        child: Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: DsColor.surfaceQuiet,
            borderRadius: DsRadius.controlR,
            border: Border.all(color: DsColor.line),
          ),
          child: Icon(
            icon,
            size: size * 0.45,
            color: enabled ? (color ?? DsColor.textSoft) : DsColor.textDisabled,
          ),
        ),
      ),
    );

    if (tooltip == null) return button;
    return Tooltip(message: tooltip!, child: button);
  }
}
