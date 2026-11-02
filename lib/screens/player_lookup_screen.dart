import 'dart:convert';
import 'package:flutter/material.dart';
import '../widgets/components/swipe_back.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../l10n/app_localizations.dart';
import '../models/player_lookup_model.dart';
import '../services/player_lookup_service.dart';
import '../theme/app_theme.dart';
import '../design/design.dart';
import '../layout/platform.dart';
import '../util/lookup_history.dart';
import '../theme/app_tokens.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/skin_3d_viewer.dart';
import '../layout/bar_inset.dart';

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
  LookupError? _error;
  CombinedProfile? _result;
  List<String> _recent = const [];

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
    LookupHistory.load().then((items) {
      if (mounted) setState(() => _recent = items);
    });
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

    if (_result != null) {
      _resultAnim.forward();
      final items = await LookupHistory.add(query);
      if (mounted) setState(() => _recent = items);
    }
  }

  void _searchFor(String name) {
    _ctrl.text = name;
    _search();
  }

  Widget _recentChips(AppLocalizations loc) {
    if (_recent.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: DsSpace.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(loc.lookupRecent, style: DsType.caption),
          const SizedBox(height: DsSpace.sm),
          Wrap(
            spacing: DsSpace.sm,
            runSpacing: DsSpace.sm,
            children: [
              for (final name in _recent)
                ActionChip(
                  label: Text(name),
                  onPressed: () => _searchFor(name),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _lookupErrorText(LookupError e) {
    final l = AppLocalizations.of(context)!;
    return switch (e) {
      LookupError.notFound => l.lookupNotFound,
      LookupError.network => l.lookupNetworkError,
      LookupError.bedrockUnavailable => l.lookupBedrockUnavailable,
      LookupError.failed => l.lookupFailed,
    };
  }

  Widget _searchRow(AppLocalizations loc) => Row(
    children: [
      Expanded(
        child: DsField(
          controller: _ctrl,
          hint: loc.playerLookupHint,
          icon: Icons.manage_search_rounded,
          onSubmitted: (_) => _search(),
          textInputAction: TextInputAction.search,
        ),
      ),
      const SizedBox(width: DsSpace.sm),
      DsIconButton(
        icon: Icons.search_rounded,
        size: 48,
        color: DsColor.accent,
        onPressed: _loading ? null : _search,
      ),
    ],
  );

  Widget _results() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      if (_error != null) ...[
        const SizedBox(height: DsSpace.lg),
        _errorBox(_lookupErrorText(_error!)),
      ],
      if (_result != null) ...[
        const SizedBox(height: DsSpace.xl),
        FadeTransition(
          opacity: _fadeAnim,
          child: SlideTransition(
            position: _slideAnim,
            child: _CombinedResultCard(result: _result!),
          ),
        ),
      ],
    ],
  );

  Widget _desktop(AppLocalizations loc) {
    final idle = _result == null && _error == null && !_loading;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DsHeader(
          title: loc.featureLabelLookup,
          subtitle: loc.playerLookupSubtitle,
        ),
        Expanded(
          child: idle
              ? Center(
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 520),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DsEmptyState(
                            icon: Icons.person_search_rounded,
                            title: loc.featureLabelLookup,
                            message: loc.playerLookupSubtitle,
                          ),
                          const SizedBox(height: DsSpace.lg),
                          _searchRow(loc),
                          _recentChips(loc),
                        ],
                      ),
                    ),
                  ),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    DsSpace.gutter,
                    0,
                    DsSpace.gutter,
                    DsSpace.xxxl + BarInset.of(context),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 560),
                          child: _searchRow(loc),
                        ),
                      ),
                      _results(),
                      _recentChips(loc),
                    ],
                  ),
                ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return SwipeBack(
      onBack: widget.onBack,
      child: useClientLayout(context)
          ? _desktop(loc)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(
                      DsSpace.gutter,
                      DsSpace.lg,
                      DsSpace.gutter,
                      DsSpace.xxxl + BarInset.of(context),
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 680),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              loc.playerLookupSubtitle,
                              style: DsType.caption,
                            ),
                            const SizedBox(height: DsSpace.md),
                            _searchRow(loc),
                            _results(),
                            _recentChips(loc),
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

  Widget _errorBox(String message) {
    return Container(
      padding: const EdgeInsets.all(DsSpace.md),
      decoration: BoxDecoration(
        color: DsColor.danger.withValues(alpha: 0.10),
        borderRadius: DsRadius.controlR,
        border: Border.all(color: DsColor.danger.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline_rounded,
            color: DsColor.danger,
            size: 17,
          ),
          const SizedBox(width: DsSpace.sm),
          Expanded(
            child: Text(
              message,
              style: DsType.body.copyWith(color: DsColor.danger),
            ),
          ),
        ],
      ),
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
              borderRadius: AppRadius.small,
              border: Border.all(
                color: AppTheme.success.withValues(alpha: 0.30),
              ),
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

        if (result.java != null && result.bedrock != null)
          LayoutBuilder(
            builder: (context, box) {
              if (box.maxWidth < 760) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _JavaCard(
                      profile: result.java!,
                      compact: useClientLayout(context),
                    ),
                    const SizedBox(height: 12),
                    _BedrockCard(
                      profile: result.bedrock!,
                      compact: useClientLayout(context),
                    ),
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _JavaCard(
                      profile: result.java!,
                      compact: useClientLayout(context),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _BedrockCard(
                      profile: result.bedrock!,
                      compact: useClientLayout(context),
                    ),
                  ),
                ],
              );
            },
          )
        else
          Align(
            alignment: Alignment.topLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: useClientLayout(context) ? 720 : double.infinity,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (result.java != null)
                    _JavaCard(
                      profile: result.java!,
                      compact: useClientLayout(context),
                    ),
                  if (result.bedrock != null)
                    _BedrockCard(
                      profile: result.bedrock!,
                      compact: useClientLayout(context),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _JavaCard extends StatelessWidget {
  final JavaProfile profile;
  final bool compact;
  const _JavaCard({required this.profile, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final badge = _PlatformBadge(
      label: l.playerLookupJavaEdition,
      color: AppTheme.accent,
    );
    final rows = <Widget>[
      _InfoRow(
        label: l.playerLookupLabelUsername,
        value: profile.username,
        canCopy: true,
        inline: compact,
      ),
      const SizedBox(height: 8),
      _InfoRow(
        label: l.playerLookupLabelUuid,
        value: profile.uuid,
        canCopy: true,
        inline: compact,
      ),
    ];
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: AppRadius.large,
        border: Border.all(color: AppTheme.borderGray),
      ),
      padding: const EdgeInsets.all(16),
      child: compact
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _JavaSkinViewer(uuid: profile.uuid),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [badge, const SizedBox(height: 14), ...rows],
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                badge,
                const SizedBox(height: 14),
                _JavaSkinViewer(uuid: profile.uuid),
                const SizedBox(height: 14),
                const Divider(color: AppTheme.borderGray, height: 1),
                const SizedBox(height: 12),
                ...rows,
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
      if (mounted) {
        setState(() {
          _textureUrl = url;
          _loading = false;
        });
      }
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
            : Icon(Icons.person_rounded, color: AppTheme.textMuted, size: 48),
      ),
    );
  }
}

class _BedrockCard extends StatelessWidget {
  final BedrockProfile profile;
  final bool compact;
  const _BedrockCard({required this.profile, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final badge = Row(
      children: [
        _PlatformBadge(
          label: l.playerLookupBedrockEdition,
          color: AppTheme.xboxGreen,
        ),
        if (profile.gamerscore != null) ...[
          const Spacer(),
          Icon(Icons.star_rounded, size: 13, color: AppTheme.textMuted),
          const SizedBox(width: 3),
          Text(
            '${profile.gamerscore}G',
            style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
          ),
        ],
      ],
    );
    final rows = <Widget>[
      _InfoRow(
        label: l.playerLookupLabelGamertag,
        value: profile.displayName,
        canCopy: true,
        inline: compact,
      ),
      const SizedBox(height: 8),
      _InfoRow(
        label: l.playerLookupLabelXuid,
        value: profile.xuid,
        canCopy: true,
        inline: compact,
      ),
      const SizedBox(height: 8),
      _InfoRow(
        label: l.playerLookupLabelFloodgate,
        value: profile.floodgateUuid,
        canCopy: true,
        inline: compact,
      ),
      if (profile.tier != null) ...[
        const SizedBox(height: 8),
        _InfoRow(label: l.playerLookupLabelTier, value: profile.tier!),
      ],
    ];
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: AppRadius.large,
        border: Border.all(color: AppTheme.borderGray),
      ),
      padding: const EdgeInsets.all(16),
      child: compact
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _BedrockSkinViewer(xuid: profile.xuid),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [badge, const SizedBox(height: 14), ...rows],
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                badge,
                const SizedBox(height: 14),
                _BedrockSkinViewer(xuid: profile.xuid),
                const SizedBox(height: 14),
                const Divider(color: AppTheme.borderGray, height: 1),
                const SizedBox(height: 12),
                ...rows,
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
            : Icon(Icons.gamepad_rounded, color: AppTheme.textMuted, size: 48),
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
  final bool inline;

  const _InfoRow({
    required this.label,
    required this.value,
    this.canCopy = false,
    this.inline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 68,
          child: Text(
            label,
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        (inline ? Flexible.new : Expanded.new)(
          child: Text(
            value,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 12,
              fontFamily: 'monospace',
            ),
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
            child: Padding(
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
