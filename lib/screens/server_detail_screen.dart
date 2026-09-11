import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';
import '../services/auth_service.dart';
import '../services/server_directory_service.dart';
import '../theme/app_theme.dart';
import '../design/design.dart';
import '../theme/app_tokens.dart';
import '../util/directory_server.dart';
import '../widgets/components/app_toast.dart';

class ServerDetailScreen extends StatefulWidget {
  const ServerDetailScreen({
    super.key,
    required this.server,
    required this.onPlay,
  }) : slug = null;

  const ServerDetailScreen.fromSlug({
    super.key,
    required String this.slug,
    required this.onPlay,
  }) : server = null;

  final DirectoryServer? server;
  final String? slug;
  final void Function(DirectoryServer server) onPlay;

  @override
  State<ServerDetailScreen> createState() => _ServerDetailScreenState();
}

class _ServerDetailScreenState extends State<ServerDetailScreen> {
  DirectoryServer? _loaded;

  DirectoryServer get _server => _loaded!;
  VoteCounts _votes = VoteCounts.zero;
  bool _copied = false;

  @override
  void initState() {
    super.initState();
    _loaded = widget.server;

    final slug = widget.server?.slug ?? widget.slug!;
    ServerDirectoryService.fetchServer(slug).then((fresh) {
      if (mounted && fresh != null) setState(() => _loaded = fresh);
    });
    ServerDirectoryService.fetchVotes(slug).then((votes) {
      if (mounted) setState(() => _votes = votes);
    });
  }

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: _server.connectAddress));
    if (!mounted) return;
    setState(() => _copied = true);
    await Future<void>.delayed(const Duration(milliseconds: 1500));
    if (mounted) setState(() => _copied = false);
  }

  Future<void> _openVoteSheet() async {
    if (AuthService.currentUser == null) {
      AppToast.show(
        context,
        message: AppLocalizations.of(context)!.serverVoteSignInRequired,
        icon: Icons.person_outline,
        color: AppTheme.warning,
      );
      return;
    }

    final username = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _VoteSheet(server: _server),
    );
    if (username == null || !mounted) return;

    final result = await ServerDirectoryService.vote(
      slug: _server.slug,
      username: username,
    );
    if (!mounted) return;

    if (result.ok) {
      setState(() => _votes = result.votes ?? _votes);
      AppToast.show(
        context,
        message: result.delivered
            ? AppLocalizations.of(context)!.serverVoteDelivered
            : AppLocalizations.of(context)!.serverVoteNoRewards,
        icon: Icons.check_rounded,
        color: AppTheme.success,
      );
    } else {
      AppToast.show(
        context,
        message: switch (result.error) {
          'sign_in_required' => AppLocalizations.of(
            context,
          )!.serverVoteSignInRequired,
          'network' => AppLocalizations.of(context)!.serverVoteOffline,
          _ => result.message ?? AppLocalizations.of(context)!.serverVoteFailed,
        },
        icon: Icons.error_outline,
        color: AppTheme.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final server = _loaded;
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: DsColor.bg,
      appBar: AppBar(
        backgroundColor: DsColor.bg,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: DsColor.textSoft),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: server == null
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
          : Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(
                    DsSpace.gutter,
                    0,
                    DsSpace.gutter,
                    DsSpace.xxxl,
                  ),
                  children: [
                    _identity(l),
                    const SizedBox(height: DsSpace.xl),
                    _actions(l),
                    const SizedBox(height: DsSpace.section),
                    _statsCard(l),
                    if (server.description != null &&
                        server.description!.trim().isNotEmpty) ...[
                      const SizedBox(height: DsSpace.section),
                      Text(
                        server.description!.trim(),
                        style: DsType.body.copyWith(
                          color: DsColor.textSoft,
                          height: 1.6,
                        ),
                      ),
                    ],
                    if (server.motd != null &&
                        server.motd!.trim().isNotEmpty) ...[
                      const SizedBox(height: DsSpace.xl),
                      _motd(l, server.motd!.trim()),
                    ],
                    if (server.websiteUrl != null ||
                        server.discordUrl != null) ...[
                      const SizedBox(height: DsSpace.xl),
                      Row(
                        children: [
                          if (server.discordUrl != null)
                            Expanded(
                              child: DsButton(
                                label: l.serverLinkDiscord,
                                icon: Icons.forum_rounded,
                                tone: DsButtonTone.neutral,
                                expand: true,
                                onPressed: () => _openUrl(server.discordUrl!),
                              ),
                            ),
                          if (server.discordUrl != null &&
                              server.websiteUrl != null)
                            const SizedBox(width: DsSpace.sm),
                          if (server.websiteUrl != null)
                            Expanded(
                              child: DsButton(
                                label: l.serverLinkWebsite,
                                icon: Icons.language_rounded,
                                tone: DsButtonTone.neutral,
                                expand: true,
                                onPressed: () => _openUrl(server.websiteUrl!),
                              ),
                            ),
                        ],
                      ),
                    ],
                    const SizedBox(height: DsSpace.section),
                    _votesCard(l),
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> _openUrl(String url) =>
      launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);

  Widget _identity(AppLocalizations l) {
    final server = _server;
    final hasBanner = server.bannerUrl != null && server.bannerUrl!.isNotEmpty;
    final hasIcon = server.iconUrl != null && server.iconUrl!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasBanner)
          ClipRRect(
            borderRadius: DsRadius.cardR,
            child: Image.network(
              server.bannerUrl!,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              errorBuilder: (_, _, _) => const SizedBox.shrink(),
            ),
          ),
        SizedBox(height: hasBanner ? DsSpace.lg : 0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasIcon) ...[
              Container(
                width: 56,
                height: 56,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: DsColor.inset,
                  borderRadius: DsRadius.controlR,
                  border: Border.all(color: DsColor.line),
                ),
                child: Image.network(
                  server.iconUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const SizedBox.shrink(),
                ),
              ),
              const SizedBox(width: DsSpace.md),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    server.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: DsType.display.copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: DsSpace.sm),
                  Wrap(
                    spacing: DsSpace.sm - 2,
                    runSpacing: DsSpace.sm - 2,
                    children: [
                      if (server.featured)
                        DsBadge(
                          label: l.serverBadgeFeatured,
                          color: DsColor.warning,
                        ),
                      DsBadge(
                        label: switch (server.editionBadge) {
                          ServerEdition.java => l.serverEditionJava,
                          ServerEdition.bedrock => l.serverEditionBedrock,
                          ServerEdition.crossplay => l.serverEditionCrossplay,
                        },
                        color: switch (server.editionBadge) {
                          ServerEdition.java => DsColor.warning,
                          ServerEdition.bedrock => DsColor.info,
                          ServerEdition.crossplay => DsColor.accent,
                        },
                      ),
                      for (final tag in server.tags.take(3))
                        DsBadge(label: tag, color: DsColor.textFaint),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _actions(AppLocalizations l) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DsButton(
          label: l.serverCardPlay,
          icon: Icons.play_arrow_rounded,
          size: DsButtonSize.large,
          expand: true,
          onPressed: () => widget.onPlay(_server),
        ),
        const SizedBox(height: DsSpace.sm),
        Row(
          children: [
            Expanded(
              child: DsButton(
                label: _copied ? l.serverCopied : l.serverCopyIp,
                icon: _copied
                    ? Icons.check_rounded
                    : Icons.content_copy_rounded,
                tone: DsButtonTone.neutral,
                expand: true,
                onPressed: _copy,
              ),
            ),
            const SizedBox(width: DsSpace.sm),
            Expanded(
              child: DsButton(
                label: l.serverCardVote,
                icon: Icons.favorite_rounded,
                tone: DsButtonTone.neutral,
                expand: true,
                onPressed: _openVoteSheet,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _statsCard(AppLocalizations l) {
    final items = <(String, String)>[
      (_server.avgPlayers.round().toString(), l.serverStatPlayers),
      ('${_server.peakPlayers}', l.serverStatPeak),
      ('${_server.uptime}%', l.serverStatUptime),
      if (_server.usefulVersion != null)
        (_server.usefulVersion!, l.versionLabel),
    ];

    return DsCard(
      padding: const EdgeInsets.symmetric(
        horizontal: DsSpace.lg,
        vertical: DsSpace.lg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final item in items)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.$1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: DsType.heading.copyWith(
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                  const SizedBox(height: DsSpace.xxs),
                  Text(
                    item.$2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: DsType.caption,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _motd(AppLocalizations l, String motd) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l.serverSectionMotd, style: DsType.caption),
        const SizedBox(height: DsSpace.sm - 2),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(DsSpace.md),
          decoration: BoxDecoration(
            color: DsColor.inset,
            borderRadius: DsRadius.controlR,
            border: Border.all(color: DsColor.line),
          ),
          child: Text(motd, style: DsType.mono),
        ),
      ],
    );
  }

  Widget _votesCard(AppLocalizations l) {
    return DsCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${_votes.month}',
                  style: DsType.heading.copyWith(color: DsColor.accent),
                ),
                const SizedBox(height: DsSpace.xxs),
                Text(l.serverVotesThisMonth, style: DsType.caption),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${_votes.allTime}', style: DsType.heading),
                const SizedBox(height: DsSpace.xxs),
                Text(l.serverVotesAllTime, style: DsType.caption),
              ],
            ),
          ),
          DsButton(
            label: l.serverCardVote,
            tone: DsButtonTone.accent,
            size: DsButtonSize.small,
            onPressed: _openVoteSheet,
          ),
        ],
      ),
    );
  }
}

class _VoteSheet extends StatefulWidget {
  const _VoteSheet({required this.server});

  final DirectoryServer server;

  @override
  State<_VoteSheet> createState() => _VoteSheetState();
}

class _VoteSheetState extends State<_VoteSheet> {
  final _controller = TextEditingController();
  static final _valid = RegExp(r'^[A-Za-z0-9_]{3,16}$');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final name = _controller.text.trim();
    final ok = _valid.hasMatch(name);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 24),
        decoration: BoxDecoration(
          color: AppTheme.surfaceRaised,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(
                context,
              )!.serverVoteSheetTitle(widget.server.name),
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              AppLocalizations.of(context)!.serverVoteSheetSubtitle,
              style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _controller,
              autofocus: true,
              maxLength: 16,
              onChanged: (_) => setState(() {}),
              style: TextStyle(color: AppTheme.textPrimary, fontSize: 15),
              decoration: InputDecoration(
                counterText: '',
                hintText: AppLocalizations.of(context)!.serverVoteSheetHint,
                hintStyle: TextStyle(color: AppTheme.textMuted),
                filled: true,
                fillColor: AppTheme.surface,
                border: OutlineInputBorder(
                  borderRadius: AppRadius.small,
                  borderSide: BorderSide(color: AppTheme.borderGray),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: AppRadius.small,
                  borderSide: BorderSide(color: AppTheme.borderGray),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: AppRadius.small,
                  borderSide: BorderSide(color: AppTheme.accent),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: FilledButton(
                onPressed: ok ? () => Navigator.of(context).pop(name) : null,
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.accent,
                  foregroundColor: const Color(0xFF0D1A18),
                  disabledBackgroundColor: AppTheme.surface,
                  disabledForegroundColor: AppTheme.textMuted,
                ),
                child: Text(
                  AppLocalizations.of(context)!.serverVoteSheetButton,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.serverVoteSheetLimit,
              style: TextStyle(color: AppTheme.textMuted, fontSize: 11.5),
            ),
          ],
        ),
      ),
    );
  }
}
