import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';
import '../util/saved_skins_storage.dart';
import 'api_client_base.dart';
import 'auth_service.dart';

class SkinMigrationService {
  static const String _importedKey = 'skins_cloud_imported_ids';
  static const String _doneKeyPrefix = 'skins_cloud_import_done_';
  static const Duration _timeout = Duration(seconds: 15);
  static bool _running = false;

  static Future<int> importCloudSkins() async {
    final user = AuthService.currentUser;
    if (_running || user == null) return 0;
    _running = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final doneKey = '$_doneKeyPrefix${user.uid}';
      if (prefs.getBool(doneKey) ?? false) return 0;

      final listRes = await http
          .get(
            Uri.parse('${AppConstants.apiBase}/api/skins/me'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (listRes.statusCode != 200) return 0;

      final skins =
          (jsonDecode(listRes.body)['skins'] as List?)
              ?.cast<Map<String, dynamic>>() ??
          [];
      if (skins.isEmpty) {
        await prefs.setBool(doneKey, true);
        return 0;
      }

      final imported = (prefs.getStringList(_importedKey) ?? []).toSet();
      var added = 0;
      var failed = false;

      for (final skin in skins) {
        final id = skin['id'] as String?;
        final url = (skin['public_url'] ?? skin['publicUrl']) as String?;
        if (id == null || url == null || imported.contains(id)) continue;

        try {
          final res = await http.get(Uri.parse(url)).timeout(_timeout);
          if (res.statusCode != 200 || res.bodyBytes.isEmpty) {
            failed = true;
            continue;
          }
          final createdAt =
              DateTime.tryParse(skin['created_at'] as String? ?? '') ??
              DateTime.now();
          final name = (skin['name'] as String?)?.trim();
          final wrote = await SavedSkinsStorage.addWithId(
            id,
            res.bodyBytes,
            name == null || name.isEmpty ? 'skin' : name,
            createdAt,
          );
          imported.add(id);
          await prefs.setStringList(_importedKey, imported.toList());
          if (wrote) added++;
        } catch (_) {
          failed = true;
        }
      }
      if (!failed) await prefs.setBool(doneKey, true);
      return added;
    } catch (_) {
      return 0;
    } finally {
      _running = false;
    }
  }
}
