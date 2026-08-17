import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

enum Distribution {
  standalone,
  store,
}

class DistributionService {
  static const String _override = String.fromEnvironment('DISTRIBUTION');

  static Distribution _current = Distribution.store;
  static String _version = '';
  static Distribution get current => _current;
  static bool get isStandalone => _current == Distribution.standalone;
  static String get version => _version;

  static Future<void> init() async {
    try {
      final info = await PackageInfo.fromPlatform();
      _version = info.version;
      _current = await _detect(info);
    } catch (_) {
    }
  }

  static Future<Distribution> _detect(PackageInfo info) async {
    if (_override == 'store') return Distribution.store;
    if (_override == 'standalone') return Distribution.standalone;

    if (Platform.isAndroid) {
      final installer = info.installerStore ?? '';
      return installer == 'com.android.vending'
          ? Distribution.store
          : Distribution.standalone;
    }

    if (Platform.isWindows) {
      final path = Platform.resolvedExecutable.toLowerCase();
      return path.contains(r'\windowsapps\')
          ? Distribution.store
          : Distribution.standalone;
    }

    if (Platform.isLinux) {
      final env = Platform.environment;
      final packaged = (env['SNAP'] ?? '').isNotEmpty ||
          (env['FLATPAK_ID'] ?? '').isNotEmpty;
      return packaged ? Distribution.store : Distribution.standalone;
    }

    if (Platform.isMacOS) {
      final macos = File(Platform.resolvedExecutable).parent; // Contents/MacOS
      final receipt = File('${macos.parent.path}/_MASReceipt/receipt');
      return receipt.existsSync() ? Distribution.store : Distribution.standalone;
    }

    return Distribution.store;
  }
}
