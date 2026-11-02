import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'client_models.dart';

class ClientShortcuts {
  ClientShortcuts._();

  static const List<LogicalKeyboardKey> _digits = [
    LogicalKeyboardKey.digit1,
    LogicalKeyboardKey.digit2,
    LogicalKeyboardKey.digit3,
    LogicalKeyboardKey.digit4,
    LogicalKeyboardKey.digit5,
    LogicalKeyboardKey.digit6,
    LogicalKeyboardKey.digit7,
    LogicalKeyboardKey.digit8,
    LogicalKeyboardKey.digit9,
  ];

  static bool get _mac => defaultTargetPlatform == TargetPlatform.macOS;

  static SingleActivator _command(LogicalKeyboardKey key) =>
      SingleActivator(key, meta: _mac, control: !_mac);

  static String _hint(String key) => _mac ? '⌘$key' : 'Ctrl+$key';

  static String? sectionHint(int index) =>
      index < _digits.length ? _hint('${index + 1}') : null;

  static String get settingsHint => _hint(',');

  static String get consoleHint => _hint('L');

  static Map<ShortcutActivator, VoidCallback> bindings({
    required List<ClientSection> sections,
    required List<ClientSection> footer,
    VoidCallback? onToggleConsole,
    VoidCallback? onDismiss,
  }) {
    final bindings = <ShortcutActivator, VoidCallback>{};
    for (var i = 0; i < sections.length && i < _digits.length; i++) {
      bindings[_command(_digits[i])] = sections[i].onTap;
    }
    final settings = footer.where((section) => section.id == 'customize');
    if (settings.isNotEmpty) {
      bindings[_command(LogicalKeyboardKey.comma)] = settings.first.onTap;
    }
    if (onToggleConsole != null) {
      bindings[_command(LogicalKeyboardKey.keyL)] = onToggleConsole;
    }
    if (onDismiss != null) {
      bindings[const SingleActivator(LogicalKeyboardKey.escape)] = onDismiss;
    }
    return bindings;
  }
}
