import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../services/home_customization_service.dart';

class LandingQuickCard extends StatefulWidget {
  final AppFeature feature;
  final VoidCallback onTap;
  final Duration animationDelay;
  final bool wide;

  const LandingQuickCard({
    super.key,
    required this.feature,
    required this.onTap,
    this.animationDelay = Duration.zero,
    this.wide = false,
  });

  @override
  State<LandingQuickCard> createState() => LandingQuickCardState();
}

class LandingQuickCardState extends State<LandingQuickCard>
    with TickerProviderStateMixin {
  bool _pressed = false;
  late final AnimationController _entranceCtrl;
  late final AnimationController _idleCtrl;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _entranceCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    );
    _fadeAnim = CurvedAnimation(parent: _entranceCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.12), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _entranceCtrl, curve: Curves.easeOutCubic),
        );
    _idleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    );

    Future.delayed(widget.animationDelay, () {
      if (!mounted) return;
      _entranceCtrl.forward();
      _idleCtrl.repeat();
    });
  }

  @override
  void dispose() {
    _entranceCtrl.dispose();
    _idleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final color = AppTheme.accent;

    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: GestureDetector(
          onTapDown: (_) => setState(() => _pressed = true),
          onTapUp: (_) => setState(() => _pressed = false),
          onTapCancel: () => setState(() => _pressed = false),
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: _pressed ? 0.97 : 1.0,
            duration: const Duration(milliseconds: 100),
            child: Container(
              padding: widget.wide
                  ? const EdgeInsets.fromLTRB(18, 24, 16, 24)
                  : const EdgeInsets.fromLTRB(16, 15, 16, 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.borderGray),
                color: AppTheme.surfaceRaised,
              ),
              child: widget.wide
                  ? Row(
                      children: [
                        _AnimatedFeatureIcon(
                          feature: widget.feature,
                          color: color,
                          progress: _idleCtrl,
                          size: 44,
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.feature.label(l),
                                style: TextStyle(
                                  color: AppTheme.textPrimary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  height: 1.15,
                                  letterSpacing: -0.3,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                widget.feature.subtitle(l),
                                style: TextStyle(
                                  color: AppTheme.textMuted,
                                  fontSize: 13,
                                  height: 1.3,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color.withValues(alpha: 0.12),
                          ),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 16,
                            color: color,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 40,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _AnimatedFeatureIcon(
                                feature: widget.feature,
                                color: color,
                                progress: _idleCtrl,
                                size: 34,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    widget.feature.label(l),
                                    style: TextStyle(
                                      color: AppTheme.textPrimary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2,
                                      letterSpacing: -0.2,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.feature.subtitle(l),
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                            height: 1.25,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedFeatureIcon extends StatelessWidget {
  final AppFeature feature;
  final Color color;
  final Animation<double> progress;
  final double size;

  const _AnimatedFeatureIcon({
    required this.feature,
    required this.color,
    required this.progress,
    this.size = 44,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Transform.scale(
        scale: size / 44,
        child: SizedBox(
          width: 44,
          height: 44,
          child: AnimatedBuilder(
            animation: progress,
            builder: (context, child) => CustomPaint(
              painter: _FeatureIconPainter(
                feature: feature,
                color: color,
                t: progress.value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureIconPainter extends CustomPainter {
  final AppFeature feature;
  final Color color;
  final double t;

  _FeatureIconPainter({
    required this.feature,
    required this.color,
    required this.t,
  });

  @override
  void paint(Canvas canvas, Size size) {
    switch (feature) {
      case AppFeature.connector:
        _paintConnector(canvas);
      case AppFeature.skins:
        _paintSkins(canvas);
      case AppFeature.partners:
        _paintPartners(canvas);
      case AppFeature.lookup:
        _paintLookup(canvas);
      case AppFeature.tracker:
        _paintTracker(canvas);
    }
  }

  Paint get _stroke => Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.4
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    ..color = color;

  Paint get _fill => Paint()..color = color;

  void _paintConnector(Canvas canvas) {
    const center = Offset(22, 22);
    for (var i = 0; i < 2; i++) {
      final p = (t + i * 0.5) % 1.0;
      canvas.drawCircle(
        center,
        13 + p * 8,
        _stroke
          ..strokeWidth = 2.0
          ..color = color.withValues(alpha: (1 - p) * 0.55),
      );
    }
    final tri = Path()
      ..moveTo(16, 12)
      ..lineTo(16, 32)
      ..lineTo(33, 22)
      ..close();
    canvas.drawPath(tri, _fill);
  }

  void _paintSkins(Canvas canvas) {
    final shirt = Path()
      ..moveTo(16, 10)
      ..lineTo(11, 15)
      ..lineTo(15, 19)
      ..lineTo(15, 34)
      ..lineTo(29, 34)
      ..lineTo(29, 19)
      ..lineTo(33, 15)
      ..lineTo(28, 10)
      ..lineTo(22, 13)
      ..close();
    canvas.drawPath(shirt, Paint()..color = color.withValues(alpha: 0.22));
    canvas.drawPath(shirt, _stroke);

    canvas.save();
    canvas.clipPath(shirt);
    final x = -8 + ((t * 1.4) % 1.0) * 60;
    canvas.translate(x, 22);
    canvas.rotate(-0.32);
    canvas.drawRect(
      Rect.fromCenter(center: Offset.zero, width: 7, height: 60),
      Paint()..color = Colors.white.withValues(alpha: 0.30),
    );
    canvas.restore();
  }

  void _paintPartners(Canvas canvas) {
    for (var i = 0; i < 2; i++) {
      final top = 11.0 + i * 14;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(9, top, 26, 11),
          const Radius.circular(3.5),
        ),
        _stroke,
      );
      final phase = (t * 2 + i * 0.5) % 1.0;
      final on = phase < 0.45;
      canvas.drawCircle(
        Offset(29.5, top + 5.5),
        2.0,
        _fill..color = color.withValues(alpha: on ? 1.0 : 0.22),
      );
      canvas.drawCircle(
        Offset(23.5, top + 5.5),
        2.0,
        _fill..color = color.withValues(alpha: on ? 0.25 : 0.9),
      );
    }
  }

  void _paintLookup(Canvas canvas) {
    const lens = Offset(19, 19);
    const r = 9.5;
    canvas.save();
    canvas.clipPath(Path()..addOval(Rect.fromCircle(center: lens, radius: r)));
    final y = lens.dy + math.sin(t * math.pi * 2) * (r - 1.5);
    canvas.drawLine(
      Offset(lens.dx - r, y),
      Offset(lens.dx + r, y),
      _stroke
        ..strokeWidth = 2.0
        ..color = color.withValues(alpha: 0.75),
    );
    canvas.restore();
    canvas.drawCircle(lens, r, _stroke);
    canvas.drawLine(const Offset(26, 26), const Offset(33.5, 33.5), _stroke);
  }

  void _paintTracker(Canvas canvas) {
    const center = Offset(22, 22);
    canvas.drawCircle(
      center,
      14,
      _stroke
        ..strokeWidth = 1.8
        ..color = color.withValues(alpha: 0.30),
    );
    canvas.drawCircle(
      center,
      7,
      _stroke
        ..strokeWidth = 1.8
        ..color = color.withValues(alpha: 0.30),
    );

    final ping = (t * 2) % 1.0;
    canvas.drawCircle(
      center,
      4 + ping * 12,
      _stroke
        ..strokeWidth = 2.0
        ..color = color.withValues(alpha: (1 - ping) * 0.6),
    );

    final sweep = t * math.pi * 2;
    for (var k = 6; k >= 0; k--) {
      final a = sweep - k * 0.14;
      canvas.drawLine(
        center,
        center + Offset(math.cos(a), math.sin(a)) * 14,
        _stroke
          ..strokeWidth = 2.4
          ..color = color.withValues(alpha: (1 - k / 7) * 0.95),
      );
    }
    canvas.drawCircle(center, 2.6, _fill..color = color);
  }

  @override
  bool shouldRepaint(_FeatureIconPainter old) =>
      old.t != t || old.color != color || old.feature != feature;
}

class LandingFeedbackTile extends StatefulWidget {
  final VoidCallback? onTap;
  const LandingFeedbackTile({super.key, this.onTap});

  @override
  State<LandingFeedbackTile> createState() => LandingFeedbackTileState();
}

class LandingFeedbackTileState extends State<LandingFeedbackTile> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFFF87171);
    const colorAccent = Color(0xFF67E404);

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withValues(alpha: 0.20)),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.lerp(AppTheme.surfaceRaised, color, 0.06)!,
                Color.lerp(AppTheme.surfaceRaised, colorAccent, 0.04)!,
              ],
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withValues(alpha: 0.12),
                ),
                child: const Center(
                  child: FaIcon(FontAwesomeIcons.bug, size: 15, color: color),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.feedbackTileTitle,
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      AppLocalizations.of(context)!.feedbackTileSubtitle,
                      style: TextStyle(color: AppTheme.textMuted, fontSize: 11),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.surfaceRaised,
                  border: Border.all(color: AppTheme.borderGray),
                ),
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 16,
                  color: AppTheme.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LandingQuickNavChip extends StatefulWidget {
  final Widget iconWidget;
  final String label;
  final VoidCallback? onTap;

  const LandingQuickNavChip({
    super.key,
    required this.iconWidget,
    required this.label,
    this.onTap,
  });

  @override
  State<LandingQuickNavChip> createState() => LandingQuickNavChipState();
}

class LandingQuickNavChipState extends State<LandingQuickNavChip> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Tooltip(
        message: widget.label,
        preferBelow: true,
        child: GestureDetector(
          onTapDown: (_) => setState(() => _pressed = true),
          onTapUp: (_) => setState(() => _pressed = false),
          onTapCancel: () => setState(() => _pressed = false),
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(
              color: _pressed ? AppTheme.borderLight : AppTheme.surfaceRaised,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.borderGray),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.iconWidget,
                const SizedBox(height: 5),
                SizedBox(
                  height: 12,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                    child: Text(
                      widget.label,
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        height: 1.1,
                      ),
                      maxLines: 1,
                      softWrap: false,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
