import 'dart:math' as math;
import 'package:flutter/material.dart';

class AppNoisePainter extends CustomPainter {
  final Color color;
  final double opacity;
  final int seed;
  final int count;

  const AppNoisePainter({
    required this.color,
    this.opacity = 0.05,
    this.seed = 42,
    this.count = 180,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rng = math.Random(seed);
    final paint = Paint()..color = color.withValues(alpha: opacity);
    for (int i = 0; i < count; i++) {
      canvas.drawCircle(
        Offset(rng.nextDouble() * size.width, rng.nextDouble() * size.height),
        rng.nextDouble() * 1.3 + 0.2,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(AppNoisePainter old) =>
      old.color != color ||
      old.opacity != opacity ||
      old.seed != seed ||
      old.count != count;
}

class AppWavePainter extends CustomPainter {
  final List<WaveConfig> waves;

  const AppWavePainter({required this.waves});

  @override
  void paint(Canvas canvas, Size size) {
    for (final w in waves) {
      final paint = Paint()
        ..color = w.color.withValues(alpha: w.opacity)
        ..style = PaintingStyle.stroke
        ..strokeWidth = w.strokeWidth;
      final path = Path()..moveTo(0, size.height * w.yFraction);
      for (double x = 0; x <= size.width; x += 1) {
        path.lineTo(
          x,
          size.height * w.yFraction +
              w.amplitude *
                  math.sin(
                    (x / size.width) * w.frequency * math.pi + w.phase,
                  ),
        );
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(AppWavePainter old) => old.waves != waves;
}

/// Config voor één golf.
class WaveConfig {
  final double yFraction;
  final double amplitude;
  final double frequency;
  final double phase;
  final Color color;
  final double opacity;
  final double strokeWidth;

  const WaveConfig({
    required this.yFraction,
    required this.amplitude,
    required this.frequency,
    required this.phase,
    required this.color,
    required this.opacity,
    this.strokeWidth = 1.2,
  });
}