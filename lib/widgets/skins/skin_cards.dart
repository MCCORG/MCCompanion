import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../../theme/app_theme.dart';
import '../../l10n/app_localizations.dart';
import '../../models/saved_skin.dart';
import 'skin_painters.dart';
import 'skin_detail_sheets.dart';

class SavedSkinCard extends StatelessWidget {
  final SavedSkin skin;
  final VoidCallback onTap;
  const SavedSkinCard({super.key, required this.skin, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: LocalSkinBodyImage(filePath: skin.filePath, height: 100),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              skin.name,
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            FaIcon(FontAwesomeIcons.ellipsis, size: 10, color: AppTheme.textMuted),
          ],
        ),
      ),
    );
  }
}

class GeyserSkinChip extends StatelessWidget {
  final GeyserSkin skin;
  final VoidCallback onTap;
  const GeyserSkinChip({super.key, required this.skin, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: LayoutBuilder(
                  builder: (_, constraints) => Center(
                    child: SkinBodyImage(
                      textureUrl: skin.textureUrl,
                      height: constraints.maxHeight,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JavaSkinCard extends StatefulWidget {
  final String username;
  final String javaUuid;
  final String? badge;
  final Color? badgeColor;
  final void Function(String?)? onEdit;
  final bool compact;
  const JavaSkinCard({
    super.key,
    required this.username,
    required this.javaUuid,
    this.badge,
    this.badgeColor,
    this.onEdit,
    this.compact = false,
  });

  @override
  State<JavaSkinCard> createState() => JavaSkinCardState();
}

class JavaSkinCardState extends State<JavaSkinCard> {
  String? _textureUrl;

  @override
  void initState() {
    super.initState();
    _fetchTexture();
  }

  Future<void> _fetchTexture() async {
    try {
      final resp = await http
          .get(
            Uri.parse(
              'https://sessionserver.mojang.com/session/minecraft/profile/${widget.javaUuid}',
            ),
            headers: {'User-Agent': 'MCCompanionApp/1.0'},
          )
          .timeout(const Duration(seconds: 8));
      if (!mounted || resp.statusCode != 200) return;
      final url = _extractTextureUrl(resp.body);
      if (url != null && mounted) setState(() => _textureUrl = url);
    } catch (_) {}
  }

  String? _extractTextureUrl(String body) {
    try {
      final props = (jsonDecode(body)['properties'] as List?) ?? [];
      for (final p in props) {
        if (p['name'] == 'textures') {
          final decoded = jsonDecode(
            utf8.decode(base64.decode(p['value'] as String)),
          );
          return decoded['textures']?['SKIN']?['url'] as String?;
        }
      }
    } catch (_) {}
    return null;
  }

  Future<void> _download() async {
    final url = _textureUrl ?? 'https://visage.surgeplay.com/skin/${widget.javaUuid}';
    await shareTextureFile(context, url, widget.username);
  }

  void _openDetail() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => SkinDetailSheet(
        username: widget.username,
        javaUuid: widget.javaUuid,
        textureUrl: _textureUrl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final badge = widget.badge;
    final badgeColor = widget.badgeColor ?? AppTheme.accent;

    final compact = widget.compact;
    final pad = compact ? 10.0 : 14.0;

    return GestureDetector(
      onTap: _openDetail,
      child: Container(
        padding: EdgeInsets.all(pad),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Column(
          children: [
            if (badge != null) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    badge,
                    style: TextStyle(
                      color: badgeColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
            ],
            Expanded(
              child: Center(
                child: LayoutBuilder(
                  builder: (_, constraints) => _textureUrl != null
                      ? SkinBodyImage(
                          textureUrl: _textureUrl!,
                          height: constraints.maxHeight,
                        )
                      : CircularProgressIndicator(
                          color: AppTheme.accent,
                          strokeWidth: 2,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.username,
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _download,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.accent,
                      side: BorderSide(color: AppTheme.accent),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const FaIcon(FontAwesomeIcons.download, size: 11),
                  ),
                ),
                if (widget.onEdit != null) ...[
                  const SizedBox(width: 6),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => widget.onEdit!(_textureUrl),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.textSecondary,
                        side: const BorderSide(color: AppTheme.borderGray),
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.penToSquare,
                        size: 11,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BedrockSkinCard extends StatefulWidget {
  final String gamertag;
  final String xuid;
  final void Function(String?)? onEdit;
  final bool compact;
  const BedrockSkinCard({
    super.key,
    required this.gamertag,
    required this.xuid,
    this.onEdit,
    this.compact = false,
  });

  @override
  State<BedrockSkinCard> createState() => BedrockSkinCardState();
}

class BedrockSkinCardState extends State<BedrockSkinCard> {
  String? _textureUrl;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    try {
      final resp = await http
          .get(
            Uri.parse('https://api.geysermc.org/v2/skin/${widget.xuid}'),
            headers: {'User-Agent': 'MCCompanionApp/1.0'},
          )
          .timeout(const Duration(seconds: 8));
      if (!mounted) return;
      if (resp.statusCode == 200) {
        final id = jsonDecode(resp.body)['texture_id'] as String?;
        if (id != null) {
          setState(() {
            _textureUrl = 'https://textures.minecraft.net/texture/$id';
            _loading = false;
          });
          return;
        }
      }
    } catch (_) {}
    if (mounted) setState(() => _loading = false);
  }

  Future<void> _download() async {
    if (_textureUrl == null) return;
    await shareTextureFile(context, _textureUrl!, widget.gamertag);
  }

  void _openDetail() {
    if (_textureUrl == null) return;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) =>
          SkinDetailSheet(username: widget.gamertag, textureUrl: _textureUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    final compact = widget.compact;
    final pad = compact ? 10.0 : 14.0;

    return GestureDetector(
      onTap: _openDetail,
      child: Container(
        padding: EdgeInsets.all(pad),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  AppLocalizations.of(context)!.bedrockLabel,
                  style: const TextStyle(
                    color: Color(0xFF4CAF50),
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: Center(
                child: _loading
                    ? CircularProgressIndicator(
                        color: AppTheme.accent,
                        strokeWidth: 2,
                      )
                    : LayoutBuilder(
                        builder: (_, constraints) => _textureUrl != null
                            ? SkinBodyImage(
                                textureUrl: _textureUrl!,
                                height: constraints.maxHeight,
                              )
                            : FaIcon(
                                FontAwesomeIcons.personRunning,
                                color: AppTheme.textMuted,
                                size: 28,
                              ),
                      ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.gamertag,
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _textureUrl != null ? _download : null,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF4CAF50),
                      side: const BorderSide(color: Color(0xFF4CAF50)),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const FaIcon(FontAwesomeIcons.download, size: 11),
                  ),
                ),
                if (widget.onEdit != null) ...[
                  const SizedBox(width: 6),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _textureUrl != null
                          ? () => widget.onEdit!(_textureUrl)
                          : null,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.textSecondary,
                        side: const BorderSide(color: AppTheme.borderGray),
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.penToSquare,
                        size: 11,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SkinsNoAccountsCard extends StatelessWidget {
  const SkinsNoAccountsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return SkinsInfoCard(
      icon: FontAwesomeIcons.shirt,
      iconColor: const Color(0xFF42A5F5),
      title: l.skinsNoAccountsTitle,
      subtitle: l.skinsNoAccountsSubtitle,
    );
  }
}

class SkinsNotLoggedInCard extends StatelessWidget {
  const SkinsNotLoggedInCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return SkinsInfoCard(
      icon: FontAwesomeIcons.user,
      iconColor: AppTheme.accent,
      title: l.skinsSignInTitle,
      subtitle: l.skinsSignInSubtitle,
    );
  }
}

class SkinsInfoCard extends StatelessWidget {
  final FaIconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  const SkinsInfoCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: FaIcon(icon, color: iconColor, size: 18)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
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
