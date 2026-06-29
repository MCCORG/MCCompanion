import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../theme/app_theme.dart';
import '../../l10n/app_localizations.dart';
import '../../models/saved_skin.dart';
import '../../screens/public_profile_screen.dart';
import '../../constants/app_constants.dart';
import '../../widgets/components/app_toast.dart';
import 'skin_painters.dart';

Future<void> shareTextureFile(BuildContext context, String url, String name) async {
  try {
    final resp = await http.get(Uri.parse(url), headers: {'User-Agent': 'MCCompanionApp/1.0'})
        .timeout(const Duration(seconds: 10));
    if (resp.statusCode != 200) return;
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$name.png');
    await file.writeAsBytes(resp.bodyBytes);
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      final saveDir = await getApplicationDocumentsDirectory();
      final dest = File('${saveDir.path}/$name.png');
      await file.copy(dest.path);
      if (context.mounted) {
        AppToast.show(context, message: AppLocalizations.of(context)!.skinSavedToDocuments, icon: Icons.download_done_rounded, color: AppTheme.success);
      }
    } else {
      final size = MediaQuery.of(context).size;
      await Share.shareXFiles(
        [XFile(file.path, mimeType: 'image/png')],
        subject: AppLocalizations.of(context)!.skinMenuExport,
        sharePositionOrigin: Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: 1,
          height: 1,
        ),
      );
    }
  } catch (_) {}
}

class GallerySkinPreviewSheet extends StatefulWidget {
  final Map<String, dynamic> skin;
  final String? idToken;
  final bool initialLiked;
  final bool isOwn;
  final VoidCallback? onEdit;
  final VoidCallback? onDownload;
  final VoidCallback? onDelete;

  const GallerySkinPreviewSheet({
    super.key,
    required this.skin,
    this.idToken,
    this.initialLiked = false,
    this.isOwn = false,
    this.onEdit,
    this.onDownload,
    this.onDelete,
  });

  @override
  State<GallerySkinPreviewSheet> createState() => _GallerySkinPreviewSheetState();
}

class _GallerySkinPreviewSheetState extends State<GallerySkinPreviewSheet> {
  late bool _liked;
  late int _likes;
  bool _liking = false;

  @override
  void initState() {
    super.initState();
    _liked = widget.initialLiked;
    _likes = (widget.skin['like_count'] as num?)?.toInt() ?? 0;
  }

  Future<void> _toggleLike() async {
    if (_liking || widget.idToken == null) return;
    setState(() { _liking = true; });
    try {
      final skinId = widget.skin['id'] ?? widget.skin['skin_id'];
      final resp = await http.post(
        Uri.parse('${AppConstants.apiBase}/api/skins/$skinId/like'),
        headers: {'Authorization': 'Bearer ${widget.idToken}', 'Content-Type': 'application/json'},
      );
      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body) as Map<String, dynamic>;
        setState(() {
          _liked = data['liked'] as bool? ?? !_liked;
          _likes = (data['likes'] as num?)?.toInt() ?? (_liked ? _likes + 1 : _likes - 1);
        });
      }
    } finally {
      setState(() { _liking = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final name = widget.skin['name'] as String? ?? '';
    final url = (widget.skin['public_url'] ?? widget.skin['publicUrl']) as String? ?? '';
    final creatorUsername = widget.skin['username'] as String?;
    final creatorName = (widget.skin['display_name'] ?? widget.skin['username']) as String?;

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        border: Border(top: BorderSide(color: AppTheme.borderGray)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36, height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(color: AppTheme.borderLight, borderRadius: BorderRadius.circular(4)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(name, style: TextStyle(color: AppTheme.textPrimary, fontSize: 20, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
              ),
              if (!widget.isOwn) ...[
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: _toggleLike,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: FaIcon(
                      _liked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                      key: ValueKey(_liked),
                      size: 22,
                      color: _liked ? const Color(0xFFf87171) : AppTheme.textMuted,
                    ),
                  ),
                ),
              ],
            ],
          ),
          if (_likes > 0) ...[
            const SizedBox(height: 4),
            Text(l.skinLikesCount(_likes), style: TextStyle(color: AppTheme.textMuted, fontSize: 12)),
          ],
          if (!widget.isOwn && creatorUsername != null) ...[
            const SizedBox(height: 6),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => PublicProfileScreen(username: creatorUsername),
              )),
              child: Text(
                l.skinByCreator(creatorName ?? creatorUsername),
                style: TextStyle(color: AppTheme.accent, fontSize: 13, decoration: TextDecoration.underline, decorationColor: AppTheme.accent),
              ),
            ),
          ],
          const SizedBox(height: 20),
          SizedBox(
            height: 220,
            child: Center(
              child: url.isNotEmpty ? SkinBodyImage(textureUrl: url, height: 216) : const SizedBox(),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              if (widget.onEdit != null) ...[
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: widget.onEdit,
                    icon: const FaIcon(FontAwesomeIcons.penToSquare, size: 13),
                    label: Text(l.skinsEdit),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.textSecondary,
                      side: const BorderSide(color: AppTheme.borderGray),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
              if (widget.onDownload != null)
                Expanded(
                  child: FilledButton.icon(
                    onPressed: widget.onDownload,
                    icon: const FaIcon(FontAwesomeIcons.download, size: 13),
                    label: Text(l.skinsDownload),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppTheme.accent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
            ],
          ),
          if (widget.onDelete != null) ...[
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: widget.onDelete,
                icon: const FaIcon(FontAwesomeIcons.trash, size: 13),
                label: Text(l.skinMenuDelete),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.error,
                  side: BorderSide(color: AppTheme.error.withOpacity(0.4)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class SkinDetailSheet extends StatelessWidget {
  final String? username;
  final String? javaUuid;
  final String? textureUrl;
  final VoidCallback? onEdit;
  const SkinDetailSheet({
    super.key,
    this.username,
    this.javaUuid,
    this.textureUrl,
    this.onEdit,
  });

  String? get _downloadUrl =>
      textureUrl ??
      (javaUuid != null ? 'https://visage.surgeplay.com/skin/$javaUuid' : null);

  Future<void> _download(BuildContext context) async {
    final url = _downloadUrl;
    if (url == null) return;
    await shareTextureFile(context, url, username ?? 'skin');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(top: BorderSide(color: AppTheme.borderGray)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppTheme.borderLight,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          if (username != null)
            Text(
              username!,
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          if (username != null) const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: Center(
              child: textureUrl != null
                  ? SkinBodyImage(textureUrl: textureUrl!, height: 196)
                  : FaIcon(
                      FontAwesomeIcons.personRunning,
                      color: AppTheme.textMuted,
                      size: 40,
                    ),
            ),
          ),
          const SizedBox(height: 24),
          Builder(
            builder: (context) {
              final l = AppLocalizations.of(context)!;
              return Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: _downloadUrl != null ? () => _download(context) : null,
                      icon: const FaIcon(FontAwesomeIcons.download, size: 13),
                      label: Text(l.skinsDownload),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppTheme.accent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  if (onEdit != null) ...[
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: onEdit,
                        icon: const FaIcon(
                          FontAwesomeIcons.penToSquare,
                          size: 13,
                        ),
                        label: Text(l.skinsEdit),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppTheme.textSecondary,
                          side: const BorderSide(color: AppTheme.borderGray),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class SavedSkinMenuSheet extends StatelessWidget {
  final SavedSkin skin;
  final VoidCallback onEdit;
  final VoidCallback onExport;
  final VoidCallback onDelete;
  final VoidCallback? onUpload;
  const SavedSkinMenuSheet({
    super.key,
    required this.skin,
    required this.onEdit,
    required this.onExport,
    required this.onDelete,
    this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(top: BorderSide(color: AppTheme.borderGray)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36, height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppTheme.borderLight,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Text(
            skin.name,
            style: TextStyle(color: AppTheme.textPrimary, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          SkinMenuTile(
            icon: FontAwesomeIcons.penToSquare,
            label: AppLocalizations.of(context)!.skinsEdit,
            color: AppTheme.accent,
            onTap: onEdit,
          ),
          if (onUpload != null)
            SkinMenuTile(
              icon: FontAwesomeIcons.cloudArrowUp,
              label: skin.uploadedUrl != null ? AppLocalizations.of(context)!.skinReuploadToWebsite : AppLocalizations.of(context)!.skinUploadToWebsite,
              color: const Color(0xFF60a5fa),
              onTap: onUpload!,
            ),
          SkinMenuTile(
            icon: FontAwesomeIcons.shareFromSquare,
            label: AppLocalizations.of(context)!.skinMenuExport,
            color: AppTheme.textSecondary,
            onTap: onExport,
          ),
          SkinMenuTile(
            icon: FontAwesomeIcons.trash,
            label: AppLocalizations.of(context)!.skinMenuDelete,
            color: AppTheme.error,
            onTap: onDelete,
          ),
        ],
      ),
    );
  }
}

class CloudSkinMenuSheet extends StatelessWidget {
  final Map<String, dynamic> skin;
  final VoidCallback? onEdit;
  final VoidCallback onDownload;
  final VoidCallback? onDelete;
  const CloudSkinMenuSheet({
    super.key,
    required this.skin,
    this.onEdit,
    required this.onDownload,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final name = skin['name'] as String? ?? '';
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(top: BorderSide(color: AppTheme.borderGray)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36, height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppTheme.borderLight,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: TextStyle(color: AppTheme.textPrimary, fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: const Color(0x263b82f6), borderRadius: BorderRadius.circular(6)),
                child: const FaIcon(FontAwesomeIcons.cloud, size: 10, color: Color(0xFF60a5fa)),
              ),
            ],
          ),
          if ((skin['display_name'] ?? skin['username']) != null) ...[
            const SizedBox(height: 6),
            Text(
              'by ${skin['display_name'] ?? skin['username']}',
              style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
            ),
          ],
          const SizedBox(height: 20),
          if (onEdit != null)
            SkinMenuTile(
              icon: FontAwesomeIcons.penToSquare,
              label: AppLocalizations.of(context)!.skinCloudEdit,
              color: AppTheme.accent,
              onTap: onEdit!,
            ),
          SkinMenuTile(
            icon: FontAwesomeIcons.download,
            label: AppLocalizations.of(context)!.skinCloudSaveToDevice,
            color: AppTheme.textSecondary,
            onTap: onDownload,
          ),
          if (onDelete != null)
            SkinMenuTile(
              icon: FontAwesomeIcons.trash,
              label: AppLocalizations.of(context)!.skinCloudDelete,
              color: AppTheme.error,
              onTap: onDelete!,
            ),
        ],
      ),
    );
  }
}

class SkinMenuTile extends StatelessWidget {
  final FaIconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  const SkinMenuTile({super.key, required this.icon, required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
        child: Row(
          children: [
            SizedBox(
              width: 28,
              child: FaIcon(icon, size: 15, color: color),
            ),
            const SizedBox(width: 14),
            Text(label, style: TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
