import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class RelayPreferenceStorage {
  static const String _fileName = 'selected_relay.json';

  static const Duration autoTtl = Duration(hours: 24);

  static Map<String, dynamic>? _memo;

  static Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$_fileName');
  }

  static Future<Map<String, dynamic>> _read() async {
    final memo = _memo;
    if (memo != null) return memo;
    try {
      final file = await _getFile();
      if (!await file.exists()) return _memo = <String, dynamic>{};
      final decoded = json.decode(await file.readAsString());
      if (decoded is! Map) return _memo = <String, dynamic>{};
      return _memo = decoded.cast<String, dynamic>();
    } catch (_) {
      return _memo = <String, dynamic>{};
    }
  }

  static Future<void> _write(Map<String, dynamic> data) async {
    _memo = data;
    try {
      final file = await _getFile();
      await file.writeAsString(json.encode(data));
    } catch (_) {
    }
  }

  static Future<String?> loadManualIp() async =>
      (await _read())['manualIp'] as String?;

  static Future<void> saveManualIp(String? ip) async {
    final data = Map<String, dynamic>.from(await _read());
    if (ip == null) {
      data.remove('manualIp');
    } else {
      data['manualIp'] = ip;
    }
    await _write(data);
  }

  static Future<({String ip, bool fresh})?> loadAutoIp() async {
    final data = await _read();
    final ip = data['autoIp'] as String?;
    if (ip == null) return null;
    final at = DateTime.tryParse(data['autoAt'] as String? ?? '');
    final fresh = at != null && DateTime.now().difference(at) < autoTtl;
    return (ip: ip, fresh: fresh);
  }

  static Future<void> saveAutoIp(String ip) async {
    final data = Map<String, dynamic>.from(await _read());
    data['autoIp'] = ip;
    data['autoAt'] = DateTime.now().toIso8601String();
    await _write(data);
  }
}
