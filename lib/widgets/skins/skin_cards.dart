import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../../theme/app_theme.dart';
import '../../l10n/app_localizations.dart';
import '../../models/saved_skin.dart';
import 'skin_painters.dart';
import 'skin_detail_sheets.dart';
import '../../theme/app_tokens.dart';

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
          borderRadius: AppRadius.medium,
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  LayoutBuilder(
                    builder: (_, constraints) => Center(
                      child: LocalSkinBodyImage(
                        filePath: skin.filePath,
                        height: constraints.maxHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: AppTheme.accent.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.mobileScreen,
                        size: 7,
                        color: AppTheme.accent,
                      ),
                    ),
                  ),
                ],
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
            ),
            const SizedBox(height: 4),
            FaIcon(
              FontAwesomeIcons.ellipsis,
              size: 10,
              color: AppTheme.textMuted,
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
  const JavaSkinCard({
    super.key,
    required this.username,
    required this.javaUuid,
    this.badge,
    this.badgeColor,
    this.onEdit,
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

    return GestureDetector(
      onTap: _openDetail,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: AppRadius.medium,
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Center(
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
                  if (badge != null)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: badgeColor.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          badge,
                          style: TextStyle(
                            color: badgeColor,
                            fontSize: 8,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.username,
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            FaIcon(
              FontAwesomeIcons.ellipsis,
              size: 10,
              color: AppTheme.textMuted,
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
  const BedrockSkinCard({
    super.key,
    required this.gamertag,
    required this.xuid,
    this.onEdit,
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
    final bedrockLabel = AppLocalizations.of(context)!.bedrockLabel;

    return GestureDetector(
      onTap: _openDetail,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: AppRadius.medium,
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Center(
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
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50).withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        bedrockLabel,
                        style: const TextStyle(
                          color: Color(0xFF4CAF50),
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.gamertag,
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            FaIcon(
              FontAwesomeIcons.ellipsis,
              size: 10,
              color: AppTheme.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}
