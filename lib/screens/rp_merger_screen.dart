import 'dart:convert';
import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:crypto/crypto.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';
import '../l10n/app_localizations.dart';
import '../services/auth_service.dart';
import '../theme/app_theme.dart';
import '../design/design.dart';
import '../util/pack_file_picker.dart';
import '../util/resource_pack_prefs.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/resource_pack/rp_tab_info_box.dart';

class _PackEntry {
  final String id;
  final String path;
  final String name;
  final int? size;
  final bool hasBehaviorContent;
  _PackEntry({
    required this.id,
    required this.path,
    required this.name,
    required this.size,
    this.hasBehaviorContent = false,
  });
}

class _SavedMerge {
  final String id;
  final String path;
  final String filename;
  final int? size;
  final List<String> sourceNames;
  final DateTime createdAt;

  _SavedMerge({
    required this.id,
    required this.path,
    required this.filename,
    required this.size,
    required this.sourceNames,
    required this.createdAt,
  });

  String get displayName => sourceNames
      .map((n) {
        final parts = n.split(' ');
        return parts.take(2).join(' ');
      })
      .join(' + ');

  Map<String, dynamic> toJson() => {
    'id': id,
    'path': path,
    'filename': filename,
    'size': size,
    'sourceNames': sourceNames,
    'createdAt': createdAt.toIso8601String(),
  };

  factory _SavedMerge.fromJson(Map<String, dynamic> m) => _SavedMerge(
    id: m['id'],
    path: m['path'],
    filename: m['filename'] as String? ?? 'merged_rp.zip',
    size: m['size'] as int?,
    sourceNames: (m['sourceNames'] as List).cast<String>(),
    createdAt: DateTime.parse(m['createdAt']),
  );
}

class RpMergerWidget extends StatefulWidget {
  final void Function(String path, String filename) onActivated;
  const RpMergerWidget({super.key, required this.onActivated});

  @override
  State<RpMergerWidget> createState() => _RpMergerWidgetState();
}

class _RpMergerWidgetState extends State<RpMergerWidget> {
  final List<_PackEntry> _packs = [];
  final List<_SavedMerge> _saved = [];
  bool _merging = false;
  bool _isDragging = false;
  String? _error;
  String? _activatingId;

  static const _kSavedKey = 'rp_merger_saved';

  @override
  void initState() {
    super.initState();
    _restoreState();
  }

  Future<void> _restoreState() async {
    final prefs = await SharedPreferences.getInstance();
    final rawSaved = prefs.getString(_kSavedKey);
    if (rawSaved != null) {
      final list = (jsonDecode(rawSaved) as List).cast<Map<String, dynamic>>();
      final valid = <_SavedMerge>[];
      for (final m in list) {
        final merge = _SavedMerge.fromJson(m);
        if (await File(merge.path).exists()) valid.add(merge);
      }
      if (mounted) {
        setState(() {
          _saved.clear();
          _saved.addAll(valid);
        });
      }
    }
  }

  Future<void> _saveSavedState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _kSavedKey,
      jsonEncode(_saved.map((m) => m.toJson()).toList()),
    );
  }

  static String _hashToUuid(String hash) {
    final h = hash.padRight(32, '0').substring(0, 32);
    return '${h.substring(0, 8)}-${h.substring(8, 12)}-4${h.substring(13, 16)}-${h.substring(16, 20)}-${h.substring(20, 32)}';
  }

  String _humanSize(int? bytes) {
    if (bytes == null) return '';
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / 1024 / 1024).toStringAsFixed(1)} MB';
  }

  bool _validatePack(PackInspection inspection) {
    if (!mounted) return false;
    if (inspection.format != PackFormat.bedrock) {
      AppToast.show(
        context,
        message: AppLocalizations.of(context)!.rpInvalidPackFormat,
        icon: Icons.error_outline_rounded,
        color: AppTheme.error,
      );
      return false;
    }
    return true;
  }

  Future<void> _addPackFromPath(String path, {int? size}) async {
    if (_packs.length >= 4) return;
    List<int> bytes;
    try {
      bytes = await File(path).readAsBytes();
    } catch (_) {
      return;
    }
    final inspection = inspectPackBytes(bytes);
    if (!_validatePack(inspection)) return;
    final name =
        inspection.name ??
        path
            .split('/')
            .last
            .replaceAll(RegExp(r'\.(zip|mcpack)$', caseSensitive: false), '');
    setState(
      () => _packs.add(
        _PackEntry(
          id: UniqueKey().toString(),
          path: path,
          name: name,
          size: size,
          hasBehaviorContent: inspection.hasBehaviorContent,
        ),
      ),
    );
  }

  Future<void> _addPackFromBytes(
    List<int> bytes, {
    required String name,
    int? size,
  }) async {
    if (_packs.length >= 4) return;
    final inspection = inspectPackBytes(bytes);
    if (!_validatePack(inspection)) return;
    final displayName =
        inspection.name ??
        name.replaceAll(RegExp(r'\.(zip|mcpack)$', caseSensitive: false), '');
    final tmp = await getTemporaryDirectory();
    final safeName = name.replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '_');
    final unique = '${DateTime.now().millisecondsSinceEpoch}_$safeName';
    final tmpFile = File('${tmp.path}/$unique');
    await tmpFile.writeAsBytes(bytes);
    setState(
      () => _packs.add(
        _PackEntry(
          id: UniqueKey().toString(),
          path: tmpFile.path,
          name: displayName,
          size: size,
          hasBehaviorContent: inspection.hasBehaviorContent,
        ),
      ),
    );
  }

  Future<void> _pickPack() async {
    if (_packs.length >= 4) return;
    final picked = await pickPackFiles(allowMultiple: true);
    if (picked.isEmpty) return;
    setState(() => _error = null);
    for (final f in picked) {
      if (_packs.length >= 4) break;
      if (f.bytes != null) {
        await _addPackFromBytes(f.bytes!, name: f.name, size: f.size);
      } else if (f.path != null) {
        await _addPackFromPath(f.path!, size: f.size);
      }
    }
  }

  void _remove(String id) {
    setState(() {
      _packs.removeWhere((p) => p.id == id);
      _error = null;
    });
  }

  void _moveUp(int i) {
    if (i == 0) return;
    setState(() {
      final t = _packs[i];
      _packs[i] = _packs[i - 1];
      _packs[i - 1] = t;
    });
  }

  void _moveDown(int i) {
    if (i == _packs.length - 1) return;
    setState(() {
      final t = _packs[i];
      _packs[i] = _packs[i + 1];
      _packs[i + 1] = t;
    });
  }

  Future<void> _merge() async {
    if (_packs.length < 2) return;
    setState(() {
      _merging = true;
      _error = null;
    });

    try {
      final merged = <String, List<int>>{};
      for (int i = _packs.length - 1; i >= 0; i--) {
        final bytes = await File(_packs[i].path).readAsBytes();
        final archive = ZipDecoder().decodeBytes(bytes);
        final prefix = packRootPrefix(archive);
        for (final entry in archive) {
          if (!entry.isFile || isJunkPackEntry(entry.name)) continue;
          if (prefix.isNotEmpty && !entry.name.startsWith(prefix)) continue;
          final rel = entry.name.substring(prefix.length);
          if (rel.isNotEmpty) merged[rel] = entry.content as List<int>;
        }
      }

      final manifestKey = merged.containsKey('manifest.json')
          ? 'manifest.json'
          : merged.keys.firstWhere(
              (k) => k.endsWith('/manifest.json'),
              orElse: () => '',
            );
      if (manifestKey.isNotEmpty) {
        try {
          final manifestJson =
              jsonDecode(utf8.decode(merged[manifestKey]!))
                  as Map<String, dynamic>;
          final contentHash = sha256
              .convert(merged.values.expand((b) => b).toList())
              .toString();
          final header = manifestJson['header'] as Map<String, dynamic>? ?? {};
          header['uuid'] = _hashToUuid(contentHash);
          manifestJson['header'] = header;
          final modules = manifestJson['modules'];
          if (modules is List) {
            for (var i = 0; i < modules.length; i++) {
              final m = modules[i];
              if (m is Map<String, dynamic>) {
                m['uuid'] = _hashToUuid(
                  sha256.convert(utf8.encode('$contentHash#$i')).toString(),
                );
              }
            }
          }
          final newManifest = utf8.encode(jsonEncode(manifestJson));
          merged[manifestKey] = newManifest;
        } catch (_) {}
      }

      final outArchive = Archive();
      for (final e in merged.entries) {
        outArchive.addFile(ArchiveFile(e.key, e.value.length, e.value));
      }
      final outBytes = ZipEncoder().encode(outArchive);

      final dir = await getApplicationDocumentsDirectory();
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      final slug = _packs
          .map((p) {
            var s = p.name
                .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_')
                .replaceAll(RegExp(r'_+'), '_')
                .replaceAll(RegExp(r'^_|_$'), '');
            if (s.isEmpty) s = 'pack';
            return s.substring(0, s.length.clamp(0, 20));
          })
          .join('+');
      final filename = '$slug.zip';
      final outFile = File('${dir.path}/merged_$id.zip');
      await outFile.writeAsBytes(outBytes);

      final stat = await outFile.stat();
      final savedMerge = _SavedMerge(
        id: id,
        path: outFile.path,
        filename: filename,
        size: stat.size,
        sourceNames: _packs.map((p) => p.name).toList(),
        createdAt: DateTime.now(),
      );

      if (!mounted) return;
      setState(() {
        _saved.insert(0, savedMerge);
        _merging = false;
      });
      _saveSavedState();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = AppLocalizations.of(context)!.rpMergeFailed(e.toString());
        _merging = false;
      });
    }
  }

  Future<void> _activate(_SavedMerge merge) async {
    setState(() => _activatingId = merge.id);
    try {
      final token = await AuthService.getIdToken();
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('${AppConstants.apiBase}/api/resource-pack/upload'),
      );
      if (token != null) request.headers['Authorization'] = 'Bearer $token';
      request.files.add(
        await http.MultipartFile.fromPath(
          'pack',
          merge.path,
          filename: merge.filename,
        ),
      );

      final streamed = await request.send();
      final body = await streamed.stream.bytesToString();

      if (streamed.statusCode == 200) {
        final data = jsonDecode(body) as Map<String, dynamic>;
        final url = data['url'] as String;
        await ResourcePackPrefs.save(
          url: url,
          enabled: true,
          filename: merge.filename,
          isUpload: true,
        );
        if (!mounted) return;
        setState(() => _activatingId = null);
        widget.onActivated(url, merge.filename);
      } else {
        throw Exception('Upload failed (${streamed.statusCode})');
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _activatingId = null);
      if (mounted) {
        AppToast.show(
          context,
          message: e.toString(),
          icon: Icons.error_outline_rounded,
          color: AppTheme.error,
        );
      }
    }
  }

  void _deleteSaved(String id) async {
    final merge = _saved.firstWhere((m) => m.id == id);
    setState(() => _saved.removeWhere((m) => m.id == id));
    _saveSavedState();
    try {
      await File(merge.path).delete();
    } catch (_) {}
  }

  void _showInfo(BuildContext context, _SavedMerge merge) {
    final l = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (ctx) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: Padding(
            padding: const EdgeInsets.all(DsSpace.xl - 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.inventory_2_rounded,
                      size: 18,
                      color: DsColor.accent,
                    ),
                    const SizedBox(width: DsSpace.sm),
                    Expanded(
                      child: Text(merge.displayName, style: DsType.heading),
                    ),
                    DsIconButton(
                      icon: Icons.close_rounded,
                      size: 32,
                      onPressed: () => Navigator.pop(ctx),
                    ),
                  ],
                ),
                const SizedBox(height: DsSpace.lg),
                _InfoRow(label: l.rpMergerSize, value: _humanSize(merge.size)),
                _InfoRow(
                  label: l.rpMergerCreated,
                  value: _formatDate(merge.createdAt),
                ),
                const SizedBox(height: DsSpace.md),
                Text(
                  l.rpMergerSourcePacks,
                  style: DsType.caption.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: DsSpace.sm),
                ...merge.sourceNames.asMap().entries.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: DsSpace.sm - 2),
                    child: Row(
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: e.key == 0
                                ? DsColor.accent.withValues(alpha: 0.12)
                                : DsColor.inset,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: e.key == 0
                                  ? DsColor.accent.withValues(alpha: 0.3)
                                  : DsColor.line,
                            ),
                          ),
                          child: Text(
                            '${e.key + 1}',
                            style: DsType.caption.copyWith(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w800,
                              color: e.key == 0
                                  ? DsColor.accent
                                  : DsColor.textFaint,
                            ),
                          ),
                        ),
                        const SizedBox(width: DsSpace.sm),
                        Expanded(child: Text(e.value, style: DsType.body)),
                        if (e.key == 0)
                          DsBadge(
                            label: l.rpMergerTopBadge,
                            color: DsColor.accent,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime dt) {
    return '${dt.day}/${dt.month}/${dt.year}  ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final canMerge = _packs.length >= 2 && !_merging;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RpTabInfoBox(text: l.rpMergerPriorityHint),
        const SizedBox(height: DsSpace.lg),

        ..._packs.asMap().entries.map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: DsSpace.sm),
            child: _PackCard(
              pack: e.value,
              index: e.key,
              total: _packs.length,
              humanSize: _humanSize,
              topLabel: l.rpMergerTopBadge,
              onRemove: () => _remove(e.value.id),
              onMoveUp: () => _moveUp(e.key),
              onMoveDown: () => _moveDown(e.key),
            ),
          ),
        ),

        if (_packs.length < 4)
          DropTarget(
            onDragEntered: (_) => setState(() => _isDragging = true),
            onDragExited: (_) => setState(() => _isDragging = false),
            onDragDone: (detail) async {
              setState(() => _isDragging = false);
              for (final f in detail.files) {
                if (_packs.length >= 4) break;
                if (!f.name.endsWith('.zip') && !f.name.endsWith('.mcpack')) {
                  continue;
                }
                await _addPackFromPath(f.path);
              }
            },
            child: GestureDetector(
              onTap: _pickPack,
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: DsDuration.fast,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: DsSpace.xl - 4),
                decoration: BoxDecoration(
                  color: _isDragging
                      ? DsColor.accent.withValues(alpha: 0.08)
                      : DsColor.surface,
                  borderRadius: DsRadius.cardR,
                  border: Border.all(
                    color: _isDragging
                        ? DsColor.accent.withValues(alpha: 0.6)
                        : DsColor.line,
                    width: _isDragging ? 1.5 : 1,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      _isDragging
                          ? Icons.file_download_rounded
                          : Icons.add_rounded,
                      size: 28,
                      color: _isDragging ? DsColor.accent : DsColor.textFaint,
                    ),
                    const SizedBox(height: DsSpace.sm - 2),
                    Text(
                      _isDragging
                          ? l.rpMergerDropToAdd
                          : _packs.isEmpty
                          ? l.rpMergerAddPacks
                          : l.rpMergerAddAnother(_packs.length),
                      style: DsType.bodyStrong.copyWith(
                        color: _isDragging ? DsColor.accent : DsColor.textSoft,
                      ),
                    ),
                    const SizedBox(height: DsSpace.xxs),
                    Text(l.rpMergerFileTypes, style: DsType.caption),
                  ],
                ),
              ),
            ),
          ),

        if (_error != null) ...[
          const SizedBox(height: DsSpace.lg),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(DsSpace.md),
            decoration: BoxDecoration(
              color: DsColor.danger.withValues(alpha: 0.08),
              borderRadius: DsRadius.controlR,
              border: Border.all(color: DsColor.danger.withValues(alpha: 0.25)),
            ),
            child: Text(
              _error!,
              style: DsType.caption.copyWith(color: DsColor.danger),
            ),
          ),
        ],

        if (_packs.length >= 2) ...[
          const SizedBox(height: DsSpace.lg),
          DsButton(
            label: _merging
                ? l.rpMergerMerging
                : l.rpMergerButton(_packs.length),
            icon: Icons.merge_rounded,
            size: DsButtonSize.large,
            expand: true,
            busy: _merging,
            onPressed: canMerge ? _merge : null,
          ),
        ],

        if (_saved.isNotEmpty) ...[
          const SizedBox(height: DsSpace.section),
          Text(l.rpMergerSavedMerges, style: DsType.heading),
          const SizedBox(height: DsSpace.md),
          ..._saved.map(
            (merge) => Padding(
              padding: const EdgeInsets.only(bottom: DsSpace.sm),
              child: _SavedMergeCard(
                merge: merge,
                humanSize: _humanSize,
                activating: _activatingId == merge.id,
                onInfo: () => _showInfo(context, merge),
                onDelete: () => _deleteSaved(merge.id),
                onActivate: () => _activate(merge),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DsSpace.sm),
      child: Row(
        children: [
          Text(label, style: DsType.caption),
          const SizedBox(width: DsSpace.sm),
          Text(value, style: DsType.label.copyWith(color: DsColor.text)),
        ],
      ),
    );
  }
}

class _PackGlyph extends StatelessWidget {
  final IconData icon;
  final bool highlighted;
  const _PackGlyph({required this.icon, this.highlighted = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: highlighted
            ? DsColor.accent.withValues(alpha: 0.12)
            : DsColor.inset,
        borderRadius: DsRadius.controlR,
        border: Border.all(
          color: highlighted
              ? DsColor.accent.withValues(alpha: 0.3)
              : DsColor.line,
        ),
      ),
      child: Icon(
        icon,
        size: 18,
        color: highlighted ? DsColor.accent : DsColor.textFaint,
      ),
    );
  }
}

class _SavedMergeCard extends StatelessWidget {
  final _SavedMerge merge;
  final String Function(int?) humanSize;
  final bool activating;
  final VoidCallback onInfo;
  final VoidCallback onDelete;
  final VoidCallback onActivate;

  const _SavedMergeCard({
    required this.merge,
    required this.humanSize,
    required this.activating,
    required this.onInfo,
    required this.onDelete,
    required this.onActivate,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return DsCard(
      padding: const EdgeInsets.symmetric(
        horizontal: DsSpace.lg - 2,
        vertical: DsSpace.md,
      ),
      child: Row(
        children: [
          const _PackGlyph(icon: Icons.layers_rounded),
          const SizedBox(width: DsSpace.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  merge.displayName,
                  style: DsType.bodyStrong,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: DsSpace.xxs),
                Text(humanSize(merge.size), style: DsType.caption),
              ],
            ),
          ),
          const SizedBox(width: DsSpace.sm),
          DsIconButton(
            icon: Icons.info_outline_rounded,
            size: 34,
            onPressed: onInfo,
          ),
          const SizedBox(width: DsSpace.xs),
          DsIconButton(
            icon: Icons.delete_outline_rounded,
            size: 34,
            color: DsColor.danger,
            onPressed: onDelete,
          ),
          const SizedBox(width: DsSpace.sm),
          DsButton(
            label: l.rpMergerUse,
            icon: Icons.play_arrow_rounded,
            size: DsButtonSize.small,
            busy: activating,
            onPressed: activating ? null : onActivate,
          ),
        ],
      ),
    );
  }
}

class _PackCard extends StatelessWidget {
  final _PackEntry pack;
  final int index;
  final int total;
  final String Function(int?) humanSize;
  final String topLabel;
  final VoidCallback onRemove;
  final VoidCallback onMoveUp;
  final VoidCallback onMoveDown;

  const _PackCard({
    required this.pack,
    required this.index,
    required this.total,
    required this.humanSize,
    required this.topLabel,
    required this.onRemove,
    required this.onMoveUp,
    required this.onMoveDown,
  });

  @override
  Widget build(BuildContext context) {
    final isTop = index == 0;
    return DsCard(
      highlighted: isTop,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DsSpace.lg - 2,
              vertical: DsSpace.md,
            ),
            child: Row(
              children: [
                _PackGlyph(icon: Icons.inventory_2_rounded, highlighted: isTop),
                const SizedBox(width: DsSpace.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        pack.name,
                        style: DsType.bodyStrong,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: DsSpace.xxs),
                      Row(
                        children: [
                          if (isTop) ...[
                            DsBadge(label: topLabel, color: DsColor.accent),
                            const SizedBox(width: DsSpace.sm - 2),
                          ],
                          Text(humanSize(pack.size), style: DsType.caption),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DsIconButton(
                      icon: Icons.keyboard_arrow_up_rounded,
                      size: 30,
                      onPressed: index > 0 ? onMoveUp : null,
                    ),
                    const SizedBox(height: DsSpace.xxs),
                    DsIconButton(
                      icon: Icons.keyboard_arrow_down_rounded,
                      size: 30,
                      onPressed: index < total - 1 ? onMoveDown : null,
                    ),
                  ],
                ),
                const SizedBox(width: DsSpace.sm - 2),
                DsIconButton(
                  icon: Icons.close_rounded,
                  size: 34,
                  color: DsColor.danger,
                  onPressed: onRemove,
                ),
              ],
            ),
          ),
          if (pack.hasBehaviorContent)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: DsSpace.lg - 2,
                vertical: DsSpace.sm,
              ),
              decoration: BoxDecoration(
                color: DsColor.warning.withValues(alpha: 0.08),
                border: Border(
                  top: BorderSide(
                    color: DsColor.warning.withValues(alpha: 0.2),
                  ),
                ),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(DsRadius.card - 1),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 14,
                    color: DsColor.warning,
                  ),
                  const SizedBox(width: DsSpace.sm),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.rpBehaviorContentWarning,
                      style: DsType.caption.copyWith(color: DsColor.warning),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
