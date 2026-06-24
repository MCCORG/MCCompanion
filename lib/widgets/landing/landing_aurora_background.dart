import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class LandingAuroraBackground extends StatefulWidget {
  const LandingAuroraBackground({super.key});

  @override
  State<LandingAuroraBackground> createState() => LandingAuroraBackgroundState();
}

class LandingAuroraBackgroundState extends State<LandingAuroraBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accent = AppTheme.accent;
    final hsl = HSLColor.fromColor(accent);
    final colorA = accent;
    final colorB = hsl.withHue((hsl.hue + 40) % 360).toColor();
    final colorC = hsl
        .withHue((hsl.hue + 200) % 360)
        .withSaturation(0.6)
        .toColor();

    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, w) => RepaintBoundary(
        child: CustomPaint(
          painter: LandingAuroraPainter(
            t: _ctrl.value,
            colorA: colorA,
            colorB: colorB,
            colorC: colorC,
          ),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class LandingAuroraPainter extends CustomPainter {
  final double t;
  final Color colorA;
  final Color colorB;
  final Color colorC;

  const LandingAuroraPainter({
    required this.t,
    required this.colorA,
    required this.colorB,
    required this.colorC,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    const pi2 = math.pi * 2;

    final blobs = [
      (
        color: colorA,
        cx: w * 0.15 + w * 0.35 * math.sin(pi2 * (t * 0.7 + 0.0)),
        cy: h * 0.08 + h * 0.18 * math.sin(pi2 * (t * 0.5 + 0.1)),
        radius: w * 0.65,
        opacity: 0.09,
      ),
      (
        color: colorB,
        cx: w * 0.75 + w * 0.25 * math.sin(pi2 * (t * 0.6 + 0.4)),
        cy: h * 0.72 + h * 0.20 * math.sin(pi2 * (t * 0.8 + 0.6)),
        radius: w * 0.60,
        opacity: 0.08,
      ),
      (
        color: colorC,
        cx: w * 0.50 + w * 0.20 * math.sin(pi2 * (t * 0.4 + 0.8)),
        cy: h * 0.45 + h * 0.15 * math.sin(pi2 * (t * 0.55 + 0.3)),
        radius: w * 0.45,
        opacity: 0.055,
      ),
    ];

    for (final b in blobs) {
      final paint = Paint()
        ..shader =
            RadialGradient(
              colors: [
                b.color.withValues(alpha: b.opacity),
                b.color.withValues(alpha: 0.0),
              ],
            ).createShader(
              Rect.fromCircle(center: Offset(b.cx, b.cy), radius: b.radius),
            );
      canvas.drawCircle(Offset(b.cx, b.cy), b.radius, paint);
    }
  }

  @override
  bool shouldRepaint(LandingAuroraPainter old) =>
      old.t != t ||
      old.colorA != colorA ||
      old.colorB != colorB ||
      old.colorC != colorC;
}
