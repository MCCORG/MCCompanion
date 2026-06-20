import 'dart:io';
import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

bool isBedrockPack(List<int> bytes) {
  try {
    final archive = ZipDecoder().decodeBytes(bytes);
    return archive.files.any((f) =>
        !f.isFile == false &&
        (f.name == 'manifest.json' || f.name.endsWith('/manifest.json')));
  } catch (_) {
    return false;
  }
}

Future<List<PlatformFile>> pickPackFiles({bool allowMultiple = false}) async {
  final bool useAny = !kIsWeb && Platform.isAndroid;

  final bool needsData = kIsWeb || Platform.isAndroid;

  final result = await FilePicker.platform.pickFiles(
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
