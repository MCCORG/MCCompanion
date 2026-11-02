import 'dart:convert';
import 'dart:math';

class RouteSession {
  RouteSession._();

  static final String id = _generate();

  static String _generate() {
    final random = Random.secure();
    final bytes = List<int>.generate(24, (_) => random.nextInt(256));
    return base64Url.encode(bytes).replaceAll('=', '');
  }
}
