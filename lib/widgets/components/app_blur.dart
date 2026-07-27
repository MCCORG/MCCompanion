import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';


class AppBlur {
  const AppBlur._();

  static bool get _isAndroid => !kIsWeb && Platform.isAndroid;

  static const bool blurOnAndroid = true;

  static double sigmaFor(double sigma) {
    if (!_isAndroid) return sigma;
    if (!blurOnAndroid) return 0;
    return sigma.clamp(0, 8).toDouble();
  }

  static double surfaceAlpha(double alpha) {
    if (!_isAndroid) return alpha;
    final bumped = blurOnAndroid ? alpha + 0.06 : alpha + 0.12;
    return bumped.clamp(0.0, 1.0);
  }

  static ImageFilter? filter(double sigma) {
    final s = sigmaFor(sigma);
    if (s <= 0) return null;
    return ImageFilter.blur(sigmaX: s, sigmaY: s);
  }

  static Widget backdrop({required double sigma, required Widget child}) {
    final f = filter(sigma);
    if (f == null) return child;
    return BackdropFilter(filter: f, child: child);
  }
}
