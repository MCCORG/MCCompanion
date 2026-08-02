import 'dart:convert';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

enum PackFormat { bedrock, java, invalid }

class PackInspection {
  final PackFormat format;
  final bool hasBehaviorContent;
  final String? name;
  const PackInspection({required this.format, this.hasBehaviorContent = false, this.name});
}

bool isJunkPackEntry(String path) {
  if (path.startsWith('__MACOSX/') || path.contains('/__MACOSX/')) return true;
  final base = path.split('/').last;
  return base == '.DS_Store' || base == 'Thumbs.db' || base == 'desktop.ini';
}

String packRootPrefix(Archive archive) {
  String prefix = '';
  var bestDepth = 1 << 30;
  for (final f in archive.files) {
    if (!f.isFile || isJunkPackEntry(f.name)) continue;
    if (f.name.split('/').last != 'manifest.json') continue;
    final depth = '/'.allMatches(f.name).length;
    if (depth < bestDepth) {
      bestDepth = depth;
      prefix = f.name.substring(0, f.name.length - 'manifest.json'.length);
    }
  }
  return prefix;
}

PackInspection inspectPackBytes(List<int> bytes) {
  Archive archive;
  try {
    archive = ZipDecoder().decodeBytes(bytes);
  } catch (_) {
    return const PackInspection(format: PackFormat.invalid);
  }

  final prefix = packRootPrefix(archive);
  ArchiveFile? manifestFile;
  var hasMcmeta = false;
  var hasBehaviorFolders = false;
  for (final f in archive.files) {
    if (!f.isFile || isJunkPackEntry(f.name)) continue;
    if (f.name == '${prefix}manifest.json') manifestFile = f;
    if (f.name.split('/').last == 'pack.mcmeta') hasMcmeta = true;
    if (f.name.startsWith('${prefix}scripts/') || f.name.startsWith('${prefix}functions/')) {
      hasBehaviorFolders = true;
    }
  }

  if (manifestFile == null) {
    return PackInspection(format: hasMcmeta ? PackFormat.java : PackFormat.invalid);
  }

  String? name;
  var hasBehaviorModules = false;
  try {
    final json = jsonDecode(utf8.decode(manifestFile.content as List<int>));
    final n = json['header']?['name'] ?? json['name'];
    if (n is String && n.isNotEmpty) name = n;
    final modules = json['modules'];
    if (modules is List) {
      for (final m in modules) {
        final type = (m is Map ? m['type'] : null)?.toString().toLowerCase();
        if (type == 'data' || type == 'script' || type == 'javascript') {
          hasBehaviorModules = true;
        }
      }
    }
  } catch (_) {}

  return PackInspection(
    format: PackFormat.bedrock,
    hasBehaviorContent: hasBehaviorModules || hasBehaviorFolders,
    name: name,
  );
}

Future<List<PlatformFile>> pickPackFiles({bool allowMultiple = false}) async {
  final bool useAny = !kIsWeb && Platform.isAndroid;

  final bool needsData = kIsWeb || Platform.isAndroid;

  final result = await FilePicker.pickFiles(
    type: useAny ? FileType.any : FileType.custom,
    allowedExtensions: useAny ? null : ['mcpack', 'zip'],
    allowMultiple: allowMultiple,
    withData: needsData,
  );

  if (result == null) return [];

  return result.files.where((f) {
    final n = f.name.toLowerCase();
    return n.endsWith('.mcpack') || n.endsWith('.zip');
  }).toList();
}
