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

enum _InputMode { upload, url, merge }

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
  _InputMode _mode = _InputMode.upload;

  String? _uploadedFilename;
  String? _uploadedUrl;
  bool _uploading = false;
  bool _isDragging = false;
  double _uploadProgress = 0;

  @override
  void initState() {
    super.initState();
    _load();
    _urlCtrl.addListener(_validateUrl);
  }

  Future<void> _load() async {
    final url = await ResourcePackPrefs.getUrl();
    final enabled = await ResourcePackPrefs.isEnabled();
    final filename = await ResourcePackPrefs.getFilename();
    final isUpload = await ResourcePackPrefs.isUpload();
    if (!mounted) return;
    setState(() {
      _enabled = enabled;
      _mode = isUpload ? _InputMode.upload : _InputMode.url;
      _uploadedFilename = filename;
      _uploadedUrl = (isUpload && url != null && url.isNotEmpty) ? url : null;
      if (!isUpload) _urlCtrl.text = url ?? '';
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
    final bytes = file.bytes ?? (file.path != null ? await File(file.path!).readAsBytes() : null);
    if (bytes == null) return;
    if (!isBedrockPack(bytes)) {
      if (!mounted) return;
      AppToast.show(context, message: AppLocalizations.of(context)!.rpInvalidPackFormat, icon: Icons.error_outline_rounded, color: Colors.red);
      return;
    }
    await _uploadBytes(bytes, file.name);
  }

  Future<void> _uploadBytes(Uint8List bytes, String name) async {
    setState(() { _uploading = true; _uploadProgress = 0; });
    try {
      final token = await AuthService.getIdToken();
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('${AppConstants.apiBase}/api/resource-pack/upload'),
      );
      if (token != null) request.headers['Authorization'] = 'Bearer $token';
      request.files.add(http.MultipartFile.fromBytes('pack', bytes, filename: name));

      final streamed = await request.send();
      final body = await streamed.stream.bytesToString();

      if (streamed.statusCode == 200) {
        final data = jsonDecode(body) as Map<String, dynamic>;
        final url = data['url'] as String;
        await ResourcePackPrefs.save(url: url, enabled: _enabled, filename: name, isUpload: true);
        if (!mounted) return;
        setState(() { _uploadedUrl = url; _uploadedFilename = name; _uploading = false; });
        AppToast.show(context, message: AppLocalizations.of(context)!.rpToastSaved, icon: Icons.check_rounded, color: AppTheme.accent);
      } else {
        if (!mounted) return;
        setState(() => _uploading = false);
        AppToast.show(context, message: 'Upload failed (${streamed.statusCode})', icon: Icons.error_outline_rounded, color: AppTheme.error);
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _uploading = false);
      AppToast.show(context, message: 'Upload failed: $e', icon: Icons.error_outline_rounded, color: AppTheme.error);
    }
  }

  Future<void> _deleteUpload() async {
    await ResourcePackPrefs.clear();
    if (!mounted) return;
    setState(() {
      _uploadedFilename = null;
      _uploadedUrl = null;
      _enabled = false;
    });
  }

  Future<void> _saveUrl() async {
    final url = _urlCtrl.text.trim();
    final l = AppLocalizations.of(context)!;
    if (_enabled && url.isEmpty) {
      AppToast.show(
        context,
        message: l.rpToastEnterUrl,
        icon: Icons.warning_rounded,
        color: AppTheme.warning,
      );
      return;
    }
    if (_enabled && _urlWarning != null) {
      AppToast.show(
        context,
        message: _urlWarning!,
        icon: Icons.warning_rounded,
        color: AppTheme.warning,
      );
      return;
    }
    await ResourcePackPrefs.save(url: url, enabled: _enabled, isUpload: false);
    if (!mounted) return;
    AppToast.show(
      context,
      message: l.rpToastSaved,
      icon: Icons.check_rounded,
      color: AppTheme.accent,
    );
    widget.onBack();
  }

  Future<void> _toggleEnabled(bool v) async {
    setState(() => _enabled = v);
    if (_mode == _InputMode.upload && _uploadedUrl != null) {
      await ResourcePackPrefs.save(
        url: _uploadedUrl,
        enabled: v,
        filename: _uploadedFilename,
        isUpload: true,
      );
    } else if (_mode == _InputMode.url) {
      final url = _urlCtrl.text.trim();
      if (url.isNotEmpty) {
        await ResourcePackPrefs.save(url: url, enabled: v, isUpload: false);
      }
    }
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

  @override
  void dispose() {
    _urlCtrl.removeListener(_validateUrl);
    _urlCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
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
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),

                        Text(
                          l.rpExplanation,
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 13,
                            height: 1.6,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceRaised,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppTheme.borderGray),
                          ),
                          padding: const EdgeInsets.all(3),
                          child: Row(
                            children: [
                              _Tab(
                                label: l.rpUploadTab,
                                icon: Icons.upload_rounded,
                                selected: _mode == _InputMode.upload,
                                onTap: () => setState(() => _mode = _InputMode.upload),
                              ),
                              _Tab(
                                label: l.rpUrlTab,
                                icon: Icons.link_rounded,
                                selected: _mode == _InputMode.url,
                                onTap: () => setState(() => _mode = _InputMode.url),
                              ),
                              _Tab(
                                label: l.rpMergerTitle,
                                icon: Icons.merge_rounded,
                                selected: _mode == _InputMode.merge,
                                onTap: () => setState(() => _mode = _InputMode.merge),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),

                        if (_mode == _InputMode.upload) _buildUploadSection(l),
                        if (_mode == _InputMode.url) _buildUrlSection(l),
                        Offstage(
                          offstage: _mode != _InputMode.merge,
                          child: RpMergerWidget(
                            key: const ValueKey('merger'),
                            onActivated: (url, filename) {
                              setState(() { _uploadedUrl = url; _uploadedFilename = filename; _mode = _InputMode.upload; });
                              AppToast.show(context, message: AppLocalizations.of(context)!.rpMergerSetActiveToast, icon: Icons.check_rounded, color: AppTheme.accent);
                            },
                          ),
                        ),

                        if (_mode != _InputMode.merge) ...[
                        const SizedBox(height: 16),

                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceRaised,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppTheme.borderGray),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 4,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                _enabled
                                    ? Icons.check_circle_rounded
                                    : Icons.radio_button_unchecked_rounded,
                                color: _enabled
                                    ? AppTheme.accent
                                    : AppTheme.textMuted,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  l.rpEnableToggle,
                                  style: TextStyle(
                                    color: AppTheme.textPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Switch(
                                value: _enabled,
                                onChanged: _toggleEnabled,
                              ),
                            ],
                          ),
                        ),
                        ],

                        if (_mode == _InputMode.url) ...[
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: _saveUrl,
                              icon: const Icon(Icons.save_rounded, size: 18),
                              label: Text(
                                l.save,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ),
                        ],

                        const SizedBox(height: 28),

                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceRaised,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppTheme.borderGray),
                          ),
                          child: Column(
                            children: [
                              _InfoRow(
                                icon: Icons.check_circle_outline_rounded,
                                iconColor: AppTheme.success,
                                label: l.rpWhatWorks,
                                onTap: () => _showDialog(
                                  context,
                                  l.rpWhatWorks,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _ModalBullet(
                                        title: l.rpSupportedBedrockOnly,
                                        hint: l.rpSupportedBedrockOnlyHint,
                                        ok: true,
                                      ),
                                      _ModalBullet(
                                        title: l.rpSupportedTexture,
                                        hint: l.rpSupportedTextureHint,
                                        ok: true,
                                      ),
                                      Divider(
                                        height: 20,
                                        color: AppTheme.borderGray,
                                      ),
                                      _ModalBullet(
                                        title: l.rpUnsupportedShaders,
                                        hint: l.rpUnsupportedShadersHint,
                                        ok: false,
                                      ),
                                      _ModalBullet(
                                        title: l.rpUnsupportedAddons,
                                        hint: l.rpUnsupportedAddonsHint,
                                        ok: false,
                                      ),
                                      Divider(
                                        height: 20,
                                        color: AppTheme.borderGray,
                                      ),
                                      _ModalBullet(
                                        title: l.rpNoDiscord,
                                        hint: l.rpNoDiscordHint,
                                        ok: false,
                                      ),
                                      _ModalBullet(
                                        title: l.rpNoDrive,
                                        hint: l.rpNoDriveHint,
                                        ok: false,
                                      ),
                                      _ModalBullet(
                                        title: l.rpNoEncrypted,
                                        hint: l.rpNoEncryptedHint,
                                        ok: false,
                                      ),
                                    ],
                                  ),
                                  icon: Icons.check_circle_outline_rounded,
                                  iconColor: AppTheme.success,
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: AppTheme.borderGray,
                                indent: 52,
                              ),
                              _InfoRow(
                                icon: Icons.speed_rounded,
                                iconColor: Colors.orangeAccent,
                                label: l.rpConsolePerformanceTitle,
                                onTap: () => _showDialog(
                                  context,
                                  l.rpConsolePerformanceTitle,
                                  Text(
                                    l.rpConsolePerformanceBody,
                                    style: TextStyle(
                                      color: AppTheme.textSecondary,
                                      fontSize: 14,
                                      height: 1.65,
                                    ),
                                  ),
                                  icon: Icons.speed_rounded,
                                  iconColor: Colors.orangeAccent,
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: AppTheme.borderGray,
                                indent: 52,
                              ),
                              _InfoRow(
                                icon: Icons.cleaning_services_rounded,
                                iconColor: AppTheme.info,
                                label: l.rpClearMinecraftTitle,
                                onTap: () => _showDialog(
                                  context,
                                  l.rpClearMinecraftTitle,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      _ModalStep(n: '1', text: l.rpClearStep1),
                                      _ModalStep(n: '2', text: l.rpClearStep2),
                                      _ModalStep(n: '3', text: l.rpClearStep3),
                                    ],
                                  ),
                                  icon: Icons.cleaning_services_rounded,
                                  iconColor: AppTheme.info,
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: AppTheme.borderGray,
                                indent: 52,
                              ),
                              _InfoRow(
                                icon: Icons.refresh_rounded,
                                iconColor: const Color(0xFF8B5CF6),
                                label: l.rpRelayTitle,
                                onTap: () => _showDialog(
                                  context,
                                  l.rpRelayTitle,
                                  Text(
                                    l.rpRelayBody,
                                    style: TextStyle(
                                      color: AppTheme.textSecondary,
                                      fontSize: 14,
                                      height: 1.65,
                                    ),
                                  ),
                                  icon: Icons.refresh_rounded,
                                  iconColor: const Color(0xFF8B5CF6),
                                ),
                              ),
                            ],
                          ),
                        ),

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

  Widget _buildUploadSection(AppLocalizations l) {
    if (_uploadedUrl != null && _uploadedFilename != null) {
      return _buildUploadedCard(l);
    }
    return _buildUploadButton(l);
  }

  Widget _buildUploadedCard(AppLocalizations l) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.accent.withValues(alpha: 0.4)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppTheme.accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.layers_rounded, color: AppTheme.accent, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _uploadedFilename!,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  'MCCompanion Cloud',
                  style: TextStyle(color: AppTheme.accent, fontSize: 11),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: _deleteUpload,
            icon: Icon(
              Icons.delete_outline_rounded,
              color: AppTheme.textMuted,
              size: 18,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
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
        if (!file.name.endsWith('.zip') && !file.name.endsWith('.mcpack')) return;
        _uploadFromPath(file.path, file.name);
      },
      child: GestureDetector(
        onTap: _uploading ? null : _pickAndUpload,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 28),
          decoration: BoxDecoration(
            color: active ? AppTheme.accent.withValues(alpha: 0.06) : AppTheme.surfaceRaised,
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
                    Text(l.rpUploading, style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      active ? Icons.file_download_rounded : Icons.upload_file_rounded,
                      color: active ? AppTheme.accent : AppTheme.textMuted,
                      size: 28,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      active ? 'Drop to upload' : l.rpUploadButton,
                      style: TextStyle(
                        color: active ? AppTheme.accent : AppTheme.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(l.rpUploadHint, style: TextStyle(color: AppTheme.textMuted, fontSize: 12)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildUrlSection(AppLocalizations l) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _urlCtrl,
          keyboardType: TextInputType.url,
          autocorrect: false,
          style: TextStyle(color: AppTheme.textPrimary, fontSize: 14),
          decoration: InputDecoration(
            hintText: l.rpPackUrlHint,
            prefixIcon: Icon(
              Icons.link_rounded,
              color: AppTheme.textMuted,
              size: 18,
            ),
          ),
        ),
        if (_urlWarning != null) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: AppTheme.warning.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppTheme.warning.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: AppTheme.warning,
                  size: 14,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _urlWarning!,
                    style: TextStyle(
                      color: AppTheme.warning,
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _Tab extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  const _Tab({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: selected
                ? AppTheme.accent.withValues(alpha: 0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: selected
                ? Border.all(color: AppTheme.accent.withValues(alpha: 0.35))
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 15,
                color: selected ? AppTheme.accent : AppTheme.textMuted,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: selected ? AppTheme.accent : AppTheme.textMuted,
                  fontSize: 13,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final VoidCallback onTap;
  const _InfoRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 16),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: AppTheme.textMuted,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class _ModalBullet extends StatelessWidget {
  final String title;
  final String hint;
  final bool ok;
  const _ModalBullet({
    required this.title,
    required this.hint,
    required this.ok,
  });

  @override
  Widget build(BuildContext context) {
    final color = ok ? AppTheme.success : AppTheme.error;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              ok ? Icons.check_rounded : Icons.close_rounded,
              color: color,
              size: 12,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  hint,
                  style: TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                    height: 1.4,
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

class _ModalStep extends StatelessWidget {
  final String n;
  final String text;
  const _ModalStep({required this.n, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppTheme.info.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              n,
              style: TextStyle(
                color: AppTheme.info,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                text,
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
