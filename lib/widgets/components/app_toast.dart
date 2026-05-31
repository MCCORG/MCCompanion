import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AppToast {
  static OverlayEntry? _current;

  static void show(
    BuildContext context, {
    required String message,
    IconData? icon,
    Color? color,
    Duration duration = const Duration(seconds: 3),
  }) {
    _current?.remove();
    _current = null;

    final entry = OverlayEntry(
      builder: (_) => _AppToastWidget(
        message: message,
        icon: icon,
        color: color ?? AppTheme.accent,
        onDone: () {
          _current?.remove();
          _current = null;
        },
        duration: duration,
      ),
    );

    _current = entry;
    Overlay.of(context).insert(entry);
  }
}

class _AppToastWidget extends StatefulWidget {
  const _AppToastWidget({
    required this.message,
    required this.icon,
    required this.color,
    required this.onDone,
    required this.duration,
  });

  final String message;
  final IconData? icon;
  final Color color;
  final VoidCallback onDone;
  final Duration duration;

  @override
  State<_AppToastWidget> createState() => _AppToastWidgetState();
}

class _AppToastWidgetState extends State<_AppToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();

    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

    Future.delayed(widget.duration, () async {
      if (!mounted) return;
      await _ctrl.reverse();
      widget.onDone();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24,
      left: 16,
      right: 16,
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 480),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceRaised,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: widget.color.withOpacity(0.35)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.35),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                    BoxShadow(
                      color: widget.color.withOpacity(0.10),
                      blurRadius: 16,
                      spreadRadius: -2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.icon != null) ...[
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: widget.color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(widget.icon, size: 15, color: widget.color),
                      ),
                      const SizedBox(width: 10),
                    ],
                    Flexible(
                      child: Text(
                        widget.message,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
