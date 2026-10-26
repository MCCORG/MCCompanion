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
import '../design/design.dart';
import '../layout/platform.dart';
import '../util/pack_file_picker.dart';
import '../util/resource_pack_prefs.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/components/swipe_back.dart';
import '../widgets/resource_pack/rp_active_pack_banner.dart';
import '../widgets/resource_pack/rp_featured_pack_card.dart';
import '../widgets/resource_pack/rp_category.dart';
import '../widgets/resource_pack/rp_filter_chip.dart';
import '../widgets/resource_pack/rp_info_section.dart';
import '../widgets/resource_pack/rp_tab_bar.dart';
import '../widgets/resource_pack/rp_tab_info_box.dart';
import '../theme/app_tokens.dart';

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
  bool _enabled = false;
  bool _loaded = false;
  RpInputMode _mode = RpInputMode.browse;

  String? _uploadedFilename;
  String? _uploadedUrl;
  bool _uploading = false;
  bool _isDragging = false;

  List<Map<String, dynamic>> _featuredPacks = [];
  bool _featuredLoading = false;
  bool _featuredError = false;
  String? _applyingPackId;

  String _featuredSearch = '';
  final List<String> _selectedTags = [];
  String? _selectedCategory;
  final _searchCtrl = TextEditingController();

  bool _hasPack = false;
  String? _activePackName;

  @override
  void initState() {
    super.initState();
    _load();
    _loadFeaturedPacks();
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
      _hasPack = hasPack;
      _activePackName = filename;
      _loaded = true;
    });
  }

  Future<void> _pickAndUpload() async {
    if (_uploading) return;
    setState(() => _uploading = true);
    try {
      final files = await pickPackFiles();
      if (files.isEmpty) {
        setState(() => _uploading = false);
        return;
      }
      final file = files.first;
      final bytes =
          file.bytes ??
          (file.path != null ? await File(file.path!).readAsBytes() : null);
      if (bytes == null) {
        setState(() => _uploading = false);
        return;
      }
      final inspection = inspectPackBytes(bytes);
      if (!mounted) return;
      if (inspection.format != PackFormat.bedrock) {
        setState(() => _uploading = false);
        AppToast.show(
          context,
          message: AppLocalizations.of(context)!.rpInvalidPackFormat,
          icon: Icons.error_outline_rounded,
          color: AppTheme.error,
        );
        return;
      }
      if (inspection.hasBehaviorContent) {
        AppToast.show(
          context,
          message: AppLocalizations.of(context)!.rpBehaviorContentWarning,
          icon: Icons.warning_amber_rounded,
          color: AppTheme.warning,
        );
      }
      await _uploadBytes(bytes, file.name);
    } catch (e) {
      if (mounted) setState(() => _uploading = false);
    }
  }

  Future<void> _uploadBytes(Uint8List bytes, String name) async {
    setState(() => _uploading = true);
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
    if (_uploading) return;
    setState(() => _uploading = true);
    final bytes = await File(path).readAsBytes();
    await _uploadBytes(bytes, name);
  }

  void _showDialog(
    BuildContext context,
    String title,
    Widget body, {
    IconData icon = Icons.info_rounded,
    Color iconColor = DsColor.info,
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
                        borderRadius: AppRadius.small,
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
      if (_selectedCategory != null && p['category'] != _selectedCategory) {
        return false;
      }
      if (_selectedTags.isEmpty) return true;
      final tags = (p['tags'] as List?)?.cast<String>() ?? [];
      return _selectedTags.every((t) => tags.contains(t));
    }).toList();
  }

  @override
  void dispose() {
    ResourcePackPrefs.revision.removeListener(_load);
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
          DsHeader(
            title: l.rpScreenTitle,
            leading: useClientLayout(context)
                ? null
                : DsIconButton(
                    icon: Icons.arrow_back_rounded,
                    size: 36,
                    onPressed: widget.onBack,
                  ),
          ),

          Expanded(
            child: !_loaded
                ? Center(
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.8,
                        color: DsColor.textFaint,
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DsSpace.gutter,
                    ),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: useClientLayout(context)
                              ? kDesktopContentWidth
                              : 720,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),

                            RpActivePackBanner(
                              name: _hasPack ? _activePackName : null,
                              enabled: _enabled,
                              onToggle: _hasPack ? _toggleEnabled : null,
                              onRemove:
                                  (_hasPack && _mode == RpInputMode.upload)
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
          ),
        ],
      ),
    );
  }

  Widget _buildBrowseSection() {
    final l = AppLocalizations.of(context)!;
    final tags = _allTags;
    final packs = _filteredPacks;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RpTabInfoBox(text: l.rpTabBrowseInfo),
        const SizedBox(height: DsSpace.lg),
        if (_featuredLoading)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: DsSpace.xxxl),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: DsColor.accent,
              ),
            ),
          )
        else if (_featuredError)
          DsCard(
            padding: EdgeInsets.zero,
            child: DsEmptyState(
              icon: Icons.cloud_off_rounded,
              title: l.rpLoadFailed,
              action: DsButton(
                label: l.rpRetry,
                icon: Icons.refresh_rounded,
                tone: DsButtonTone.neutral,
                size: DsButtonSize.small,
                onPressed: () {
                  setState(() => _featuredError = false);
                  _loadFeaturedPacks();
                },
              ),
            ),
          )
        else if (_featuredPacks.isEmpty)
          DsCard(
            padding: EdgeInsets.zero,
            child: DsEmptyState(
              icon: Icons.explore_off_rounded,
              title: l.rpBrowseEmpty,
              message: l.rpBrowseEmptyHint,
            ),
          )
        else ...[
          Text(l.rpBrowseSubtitle, style: DsType.caption),
          const SizedBox(height: DsSpace.md),
          DsField(
            controller: _searchCtrl,
            hint: l.rpSearchHint,
            icon: Icons.search_rounded,
            onChanged: (v) => setState(() => _featuredSearch = v),
          ),
          const SizedBox(height: DsSpace.md),
          DsHScroll(
            child: Row(
              children: [
                for (final cat in _kPackCategories) ...[
                  RpFilterChip(
                    label: rpCategoryLabel(l, cat),
                    color: DsColor.info,
                    selected: _selectedCategory == cat,
                    onTap: () => setState(
                      () => _selectedCategory = _selectedCategory == cat
                          ? null
                          : cat,
                    ),
                  ),
                  const SizedBox(width: DsSpace.sm - 2),
                ],
              ],
            ),
          ),
          if (tags.isNotEmpty) ...[
            const SizedBox(height: DsSpace.sm),
            DsHScroll(
              child: Row(
                children: [
                  for (final tag in tags) ...[
                    RpFilterChip(
                      label: tag,
                      color: DsColor.accent,
                      selected: _selectedTags.contains(tag),
                      onTap: () => setState(() {
                        if (!_selectedTags.remove(tag)) _selectedTags.add(tag);
                      }),
                    ),
                    const SizedBox(width: DsSpace.sm - 2),
                  ],
                ],
              ),
            ),
          ],
          const SizedBox(height: DsSpace.lg),
          LayoutBuilder(
            builder: (context, box) {
              final columns = (box.maxWidth / 520).floor().clamp(1, 4);
              const gap = DsSpace.md;
              final cardWidth = (box.maxWidth - gap * (columns - 1)) / columns;
              return Wrap(
                spacing: gap,
                children: [
                  for (final pack in packs)
                    SizedBox(
                      width: cardWidth,
                      child: RpFeaturedPackCard(
                        pack: pack,
                        isApplying: _applyingPackId == pack['id'].toString(),
                        onUse: () => _applyFeaturedPack(pack),
                      ),
                    ),
                ],
              );
            },
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
    return DsButton(
      label: _uploading ? l.rpUploading : l.rpReplaceFile,
      icon: Icons.swap_horiz_rounded,
      tone: DsButtonTone.neutral,
      expand: true,
      busy: _uploading,
      onPressed: _uploading ? null : _pickAndUpload,
    );
  }

  Widget _buildUploadButton(AppLocalizations l) {
    final active = _isDragging && !_uploading;
    final highlighted = active || _uploading;
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
        if (!file.name.endsWith('.zip') && !file.name.endsWith('.mcpack')) {
          return;
        }
        _uploadFromPath(file.path, file.name);
      },
      child: GestureDetector(
        onTap: _uploading ? null : _pickAndUpload,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: DsDuration.fast,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: DsSpace.xxl),
          decoration: BoxDecoration(
            color: active
                ? DsColor.accent.withValues(alpha: 0.08)
                : DsColor.surface,
            borderRadius: DsRadius.cardR,
            border: Border.all(
              color: highlighted
                  ? DsColor.accent.withValues(alpha: 0.6)
                  : DsColor.line,
              width: highlighted ? 1.5 : 1,
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
                        strokeWidth: 2.5,
                        color: DsColor.accent,
                      ),
                    ),
                    const SizedBox(height: DsSpace.md),
                    Text(l.rpUploading, style: DsType.label),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      active
                          ? Icons.file_download_rounded
                          : Icons.upload_file_rounded,
                      color: active ? DsColor.accent : DsColor.textFaint,
                      size: 32,
                    ),
                    const SizedBox(height: DsSpace.md),
                    Text(
                      active ? l.rpDropToUpload : l.rpUploadButton,
                      style: DsType.bodyStrong.copyWith(
                        color: active ? DsColor.accent : DsColor.text,
                      ),
                    ),
                    const SizedBox(height: DsSpace.xs),
                    Text(l.rpUploadHint, style: DsType.caption),
                  ],
                ),
        ),
      ),
    );
  }
}
