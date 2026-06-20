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
import '../util/pack_file_picker.dart';
import '../util/resource_pack_prefs.dart';
import '../widgets/components/app_toast.dart';

class _PackEntry {
  final String id;
  final String path;
  final String name;
  final int? size;
  _PackEntry({required this.id, required this.path, required this.name, required this.size});
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

  String get displayName => sourceNames.map((n) {
    final parts = n.split(' ');
    return parts.take(2).join(' ');
  }).join(' + ');

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
      if (mounted) setState(() { _saved.clear(); _saved.addAll(valid); });
    }
  }

  Future<void> _saveSavedState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kSavedKey, jsonEncode(_saved.map((m) => m.toJson()).toList()));
  }

  // Converts a SHA256 hex string to a UUID v4-formatted string.
  // The UUID is deterministic for the same content — same merge = same UUID.
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

  Future<void> _addPackFromPath(String path, {int? size}) async {
    if (_packs.length >= 4) return;
    String name = path.split('/').last.replaceAll(RegExp(r'\.(zip|mcpack)$', caseSensitive: false), '');
    try {
      final bytes = await File(path).readAsBytes();
      final archive = ZipDecoder().decodeBytes(bytes);
      for (final entry in archive) {
        if (entry.name == 'manifest.json' || entry.name.endsWith('/manifest.json')) {
          final json = jsonDecode(utf8.decode(entry.content as List<int>));
          final n = json['header']?['name'] ?? json['name'];
          if (n is String && n.isNotEmpty) { name = n; break; }
        }
      }
    } catch (_) {}
    setState(() => _packs.add(_PackEntry(id: UniqueKey().toString(), path: path, name: name, size: size)));
  }

  Future<void> _addPackFromBytes(List<int> bytes, {required String name, int? size}) async {
    if (_packs.length >= 4) return;
    String displayName = name.replaceAll(RegExp(r'\.(zip|mcpack)$', caseSensitive: false), '');
    final tmp = await getTemporaryDirectory();
    final safeName = name.replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '_');
    final unique = '${DateTime.now().millisecondsSinceEpoch}_$safeName';
    final tmpFile = File('${tmp.path}/$unique');
    await tmpFile.writeAsBytes(bytes);
    try {
      final archive = ZipDecoder().decodeBytes(bytes);
      for (final entry in archive) {
        if (entry.name == 'manifest.json' || entry.name.endsWith('/manifest.json')) {
          final json = jsonDecode(utf8.decode(entry.content as List<int>));
          final n = json['header']?['name'] ?? json['name'];
          if (n is String && n.isNotEmpty) { displayName = n; break; }
        }
      }
    } catch (_) {}
    setState(() => _packs.add(_PackEntry(id: UniqueKey().toString(), path: tmpFile.path, name: displayName, size: size)));
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
    setState(() { _packs.removeWhere((p) => p.id == id); _error = null; });
  }

  void _moveUp(int i) {
    if (i == 0) return;
    setState(() { final t = _packs[i]; _packs[i] = _packs[i - 1]; _packs[i - 1] = t; });
  }

  void _moveDown(int i) {
    if (i == _packs.length - 1) return;
    setState(() { final t = _packs[i]; _packs[i] = _packs[i + 1]; _packs[i + 1] = t; });
  }

  Future<void> _merge() async {
    if (_packs.length < 2) return;
    setState(() { _merging = true; _error = null; });

    try {
      final merged = <String, List<int>>{};
      for (int i = _packs.length - 1; i >= 0; i--) {
        final bytes = await File(_packs[i].path).readAsBytes();
        final archive = ZipDecoder().decodeBytes(bytes);
        for (final entry in archive) {
          if (entry.isFile) merged[entry.name] = entry.content as List<int>;
        }
      }

      // Rewrite manifest.json with a deterministic UUID derived from content hash
      // so every unique merge combination gets its own UUID — prevents Minecraft
      // from caching a stale pack when the same UUID appears with different content.
      final manifestKey = merged.keys.firstWhere(
        (k) => k == 'manifest.json' || k.endsWith('/manifest.json'),
        orElse: () => '',
      );
      if (manifestKey.isNotEmpty) {
        try {
          final manifestJson = jsonDecode(utf8.decode(merged[manifestKey]!)) as Map<String, dynamic>;
          final contentHash = sha256.convert(
            merged.values.expand((b) => b).toList(),
          ).toString();
          final newUuid = _hashToUuid(contentHash);
          final header = manifestJson['header'] as Map<String, dynamic>? ?? {};
          header['uuid'] = newUuid;
          manifestJson['header'] = header;
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
          .map((p) => p.name.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_').replaceAll(RegExp(r'_+'), '_').replaceAll(RegExp(r'^_|_$'), '').substring(0, p.name.length.clamp(0, 20)))
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
      setState(() { _saved.insert(0, savedMerge); _merging = false; });
      _saveSavedState();
    } catch (e) {
      if (!mounted) return;
      setState(() { _error = e.toString(); _merging = false; });
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
      request.files.add(await http.MultipartFile.fromPath('pack', merge.path, filename: merge.filename));

      final streamed = await request.send();
      final body = await streamed.stream.bytesToString();

      if (streamed.statusCode == 200) {
        final data = jsonDecode(body) as Map<String, dynamic>;
        final url = data['url'] as String;
        await ResourcePackPrefs.save(url: url, enabled: true, filename: merge.filename, isUpload: true);
        if (!mounted) return;
        setState(() => _activatingId = null);
        widget.onActivated(url, merge.filename);
      } else {
        throw Exception('Upload failed (${streamed.statusCode})');
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _activatingId = null);
      if (mounted) AppToast.show(context, message: e.toString(), icon: Icons.error_outline_rounded, color: AppTheme.error);
    }
  }

  void _deleteSaved(String id) async {
    final merge = _saved.firstWhere((m) => m.id == id);
    setState(() => _saved.removeWhere((m) => m.id == id));
    _saveSavedState();
    try { await File(merge.path).delete(); } catch (_) {}
  }

  void _showInfo(BuildContext context, _SavedMerge merge) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (ctx) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Icon(Icons.inventory_2_rounded, size: 18, color: AppTheme.accent),
                  const SizedBox(width: 8),
                  Expanded(child: Text(merge.displayName, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: AppTheme.textPrimary))),
                  GestureDetector(onTap: () => Navigator.pop(ctx), child: Icon(Icons.close_rounded, size: 20, color: AppTheme.textMuted)),
                ]),
                const SizedBox(height: 16),
                _InfoRow(label: 'Size', value: _humanSize(merge.size)),
                _InfoRow(label: 'Created', value: _formatDate(merge.createdAt)),
                const SizedBox(height: 12),
                Text('Source packs', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textMuted)),
                const SizedBox(height: 8),
                ...merge.sourceNames.asMap().entries.map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(children: [
                    Container(
                      width: 20, height: 20,
                      decoration: BoxDecoration(
                        color: e.key == 0 ? AppTheme.accent.withValues(alpha: 0.12) : AppTheme.surfaceRaised,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: e.key == 0 ? AppTheme.accent.withValues(alpha: 0.3) : AppTheme.borderGray),
                      ),
                      child: Center(child: Text('${e.key + 1}', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: e.key == 0 ? AppTheme.accent : AppTheme.textMuted))),
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(e.value, style: TextStyle(fontSize: 13, color: AppTheme.textPrimary))),
                    if (e.key == 0) Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                      decoration: BoxDecoration(color: AppTheme.accent.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                      child: Text('TOP', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: AppTheme.accent)),
                    ),
                  ]),
                )),
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.borderGray),
          ),
          child: Row(children: [
            Icon(Icons.info_outline_rounded, size: 15, color: AppTheme.textMuted),
            const SizedBox(width: 8),
            Expanded(child: Text(l.rpMergerPriorityHint, style: TextStyle(fontSize: 12, color: AppTheme.textSecondary))),
          ]),
        ),
        const SizedBox(height: 14),

        ..._packs.asMap().entries.map((e) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: _PackCard(
            pack: e.value, index: e.key, total: _packs.length,
            humanSize: _humanSize, topLabel: l.rpMergerTopBadge,
            onRemove: () => _remove(e.value.id),
            onMoveUp: () => _moveUp(e.key),
            onMoveDown: () => _moveDown(e.key),
          ),
        )),

        if (_packs.length < 4)
          DropTarget(
            onDragEntered: (_) => setState(() => _isDragging = true),
            onDragExited: (_) => setState(() => _isDragging = false),
            onDragDone: (detail) async {
              setState(() => _isDragging = false);
              for (final f in detail.files) {
                if (_packs.length >= 4) break;
                if (!f.name.endsWith('.zip') && !f.name.endsWith('.mcpack')) continue;
                await _addPackFromPath(f.path);
              }
            },
            child: GestureDetector(
              onTap: _pickPack,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: _isDragging ? AppTheme.accent.withValues(alpha: 0.06) : AppTheme.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: _isDragging ? AppTheme.accent.withValues(alpha: 0.6) : AppTheme.borderGray,
                    width: _isDragging ? 1.5 : 1,
                  ),
                ),
                child: Column(children: [
                  Icon(_isDragging ? Icons.file_download_rounded : Icons.add_rounded, size: 28, color: _isDragging ? AppTheme.accent : AppTheme.textMuted),
                  const SizedBox(height: 6),
                  Text(
                    _isDragging ? 'Drop to add' : _packs.isEmpty ? l.rpMergerAddPacks : l.rpMergerAddAnother(_packs.length),
                    style: TextStyle(fontSize: 13, color: _isDragging ? AppTheme.accent : AppTheme.textMuted, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(l.rpMergerFileTypes, style: TextStyle(fontSize: 11, color: AppTheme.textDisabled)),
                ]),
              ),
            ),
          ),

        if (_error != null) ...[
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.error.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.error.withValues(alpha: 0.25)),
            ),
            child: Text(_error!, style: TextStyle(fontSize: 12, color: AppTheme.error)),
          ),
        ],

        if (_packs.length >= 2) ...[
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: canMerge ? _merge : null,
              icon: _merging
                  ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                  : const Icon(Icons.merge_rounded, size: 18),
              label: Text(_merging ? l.rpMergerMerging : l.rpMergerButton(_packs.length)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.accent,
                foregroundColor: Colors.black,
                disabledBackgroundColor: AppTheme.surfaceRaised,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
                textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],

        if (_saved.isNotEmpty) ...[
          const SizedBox(height: 28),
          Text('Saved merges', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppTheme.textMuted)),
          const SizedBox(height: 10),
          ..._saved.map((merge) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _SavedMergeCard(
              merge: merge,
              humanSize: _humanSize,
              activating: _activatingId == merge.id,
              onInfo: () => _showInfo(context, merge),
              onDelete: () => _deleteSaved(merge.id),
              onActivate: () => _activate(merge),
            ),
          )),
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
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(children: [
        Text(label, style: TextStyle(fontSize: 12, color: AppTheme.textMuted)),
        const SizedBox(width: 8),
        Text(value, style: TextStyle(fontSize: 12, color: AppTheme.textPrimary, fontWeight: FontWeight.w600)),
      ]),
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
    required this.merge, required this.humanSize, required this.activating,
    required this.onInfo, required this.onDelete, required this.onActivate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.borderGray),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(children: [
        Container(
          width: 40, height: 40,
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.borderGray),
          ),
          child: Icon(Icons.layers_rounded, size: 18, color: AppTheme.textMuted),
        ),
        const SizedBox(width: 12),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(merge.displayName, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppTheme.textPrimary), maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 2),
            Text('${merge.sourceNames.length} packs · ${humanSize(merge.size)}', style: TextStyle(fontSize: 11, color: AppTheme.textMuted)),
          ],
        )),
        const SizedBox(width: 8),
        _ActionBtn(icon: Icons.info_outline_rounded, onTap: onInfo),
        const SizedBox(width: 6),
        _ActionBtn(icon: Icons.delete_outline_rounded, onTap: onDelete, color: AppTheme.error),
        const SizedBox(width: 6),
        GestureDetector(
          onTap: activating ? null : onActivate,
          child: Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: activating ? AppTheme.surfaceRaised : AppTheme.accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: activating ? AppTheme.borderGray : AppTheme.accent.withValues(alpha: 0.3)),
            ),
            child: activating
                ? SizedBox(width: 52, height: 32, child: Center(child: SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: AppTheme.accent))))
                : Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(Icons.play_arrow_rounded, size: 15, color: AppTheme.accent),
                    const SizedBox(width: 4),
                    Text('Use', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppTheme.accent)),
                  ]),
          ),
        ),
      ]),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;
  const _ActionBtn({required this.icon, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32, height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Icon(icon, size: 16, color: color ?? AppTheme.textSecondary),
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
    required this.pack, required this.index, required this.total,
    required this.humanSize, required this.topLabel, required this.onRemove,
    required this.onMoveUp, required this.onMoveDown,
  });

  @override
  Widget build(BuildContext context) {
    final isTop = index == 0;
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: isTop ? AppTheme.accent.withValues(alpha: 0.30) : AppTheme.borderGray),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              color: isTop ? AppTheme.accent.withValues(alpha: 0.12) : AppTheme.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isTop ? AppTheme.accent.withValues(alpha: 0.25) : AppTheme.borderGray),
            ),
            child: Icon(Icons.inventory_2_rounded, size: 18, color: isTop ? AppTheme.accent : AppTheme.textMuted),
          ),
          const SizedBox(width: 12),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pack.name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppTheme.textPrimary), maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              Row(children: [
                if (isTop) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(color: AppTheme.accent.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(5)),
                    child: Text(topLabel, style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: AppTheme.accent, letterSpacing: 0.8)),
                  ),
                  const SizedBox(width: 6),
                ],
                Text(humanSize(pack.size), style: TextStyle(fontSize: 11, color: AppTheme.textMuted)),
              ]),
            ],
          )),
          Column(children: [
            _SmallBtn(icon: Icons.keyboard_arrow_up_rounded, enabled: index > 0, onTap: onMoveUp),
            const SizedBox(height: 2),
            _SmallBtn(icon: Icons.keyboard_arrow_down_rounded, enabled: index < total - 1, onTap: onMoveDown),
          ]),
          const SizedBox(width: 6),
          _SmallBtn(icon: Icons.close_rounded, enabled: true, onTap: onRemove, color: AppTheme.error),
        ]),
      ),
    );
  }
}

class _SmallBtn extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;
  final Color? color;
  const _SmallBtn({required this.icon, required this.enabled, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 28, height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: enabled ? AppTheme.borderGray : AppTheme.borderGray.withValues(alpha: 0.3)),
        ),
        child: Icon(icon, size: 16, color: enabled ? (color ?? AppTheme.textSecondary) : AppTheme.textDisabled),
      ),
    );
  }
}
