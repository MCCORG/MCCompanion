import 'package:flutter/material.dart';

import 'ds_tokens.dart';

class DsOption<T> {
  final T value;
  final String label;
  final IconData? icon;

  const DsOption({required this.value, required this.label, this.icon});
}

class DsSegmented<T> extends StatelessWidget {
  final List<DsOption<T>> options;
  final T value;
  final ValueChanged<T>? onChanged;

  const DsSegmented({
    super.key,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DsSpace.xs),
      decoration: BoxDecoration(
        color: DsColor.inset,
        borderRadius: DsRadius.controlR,
        border: Border.all(color: DsColor.line),
      ),
      child: Row(
        children: [
          for (final option in options)
            Expanded(child: _segment(context, option)),
        ],
      ),
    );
  }

  Widget _segment(BuildContext context, DsOption<T> option) {
    final selected = option.value == value;
    final enabled = onChanged != null;
    final foreground = selected
        ? DsColor.onAccent
        : enabled
        ? DsColor.textSoft
        : DsColor.textDisabled;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled && !selected ? () => onChanged!(option.value) : null,
        borderRadius: BorderRadius.circular(DsRadius.control - 3),
        child: AnimatedContainer(
          duration: DsDuration.normal,
          curve: Curves.easeOut,
          height: 42,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: DsSpace.sm),
          decoration: BoxDecoration(
            color: selected ? DsColor.accent : Colors.transparent,
            borderRadius: BorderRadius.circular(DsRadius.control - 3),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (option.icon != null) ...[
                Icon(option.icon, size: 16, color: foreground),
                const SizedBox(width: DsSpace.sm - 2),
              ],
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    option.label,
                    maxLines: 1,
                    style: TextStyle(
                      color: foreground,
                      fontSize: 13.5,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                      letterSpacing: -0.1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DsSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const DsSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final enabled = onChanged != null;
    final track = value
        ? DsColor.accent.withValues(alpha: enabled ? 1 : 0.35)
        : DsColor.inset;
    final thumb = value
        ? DsColor.onAccent
        : enabled
        ? DsColor.textFaint
        : DsColor.textDisabled;

    return Semantics(
      toggled: value,
      child: GestureDetector(
        onTap: enabled ? () => onChanged!(!value) : null,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: DsDuration.normal,
          curve: Curves.easeOut,
          width: 46,
          height: 28,
          padding: const EdgeInsets.all(3),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          decoration: BoxDecoration(
            color: track,
            borderRadius: DsRadius.pillR,
            border: Border.all(
              color: value ? Colors.transparent : DsColor.line,
            ),
          ),
          child: AnimatedContainer(
            duration: DsDuration.normal,
            curve: Curves.easeOut,
            width: 22,
            height: 22,
            decoration: BoxDecoration(color: thumb, shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}

class DsField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final IconData? icon;
  final TextInputType? keyboardType;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final int maxLines;
  final bool autofocus;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction? textInputAction;
  final bool obscureText;

  const DsField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.icon,
    this.keyboardType,
    this.enabled = true,
    this.onChanged,
    this.errorText,
    this.maxLines = 1,
    this.autofocus = false,
    this.onSubmitted,
    this.textInputAction,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(label!, style: DsType.label),
          const SizedBox(height: DsSpace.sm - 2),
        ],
        TextField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyboardType,
          onChanged: onChanged,
          maxLines: maxLines,
          autofocus: autofocus,
          onSubmitted: onSubmitted,
          textInputAction: textInputAction,
          obscureText: obscureText,
          style: DsType.body,
          cursorColor: DsColor.accent,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: DsType.body.copyWith(color: DsColor.textDisabled),
            prefixIcon: icon == null
                ? null
                : Icon(icon, size: 18, color: DsColor.textFaint),
            filled: true,
            fillColor: DsColor.inset,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: DsSpace.lg,
              vertical: DsSpace.md + 2,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: DsRadius.controlR,
              borderSide: BorderSide(color: DsColor.line),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: DsRadius.controlR,
              borderSide: BorderSide(color: DsColor.accent, width: 1.5),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: DsRadius.controlR,
              borderSide: BorderSide(color: DsColor.line),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: DsRadius.controlR,
              borderSide: const BorderSide(color: DsColor.danger),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: DsRadius.controlR,
              borderSide: const BorderSide(color: DsColor.danger, width: 1.5),
            ),
            errorText: errorText,
            errorStyle: DsType.caption.copyWith(color: DsColor.danger),
          ),
        ),
      ],
    );
  }
}

class DsBadge extends StatelessWidget {
  final String label;
  final Color color;
  final bool dot;

  const DsBadge({
    super.key,
    required this.label,
    required this.color,
    this.dot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DsSpace.md - 2,
        vertical: DsSpace.xs + 1,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: DsRadius.pillR,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (dot) ...[
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: DsSpace.sm - 2),
          ],
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
