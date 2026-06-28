import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import '../models/saved_skin.dart';

class SavedSkinsStorage {
  static const String _metaFile = 'saved_skins.json';

  static Future<Directory> _skinsDir() async {
    final base = await getApplicationDocumentsDirectory();
    final dir = Directory('${base.path}/skins');
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir;
  }

  static Future<File> _metaFilePath() async {
    final base = await getApplicationDocumentsDirectory();
    return File('${base.path}/$_metaFile');
  }

  static Future<List<SavedSkin>> loadAll() async {
    try {
      final file = await _metaFilePath();
      if (!await file.exists()) return [];
      final base = await getApplicationDocumentsDirectory();
      final decoded = jsonDecode(await file.readAsString()) as List;
      return decoded.map((e) {
        final map = e as Map<String, dynamic>;
        final id = map['id'] as String;
        final resolvedPath = '${base.path}/skins/$id.png';
        return SavedSkin.fromJson({...map, 'filePath': resolvedPath});
      }).toList();
    } catch (_) {
      return [];
    }
  }

  static Future<void> saveMeta(List<SavedSkin> skins) async {
    final file = await _metaFilePath();
    await file.writeAsString(jsonEncode(skins.map((s) => s.toJson()).toList()));
  }

  static Future<SavedSkin> add(Uint8List bytes, String name) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final dir = await _skinsDir();
    final skinFile = File('${dir.path}/$id.png');
    await skinFile.writeAsBytes(bytes);

    final skin = SavedSkin(
      id: id,
      name: name,
      filePath: skinFile.path,
      createdAt: DateTime.now(),
    );
    final all = await loadAll();
    all.insert(0, skin);
    await saveMeta(all);
    return skin;
  }

  static Future<void> update(String id, Uint8List bytes) async {
    final all = await loadAll();
    final skin = all.firstWhere(
      (s) => s.id == id,
      orElse: () => throw Exception('Not found'),
    );
    await File(skin.filePath).writeAsBytes(bytes);
  }

  static Future<void> rename(String id, String newName) async {
    final all = await loadAll();
    final i = all.indexWhere((s) => s.id == id);
    if (i < 0) return;
    all[i] = all[i].copyWith(name: newName);
    await saveMeta(all);
  }

  static Future<void> delete(String id) async {
    final all = await loadAll();
    final skin = all.firstWhere(
      (s) => s.id == id,
      orElse: () => throw Exception('Not found'),
    );
    final file = File(skin.filePath);
    if (await file.exists()) await file.delete();
    all.removeWhere((s) => s.id == id);
    await saveMeta(all);
  }
}
