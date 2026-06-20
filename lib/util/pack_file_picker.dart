import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

Future<List<PlatformFile>> pickPackFiles({bool allowMultiple = false}) async {
  final bool useAny = !kIsWeb && Platform.isAndroid;

  final result = await FilePicker.platform.pickFiles(
    type: useAny ? FileType.any : FileType.custom,
    allowedExtensions: useAny ? null : ['mcpack', 'zip'],
    allowMultiple: allowMultiple,
    withData: true,
  );

  if (result == null) return [];

  return result.files.where((f) {
    final n = f.name.toLowerCase();
    return n.endsWith('.mcpack') || n.endsWith('.zip');
  }).toList();
}
