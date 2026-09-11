import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';

class AppBlur {
  const AppBlur._();

  static bool get _isAndroid => !kIsWeb && Platform.isAndroid;

  static const bool blurOnAndroid = true;

  static double sigmaFor(double sigma) {
    if (!_isAndroid) return sigma;
    if (!blurOnAndroid) return 0;
    return sigma.clamp(0, 8).toDouble();
  }

  static ImageFilter? filter(double sigma) {
    final s = sigmaFor(sigma);
    if (s <= 0) return null;
    return ImageFilter.blur(sigmaX: s, sigmaY: s);
  }
}
