import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../l10n/app_localizations.dart';
import '../models/player_lookup_model.dart';
import '../services/player_lookup_service.dart';
import '../theme/app_theme.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/skin_3d_viewer.dart';

class PlayerLookupScreen extends StatefulWidget {
  final VoidCallback onBack;
  const PlayerLookupScreen({super.key, required this.onBack});

  @override
  State<PlayerLookupScreen> createState() => _PlayerLookupScreenState();
}

class _PlayerLookupScreenState extends State<PlayerLookupScreen>
    with SingleTickerProviderStateMixin {
  final _ctrl = TextEditingController();
  bool _loading = false;
  String? _error;
  CombinedProfile? _result;

  late final AnimationController _resultAnim;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _resultAnim = AnimationController(
      duration: const Duration(milliseconds: 280),
      vsync: this,
    );
    _fadeAnim = CurvedAnimation(parent: _resultAnim, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _resultAnim, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _resultAnim.dispose();
    super.dispose();
  }

  Future<void> _search() async {
    final query = _ctrl.text.trim();
    if (query.isEmpty) return;

    setState(() {
      _loading = true;
      _error = null;
      _result = null;
    });
    _resultAnim.reset();

    final (:result, :error) = await PlayerLookupService.lookupCombined(query);
    if (!mounted) return;

    setState(() {
      _result = result;
      _error = error;
      _loading = false;
    });

    if (_result != null) _resultAnim.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppTheme.surface,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: AppTheme.textPrimary,
                      ),
                      onPressed: widget.onBack,
                    ),
                    Text(
                      AppLocalizations.of(context)!.playerLookupTitle,
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: AppTheme.borderGray),
            ],
          ),
        ),

        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context)!.playerLookupSubtitle,
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceRaised,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppTheme.borderGray),
                        ),
                        child: TextField(
                          controller: _ctrl,
                          style: const TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(
                              context,
                            )!.playerLookupHint,
                            hintStyle: TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 13,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 13,
                            ),
                            prefixIcon: Icon(
                              Icons.manage_search_rounded,
                              color: AppTheme.textMuted,
                              size: 18,
                            ),
                          ),
                          onSubmitted: (_) => _search(),
                          textInputAction: TextInputAction.search,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _loading ? null : _search,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.accent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          elevation: 0,
                        ),
                        child: _loading
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(Icons.search_rounded, size: 20),
                      ),
                    ),
                  ],
                ),

                if (_error != null) ...[
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.error.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppTheme.error.withValues(alpha: 0.30),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.error_outline_rounded,
                          color: AppTheme.error,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _error!,
                            style: const TextStyle(
                              color: AppTheme.error,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                if (_result != null) ...[
                  const SizedBox(height: 20),
                  FadeTransition(
                    opacity: _fadeAnim,
                    child: SlideTransition(
                      position: _slideAnim,
                      child: _CombinedResultCard(result: _result!),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CombinedResultCard extends StatelessWidget {
  final CombinedProfile result;
  const _CombinedResultCard({required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (result.linked) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.success.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.success.withValues(alpha: 0.30)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.link_rounded,
                  color: AppTheme.success,
                  size: 15,
                ),
                const SizedBox(width: 6),
                Text(
                  AppLocalizations.of(context)!.playerLookupLinked,
                  style: const TextStyle(
                    color: AppTheme.success,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],

        if (result.java != null) ...[
          _JavaCard(profile: result.java!),
          if (result.bedrock != null) const SizedBox(height: 12),
        ],

        if (result.bedrock != null) _BedrockCard(profile: result.bedrock!),
      ],
    );
  }
}

class _JavaCard extends StatelessWidget {
  final JavaProfile profile;
  const _JavaCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderGray),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PlatformBadge(
            label: AppLocalizations.of(context)!.playerLookupJavaEdition,
            color: AppTheme.accent,
          ),
          const SizedBox(height: 14),
          _JavaSkinViewer(uuid: profile.uuid),
          const SizedBox(height: 14),
          const Divider(color: AppTheme.borderGray, height: 1),
          const SizedBox(height: 12),
          _InfoRow(
            label: AppLocalizations.of(context)!.playerLookupLabelUsername,
            value: profile.username,
            canCopy: true,
          ),
          const SizedBox(height: 8),
          _InfoRow(
            label: AppLocalizations.of(context)!.playerLookupLabelUuid,
            value: profile.uuid,
            canCopy: true,
          ),
        ],
      ),
    );
  }
}

class _JavaSkinViewer extends StatefulWidget {
  final String uuid;
  const _JavaSkinViewer({required this.uuid});

  @override
  State<_JavaSkinViewer> createState() => _JavaSkinViewerState();
}

class _JavaSkinViewerState extends State<_JavaSkinViewer> {
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
            Uri.parse(
              'https://sessionserver.mojang.com/session/minecraft/profile/${widget.uuid.replaceAll('-', '')}',
            ),
            headers: {'User-Agent': 'MCCompanionApp/1.0'},
          )
          .timeout(const Duration(seconds: 8));
      if (!mounted || resp.statusCode != 200) {
        if (mounted) setState(() => _loading = false);
        return;
      }
      final url = _extractTextureUrl(resp.body);
      if (mounted)
        setState(() {
          _textureUrl = url;
          _loading = false;
        });
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Center(
        child: _loading
            ? CircularProgressIndicator(color: AppTheme.accent, strokeWidth: 2)
            : _textureUrl != null
            ? SkinBodyFromUrl(textureUrl: _textureUrl!, height: 156)
            : const Icon(
                Icons.person_rounded,
                color: AppTheme.textMuted,
                size: 48,
              ),
      ),
    );
  }
}

class _BedrockCard extends StatelessWidget {
  final BedrockProfile profile;
  const _BedrockCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderGray),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _PlatformBadge(
                label: AppLocalizations.of(context)!.playerLookupBedrockEdition,
                color: AppTheme.xboxGreen,
              ),
              if (profile.gamerscore != null) ...[
                const Spacer(),
                const Icon(
                  Icons.star_rounded,
                  size: 13,
                  color: AppTheme.textMuted,
                ),
                const SizedBox(width: 3),
                Text(
                  '${profile.gamerscore}G',
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 14),
          _BedrockSkinViewer(xuid: profile.xuid),
          const SizedBox(height: 14),
          const Divider(color: AppTheme.borderGray, height: 1),
          const SizedBox(height: 12),
          _InfoRow(
            label: AppLocalizations.of(context)!.playerLookupLabelGamertag,
            value: profile.displayName,
            canCopy: true,
          ),
          const SizedBox(height: 8),
          _InfoRow(
            label: AppLocalizations.of(context)!.playerLookupLabelXuid,
            value: profile.xuid,
            canCopy: true,
          ),
          const SizedBox(height: 8),
          _InfoRow(
            label: AppLocalizations.of(context)!.playerLookupLabelFloodgate,
            value: profile.floodgateUuid,
            canCopy: true,
          ),
          if (profile.tier != null) ...[
            const SizedBox(height: 8),
            _InfoRow(
              label: AppLocalizations.of(context)!.playerLookupLabelTier,
              value: profile.tier!,
            ),
          ],
        ],
      ),
    );
  }
}

class _BedrockSkinViewer extends StatefulWidget {
  final String xuid;
  const _BedrockSkinViewer({required this.xuid});

  @override
  State<_BedrockSkinViewer> createState() => _BedrockSkinViewerState();
}

class _BedrockSkinViewerState extends State<_BedrockSkinViewer> {
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
        if (id != null && mounted) {
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Center(
        child: _loading
            ? CircularProgressIndicator(color: AppTheme.accent, strokeWidth: 2)
            : _textureUrl != null
            ? SkinBodyFromUrl(textureUrl: _textureUrl!, height: 156)
            : const Icon(
                Icons.gamepad_rounded,
                color: AppTheme.textMuted,
                size: 48,
              ),
      ),
    );
  }
}

class _PlatformBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _PlatformBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool canCopy;
  final bool truncate;

  const _InfoRow({
    required this.label,
    required this.value,
    this.canCopy = false,
  }) : truncate = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 68,
          child: Text(
            label,
            style: const TextStyle(
              color: AppTheme.textMuted,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 12,
              fontFamily: 'monospace',
            ),
            maxLines: truncate ? 1 : null,
            overflow: truncate ? TextOverflow.ellipsis : TextOverflow.visible,
          ),
        ),
        if (canCopy)
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: value));
              AppToast.show(
                context,
                message: AppLocalizations.of(
                  context,
                )!.playerLookupCopied(label),
                icon: Icons.copy_rounded,
                color: AppTheme.accent,
                duration: const Duration(seconds: 2),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 6),
              child: Icon(
                Icons.copy_rounded,
                size: 14,
                color: AppTheme.textMuted,
              ),
            ),
          ),
      ],
    );
  }
}
