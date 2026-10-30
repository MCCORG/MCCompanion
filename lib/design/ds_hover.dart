import 'package:flutter/material.dart';

import 'ds_tokens.dart';

class DsHover extends StatefulWidget {
  final Widget child;
  final BorderRadius borderRadius;
  final bool enabled;

  const DsHover({
    super.key,
    required this.child,
    required this.borderRadius,
    this.enabled = true,
  });

  @override
  State<DsHover> createState() => _DsHoverState();
}

class _DsHoverState extends State<DsHover> {
  bool _hovered = false;

  void _setHovered(bool value) {
    if (_hovered != value) setState(() => _hovered = value);
  }

  @override
  Widget build(BuildContext context) {
    final active = widget.enabled && _hovered;
    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: AnimatedContainer(
        duration: DsDuration.fast,
        foregroundDecoration: BoxDecoration(
          color: active
              ? DsColor.text.withValues(alpha: 0.07)
              : Colors.transparent,
          borderRadius: widget.borderRadius,
        ),
        child: widget.child,
      ),
    );
  }
}
