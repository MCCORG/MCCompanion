import 'package:flutter/material.dart';

import '../../design/design.dart';

class GlobalNoticeBanner extends StatefulWidget {
  const GlobalNoticeBanner({
    super.key,
    required this.message,
    this.type = 'info',
    required this.onDismiss,
  });

  final String message;
  final String type;
  final VoidCallback onDismiss;

  @override
  State<GlobalNoticeBanner> createState() => _GlobalNoticeBannerState();
}

class _GlobalNoticeBannerState extends State<GlobalNoticeBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      duration: const Duration(milliseconds: 320),
      vsync: this,
    )..forward();
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, -0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _dismiss() async {
    await _ctrl.reverse();
    widget.onDismiss();
  }

  Color get _accent => switch (widget.type) {
    'warning' => DsColor.warning,
    'danger' => DsColor.danger,
    _ => DsColor.info,
  };

  IconData get _icon => switch (widget.type) {
    'warning' => Icons.warning_amber_rounded,
    'danger' => Icons.error_outline_rounded,
    _ => Icons.info_outline_rounded,
  };

  @override
  Widget build(BuildContext context) {
    final accent = _accent;

    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            DsSpace.lg,
            DsSpace.sm,
            DsSpace.lg,
            0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: DsColor.surface,
              borderRadius: DsRadius.cardR,
              border: Border.all(color: DsColor.tint(accent, 0.35)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.18),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(
              DsSpace.md,
              DsSpace.md,
              DsSpace.sm,
              DsSpace.md,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: DsColor.tint(accent, 0.14),
                    borderRadius: DsRadius.controlR,
                  ),
                  child: Icon(_icon, size: 16, color: accent),
                ),
                const SizedBox(width: DsSpace.md),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(widget.message, style: DsType.label),
                  ),
                ),
                const SizedBox(width: DsSpace.sm),
                DsIconButton(
                  icon: Icons.close_rounded,
                  size: 28,
                  color: DsColor.textFaint,
                  onPressed: _dismiss,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
