import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import 'rp_merger_screen.dart';
import '../l10n/app_localizations.dart';
import '../services/auth_service.dart';
import '../theme/app_theme.dart';
import '../util/pack_file_picker.dart';
import '../util/resource_pack_prefs.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/components/swipe_back.dart';
import '../widgets/resource_pack/rp_active_pack_banner.dart';
import '../widgets/resource_pack/rp_featured_pack_card.dart';
import '../widgets/resource_pack/rp_info_section.dart';
import '../widgets/resource_pack/rp_tab_bar.dart';
import '../widgets/resource_pack/rp_tab_info_box.dart';

const _kPackCategories = [
  'realism',
  'faithful',
  'pvp',
  'cartoon',
  'dark',
  'medieval',
  'nature',
  'themed',
  'other',
];

class ResourcePackScreen extends StatefulWidget {
  final VoidCallback onBack;
  const ResourcePackScreen({super.key, required this.onBack});

  @override
  State<ResourcePackScreen> createState() => _ResourcePackScreenState();
}

class _ResourcePackScreenState extends State<ResourcePackScreen> {
  final _urlCtrl = TextEditingController();
  bool _enabled = false;
  bool _loaded = false;
  String? _urlWarning;
  RpInputMode _mode = RpInputMode.browse;

  String? _uploadedFilename;
  String? _uploadedUrl;
  bool _uploading = false;
  bool _isDragging = false;
  double _uploadProgress = 0;

  List<Map<String, dynamic>> _featuredPacks = [];
  bool _featuredLoading = false;
  bool _featuredError = false;
  String? _applyingPackId;

  String _featuredSearch = '';
  List<String> _selectedTags = [];
  String? _selectedCategory;
  final _searchCtrl = TextEditingController();

  bool _hasPack = false;
  String? _activePackName;

  @override
  void initState() {
    super.initState();
    _load();
    _loadFeaturedPacks();
    _urlCtrl.addListener(_validateUrl);
    ResourcePackPrefs.revision.addListener(_load);
  }

  Future<void> _loadFeaturedPacks() async {
    if (_featuredLoading) return;
    setState(() => _featuredLoading = true);
    try {
      final res = await http
          .get(Uri.parse('${AppConstants.apiBase}/api/featured-packs'))
          .timeout(const Duration(seconds: 10));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body) as Map<String, dynamic>;
        final list = (data['packs'] as List).cast<Map<String, dynamic>>();
        if (mounted) setState(() => _featuredPacks = list);
      }
    } catch (_) {
      if (mounted) setState(() => _featuredError = true);
    }
    if (mounted) setState(() => _featuredLoading = false);
  }

  Future<void> _applyFeaturedPack(Map<String, dynamic> pack) async {
    final id = pack['id'].toString();
    final url = pack['downloadUrl'] as String;
    final name = pack['name'] as String;
    setState(() => _applyingPackId = id);
    await ResourcePackPrefs.save(
      url: url,
      enabled: true,
      filename: '$name.mcpack',
      isUpload: false,
    );
    if (!mounted) return;
    setState(() {
      _applyingPackId = null;
      _enabled = true;
      _hasPack = true;
      _activePackName = name;
      _urlCtrl.text = url;
    });
    AppToast.show(
      context,
      message: AppLocalizations.of(context)!.rpToastSaved,
      icon: Icons.check_rounded,
      color: AppTheme.accent,
    );
    _loadFeaturedPacks();
  }

  Future<void> _load() async {
    final url = await ResourcePackPrefs.getUrl();
    final enabled = await ResourcePackPrefs.isEnabled();
    final filename = await ResourcePackPrefs.getFilename();
    final isUpload = await ResourcePackPrefs.isUpload();
    if (!mounted) return;
    final hasPack = url != null && url.isNotEmpty;
    setState(() {
      _enabled = enabled;
      _uploadedFilename = filename;
      _uploadedUrl = (isUpload && url != null && url.isNotEmpty) ? url : null;
      if (!isUpload) _urlCtrl.text = url ?? '';
      _hasPack = hasPack;
      _activePackName = filename;
      _loaded = true;
    });
    _validateUrl();
  }

  void _validateUrl() {
    final url = _urlCtrl.text.trim();
    final l = AppLocalizations.of(context);
    String? warning;
    if (url.isNotEmpty && l != null) {
      if (url.contains('cdn.discordapp.com') ||
          url.contains('media.discordapp.net')) {
        warning = l.rpWarnDiscord;
      } else if (!url.startsWith('https://')) {
        warning = l.rpWarnHttps;
      } else if (!url.endsWith('.mcpack') && !url.endsWith('.zip')) {
        warning = l.rpWarnExtension;
      }
    }
    if (warning != _urlWarning) setState(() => _urlWarning = warning);
  }

  Future<void> _pickAndUpload() async {
    if (_uploading) return;
    final files = await pickPackFiles();
    if (files.isEmpty) return;
    final file = files.first;
    final bytes =
        file.bytes ??
        (file.path != null ? await File(file.path!).readAsBytes() : null);
    if (bytes == null) return;
    final inspection = inspectPackBytes(bytes);
    if (!mounted) return;
    if (inspection.format != PackFormat.bedrock) {
      AppToast.show(
        context,
        message: AppLocalizations.of(context)!.rpInvalidPackFormat,
        icon: Icons.error_outline_rounded,
        color: Colors.red,
      );
      return;
    }
    if (inspection.hasBehaviorContent) {
      AppToast.show(
        context,
        message: AppLocalizations.of(context)!.rpBehaviorContentWarning,
        icon: Icons.warning_amber_rounded,
        color: Colors.orange,
      );
    }
    await _uploadBytes(bytes, file.name);
  }

  Future<void> _uploadBytes(Uint8List bytes, String name) async {
    setState(() {
      _uploading = true;
      _uploadProgress = 0;
    });
    try {
      final token = await AuthService.getIdToken();
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('${AppConstants.apiBase}/api/resource-pack/upload'),
      );
      if (token != null) request.headers['Authorization'] = 'Bearer $token';
      request.files.add(
        http.MultipartFile.fromBytes('pack', bytes, filename: name),
      );

      final streamed = await request.send();
      final body = await streamed.stream.bytesToString();

      if (streamed.statusCode == 200) {
        final data = jsonDecode(body) as Map<String, dynamic>;
        final url = data['url'] as String;
        await ResourcePackPrefs.save(
          url: url,
          enabled: _enabled,
          filename: name,
          isUpload: true,
        );
        if (!mounted) return;
        setState(() {
          _uploadedUrl = url;
          _uploadedFilename = name;
          _hasPack = true;
          _activePackName = name;
          _uploading = false;
        });
        AppToast.show(
          context,
          message: AppLocalizations.of(context)!.rpToastSaved,
          icon: Icons.check_rounded,
          color: AppTheme.accent,
        );
        final l = AppLocalizations.of(context)!;
        _showDialog(
          context,
          l.rpClearMinecraftTitle,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l.rpClearWhy,
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 16),
              RpModalStep(n: '1', text: l.rpClearStep1),
              RpModalStep(n: '2', text: l.rpClearStep2),
              RpModalStep(n: '3', text: l.rpClearStep3),
            ],
          ),
          icon: Icons.cleaning_services_rounded,
          iconColor: AppTheme.info,
        );
      } else {
        if (!mounted) return;
        setState(() => _uploading = false);
        AppToast.show(
          context,
          message: AppLocalizations.of(
            context,
          )!.rpUploadFailedCode(streamed.statusCode),
          icon: Icons.error_outline_rounded,
          color: AppTheme.error,
        );
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _uploading = false);
      AppToast.show(
        context,
        message: AppLocalizations.of(context)!.rpUploadFailed(e.toString()),
        icon: Icons.error_outline_rounded,
        color: AppTheme.error,
      );
    }
  }

  Future<void> _deleteUpload() async {
    await ResourcePackPrefs.clear();
    if (!mounted) return;
    setState(() {
      _uploadedFilename = null;
      _uploadedUrl = null;
      _enabled = false;
      _hasPack = false;
      _activePackName = null;
    });
  }

  Future<void> _toggleEnabled(bool v) async {
    setState(() => _enabled = v);
    await ResourcePackPrefs.setEnabled(v);
  }

  Future<void> _uploadFromPath(String path, String name) async {
    final bytes = await File(path).readAsBytes();
    await _uploadBytes(bytes, name);
  }

  void _showDialog(
    BuildContext context,
    String title,
    Widget body, {
    IconData icon = Icons.info_rounded,
    Color iconColor = const Color(0xFF60A5FA),
  }) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.65),
      builder: (ctx) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 12, 16),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.08),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: iconColor.withValues(alpha: 0.18),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: iconColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(icon, color: iconColor, size: 18),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      icon: Icon(
                        Icons.close_rounded,
                        color: AppTheme.textMuted,
                        size: 18,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 22),
                child: body,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> get _allTags {
    final tags = <String>{};
    for (final p in _featuredPacks) {
      final t = p['tags'];
      if (t is List) tags.addAll(t.cast<String>());
    }
    return tags.toList()..sort();
  }

  List<Map<String, dynamic>> get _filteredPacks {
    final q = _featuredSearch.toLowerCase();
    return _featuredPacks.where((p) {
      final name = (p['name'] as String? ?? '').toLowerCase();
      final desc = (p['description'] as String? ?? '').toLowerCase();
      final matchesSearch = q.isEmpty || name.contains(q) || desc.contains(q);
      if (!matchesSearch) return false;
      if (_selectedCategory != null && p['category'] != _selectedCategory)
        return false;
      if (_selectedTags.isEmpty) return true;
      final tags = (p['tags'] as List?)?.cast<String>() ?? [];
      return _selectedTags.every((t) => tags.contains(t));
    }).toList();
  }

  @override
  void dispose() {
    ResourcePackPrefs.revision.removeListener(_load);
    _urlCtrl.removeListener(_validateUrl);
    _urlCtrl.dispose();
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final showControls =
        _mode == RpInputMode.upload || _mode == RpInputMode.browse;

    return SwipeBack(
      onBack: widget.onBack,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppTheme.surface,
              border: Border(
                bottom: BorderSide(color: AppTheme.borderGray, width: 0.5),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: AppTheme.textSecondary,
                    size: 18,
                  ),
                  onPressed: widget.onBack,
                ),
                Expanded(
                  child: Text(
                    l.rpScreenTitle,
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: !_loaded
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppTheme.accent,
                    ),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 720),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),

                          RpActivePackBanner(
                            name: _hasPack ? _activePackName : null,
                            enabled: _enabled,
                            onToggle: _hasPack ? _toggleEnabled : null,
                            onRemove: (_hasPack && _mode == RpInputMode.upload)
                                ? _deleteUpload
                                : null,
                          ),
                          const SizedBox(height: 16),

                          RpTabBar(
                            mode: _mode,
                            onSelect: (m) => setState(() => _mode = m),
                          ),
                          const SizedBox(height: 16),

                          if (_mode == RpInputMode.browse)
                            _buildBrowseSection(),
                          if (_mode == RpInputMode.upload)
                            _buildUploadSection(l),
                          if (_mode == RpInputMode.merge) ...[
                            RpTabInfoBox(text: l.rpTabMergeInfo),
                            const SizedBox(height: 16),
                          ],
                          Offstage(
                            offstage: _mode != RpInputMode.merge,
                            child: RpMergerWidget(
                              key: const ValueKey('merger'),
                              onActivated: (url, filename) {
                                setState(() {
                                  _uploadedUrl = url;
                                  _uploadedFilename = filename;
                                  _hasPack = true;
                                  _activePackName = filename;
                                  _mode = RpInputMode.upload;
                                });
                                AppToast.show(
                                  context,
                                  message: AppLocalizations.of(
                                    context,
                                  )!.rpMergerSetActiveToast,
                                  icon: Icons.check_rounded,
                                  color: AppTheme.accent,
                                );
                              },
                            ),
                          ),

                          if (showControls) ...[
                            const SizedBox(height: 28),
                            RpInfoSection(showDialog: _showDialog),
                          ],

                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrowseSection() {
    final l = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RpTabInfoBox(text: l.rpTabBrowseInfo),
        const SizedBox(height: 16),
        if (_featuredLoading)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppTheme.accent,
              ),
            ),
          )
        else if (_featuredError)
          Center(
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.rpLoadFailed,
                  style: TextStyle(color: AppTheme.textMuted),
                ),
                TextButton(
                  onPressed: () {
                    setState(() => _featuredError = false);
                    _loadFeaturedPacks();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.rpRetry,
                    style: TextStyle(color: AppTheme.accent),
                  ),
                ),
              ],
            ),
          )
        else if (_featuredPacks.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: Column(
              children: [
                Icon(
                  Icons.explore_off_rounded,
                  color: AppTheme.textMuted,
                  size: 40,
                ),
                const SizedBox(height: 12),
                Text(
                  l.rpBrowseEmpty,
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  l.rpBrowseEmptyHint,
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                ),
              ],
            ),
          )
        else ...[
          Text(
            l.rpBrowseSubtitle,
            style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _searchCtrl,
            onChanged: (v) => setState(() => _featuredSearch = v),
            style: TextStyle(color: AppTheme.textPrimary, fontSize: 14),
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.rpSearchHint,
              prefixIcon: Icon(
                Icons.search_rounded,
                color: AppTheme.textMuted,
                size: 18,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: _kPackCategories.map((cat) {
              final selected = _selectedCategory == cat;
              return GestureDetector(
                onTap: () =>
                    setState(() => _selectedCategory = selected ? null : cat),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: selected
                        ? const Color(0xFF60a5fa)
                        : const Color(0xFF60a5fa).withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: const Color(
                        0xFF60a5fa,
                      ).withValues(alpha: selected ? 1.0 : 0.22),
                    ),
                  ),
                  child: Text(
                    cat,
                    style: TextStyle(
                      color: selected
                          ? AppTheme.surfaceRaised
                          : const Color(0xFF60a5fa),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          if (_allTags.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: _allTags.map((tag) {
                final selected = _selectedTags.contains(tag);
                return GestureDetector(
                  onTap: () => setState(() {
                    if (selected) {
                      _selectedTags.remove(tag);
                    } else {
                      _selectedTags.add(tag);
                    }
                  }),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? AppTheme.accent
                          : AppTheme.accent.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: AppTheme.accent.withValues(
                          alpha: selected ? 1.0 : 0.22,
                        ),
                      ),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        color: selected
                            ? AppTheme.surfaceRaised
                            : AppTheme.accent,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
          const SizedBox(height: 12),
          ..._filteredPacks.map(
            (pack) => RpFeaturedPackCard(
              pack: pack,
              isApplying: _applyingPackId == pack['id'].toString(),
              onUse: () => _applyFeaturedPack(pack),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildUploadSection(AppLocalizations l) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RpTabInfoBox(text: l.rpTabUploadInfo),
        const SizedBox(height: 16),
        if (_uploading)
          _buildUploadButton(l)
        else if (_uploadedUrl != null && _uploadedFilename != null)
          _buildReplaceHint(l)
        else
          _buildUploadButton(l),
      ],
    );
  }

  Widget _buildReplaceHint(AppLocalizations l) {
    return GestureDetector(
      onTap: _uploading ? null : _pickAndUpload,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: AppTheme.surfaceRaised,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _uploading
                ? AppTheme.accent.withValues(alpha: 0.5)
                : AppTheme.borderGray,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_uploading) ...[
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppTheme.accent,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                l.rpUploading,
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ] else ...[
              Icon(
                Icons.swap_horiz_rounded,
                color: AppTheme.textMuted,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                l.rpReplaceFile,
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildUploadButton(AppLocalizations l) {
    final active = _isDragging && !_uploading;
    return DropTarget(
      onDragEntered: (_) => setState(() => _isDragging = true),
      onDragExited: (_) => setState(() => _isDragging = false),
      onDragDone: (detail) {
        setState(() => _isDragging = false);
        if (_uploading) return;
        final file = detail.files.firstWhere(
          (f) => f.name.endsWith('.zip') || f.name.endsWith('.mcpack'),
          orElse: () => detail.files.first,
        );
        if (!file.name.endsWith('.zip') && !file.name.endsWith('.mcpack'))
          return;
        _uploadFromPath(file.path, file.name);
      },
      child: GestureDetector(
        onTap: _uploading ? null : _pickAndUpload,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 32),
          decoration: BoxDecoration(
            color: active
                ? AppTheme.accent.withValues(alpha: 0.06)
                : AppTheme.surfaceRaised,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: active
                  ? AppTheme.accent.withValues(alpha: 0.6)
                  : _uploading
                  ? AppTheme.accent.withValues(alpha: 0.5)
                  : AppTheme.borderGray,
              width: active || _uploading ? 1.5 : 1,
            ),
          ),
          child: _uploading
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        value: _uploadProgress > 0 ? _uploadProgress : null,
                        strokeWidth: 2.5,
                        color: AppTheme.accent,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      l.rpUploading,
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      active
                          ? Icons.file_download_rounded
                          : Icons.upload_file_rounded,
                      color: active ? AppTheme.accent : AppTheme.textMuted,
                      size: 32,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      active ? l.rpDropToUpload : l.rpUploadButton,
                      style: TextStyle(
                        color: active ? AppTheme.accent : AppTheme.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      l.rpUploadHint,
                      style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
