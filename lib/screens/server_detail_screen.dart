import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';
import '../services/auth_service.dart';
import '../services/server_directory_service.dart';
import '../theme/app_theme.dart';
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
          'sign_in_required' =>
            AppLocalizations.of(context)!.serverVoteSignInRequired,
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

    if (server == null) {
      return Scaffold(
        backgroundColor: AppTheme.background,
        appBar: AppBar(
          backgroundColor: AppTheme.background,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppTheme.textSecondary),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              color: AppTheme.textMuted,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.background,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppTheme.textSecondary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
            children: [
              _identity(l),
              const SizedBox(height: 16),
              _actions(l),
              const SizedBox(height: 18),
              _statsRow(l),

              if (server.description != null &&
                  server.description!.trim().isNotEmpty) ...[
                const SizedBox(height: 22),
                Text(
                  server.description!.trim(),
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14.5,
                    height: 1.65,
                  ),
                ),
              ],

              if (server.motd != null && server.motd!.trim().isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  l.serverSectionMotd.toLowerCase(),
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 11),
                ),
                const SizedBox(height: 3),
                Text(
                  server.motd!.trim(),
                  style: TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12.5,
                    height: 1.45,
                    fontFamily: 'monospace',
                  ),
                ),
              ],

              if (server.websiteUrl != null || server.discordUrl != null) ...[
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (server.discordUrl != null)
                      _link(
                        label: l.serverLinkDiscord,
                        url: server.discordUrl!,
                        color: const Color(0xFF5865F2),
                      ),
                    if (server.websiteUrl != null)
                      _link(
                        label: l.serverLinkWebsite,
                        url: server.websiteUrl!,
                        color: AppTheme.textSecondary,
                      ),
                  ],
                ),
              ],

              const SizedBox(height: 22),
              Divider(height: 1, color: AppTheme.borderGray),
              const SizedBox(height: 14),
              _voteLine(l),
            ],
          ),
        ),
      ),
    );
  }

  Widget _identity(AppLocalizations l) {
    final server = _server;
    final hasBanner = server.bannerUrl != null && server.bannerUrl!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasBanner)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              server.bannerUrl!,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              errorBuilder: (_, _, _) => const SizedBox.shrink(),
            ),
          ),
        SizedBox(height: hasBanner ? 14 : 0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (server.iconUrl != null && server.iconUrl!.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  server.iconUrl!,
                  width: 54,
                  height: 54,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const SizedBox.shrink(),
                ),
              ),
              const SizedBox(width: 12),
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
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      if (server.featured)
                        _tag(l.serverBadgeFeatured, const Color(0xFFF59E0B)),
                      _tag(
                        switch (server.editionBadge) {
                          ServerEdition.java => l.serverEditionJava,
                          ServerEdition.bedrock => l.serverEditionBedrock,
                          ServerEdition.crossplay => l.serverEditionCrossplay,
                        },
                        switch (server.editionBadge) {
                          ServerEdition.java => const Color(0xFFF59E0B),
                          ServerEdition.bedrock => AppTheme.info,
                          ServerEdition.crossplay => const Color(0xFFA78BFA),
                        },
                      ),
                      ...server.tags.take(3).map((tag) => _tag(tag, null)),
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

  Widget _tag(String label, Color? color) {
    final tint = color ?? AppTheme.textSecondary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color == null
            ? AppTheme.surfaceRaised
            : tint.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: color == null
              ? AppTheme.borderGray
              : tint.withValues(alpha: 0.26),
        ),
      ),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          color: tint,
          fontSize: 9.5,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
          fontFamily: 'monospace',
        ),
      ),
    );
  }

  Widget _actions(AppLocalizations l) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 46,
            child: FilledButton.icon(
              onPressed: () => widget.onPlay(_server),
              icon: const Icon(Icons.play_arrow_rounded, size: 20),
              label: Text(
                l.serverCardPlay,
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: AppTheme.accent,
                foregroundColor: const Color(0xFF0D1A18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _secondaryButton(
            label: _copied ? l.serverCopied : l.serverCopyIp,
            color: _copied ? AppTheme.success : AppTheme.textSecondary,
            onPressed: _copy,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _secondaryButton(
            label: l.serverCardVote,
            color: AppTheme.accent,
            onPressed: _openVoteSheet,
          ),
        ),
      ],
    );
  }

  Widget _secondaryButton({
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 46,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(color: AppTheme.borderGray),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _statsRow(AppLocalizations l) {
    final items = <(String, String)>[
      (_server.avgPlayers.round().toString(), l.serverStatPlayers.toLowerCase()),
      ('${_server.peakPlayers}', l.serverStatPeak.toLowerCase()),
      ('${_server.uptime}%', l.serverStatUptime.toLowerCase()),
      if (_server.usefulVersion != null) (_server.usefulVersion!, 'version'),
    ];

    return Wrap(
      spacing: 18,
      runSpacing: 8,
      children: items
          .map(
            (item) => Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  item.$1,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'monospace',
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  item.$2,
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 12.5),
                ),
              ],
            ),
          )
          .toList(growable: false),
    );
  }

  Widget _link({
    required String label,
    required String url,
    required Color color,
  }) {
    return OutlinedButton(
      onPressed: () =>
          launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        side: BorderSide(color: AppTheme.borderGray),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _voteLine(AppLocalizations l) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          '${_votes.month}',
          style: TextStyle(
            color: AppTheme.accent,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            fontFamily: 'monospace',
          ),
        ),
        const SizedBox(width: 5),
        Text(
          l.serverVotesThisMonth.toLowerCase(),
          style: TextStyle(color: AppTheme.textMuted, fontSize: 12.5),
        ),
        const SizedBox(width: 18),
        Text(
          '${_votes.allTime}',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            fontFamily: 'monospace',
          ),
        ),
        const SizedBox(width: 5),
        Text(
          l.serverVotesAllTime.toLowerCase(),
          style: TextStyle(color: AppTheme.textMuted, fontSize: 12.5),
        ),
      ],
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
              AppLocalizations.of(context)!.serverVoteSheetTitle(widget.server.name),
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
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppTheme.borderGray),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppTheme.borderGray),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.serverVoteSheetButton,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
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
