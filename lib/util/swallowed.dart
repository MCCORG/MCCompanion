import 'package:flutter/foundation.dart';

void swallowed(String where, Object error, [StackTrace? stack]) {
  if (kDebugMode) {
    debugPrint('[swallowed] $where: $error');
    if (stack != null) debugPrint(stack.toString());
  }
}
