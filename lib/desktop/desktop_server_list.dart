import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../design/design.dart';
import '../l10n/app_localizations.dart';
import '../services/auth_service.dart';
import '../services/server_directory_service.dart';
import '../widgets/components/app_toast.dart';
import '../util/directory_server.dart';

class DesktopServerListScreen extends StatefulWidget {
  final void Function(DirectoryServer server) onPlay;
  final void Function(DirectoryServer server)? onOpenDetails;

  const DesktopServerListScreen({
    super.key,
    required this.onPlay,
    this.onOpenDetails,
  });

  @override
  State<DesktopServerListScreen> createState() =>
      _DesktopServerListScreenState();
}

class _DesktopServerListScreenState extends State<DesktopServerListScreen> {
  final List<DirectoryServer> _servers = [];
  final ScrollController _scroll = ScrollController();
  final TextEditingController _search = TextEditingController();

  Timer? _debounce;
  DirectoryServer? _selected;
  String? _hovered;
  bool _copied = false;
  bool _detailOpen = false;
  String _query = '';
  final String _edition = '';
  String _sort = 'votes';
  bool _loading = true;
  bool _loadingMore = false;
  int _total = 0;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
    _load();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    _search.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_loading || _loadingMore || _servers.length >= _total) return;
    if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 400) {
      _loadMore();
    }
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      if (!mounted || value.trim() == _query) return;
      setState(() => _query = value.trim());
      _load();
    });
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _page = 0;
    });
    final page = await ServerDirectoryService.fetchServers(
      search: _query,
      edition: _edition,
      sort: _sort,
    );
    if (!mounted) return;
    setState(() {
      _servers
        ..clear()
        ..addAll(page.servers);
      _total = page.total;
      _loading = false;
      _selected = _servers.isEmpty ? null : _servers.first;
    });
  }

  Future<void> _loadMore() async {
    setState(() => _loadingMore = true);
    final next = _page + 1;
    final page = await ServerDirectoryService.fetchServers(
      search: _query,
      edition: _edition,
      sort: _sort,
      page: next,
    );
    if (!mounted) return;
    setState(() {
      _page = next;
      _servers.addAll(page.servers);
      _loadingMore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, box) {
        final width = box.maxWidth;
        final showDetail = width >= 900;

        if (!showDetail) {
          return Stack(
            children: [
              _table(l),
              if (_detailOpen && _selected != null)
                Positioned.fill(
                  child: ColoredBox(
                    color: DsColor.bg,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            DsSpace.lg,
                            DsSpace.lg,
                            DsSpace.lg,
                            0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: DsIconButton(
                              icon: Icons.arrow_back_rounded,
                              size: 36,
                              onPressed: () =>
                                  setState(() => _detailOpen = false),
                            ),
                          ),
                        ),
                        Expanded(child: _detail(l)),
                      ],
                    ),
                  ),
                ),
            ],
          );
        }

        return Row(
          children: [
            Expanded(flex: 4, child: _table(l)),
            Container(width: 1, color: DsColor.line),
            Expanded(
              flex: 3,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 360),
                child: _detail(l),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _table(AppLocalizations l) {
    return LayoutBuilder(
      builder: (context, box) {
        final showVersion = box.maxWidth >= 680;
        final showUptime = box.maxWidth >= 520;
        return _tableBody(l, showVersion: showVersion, showUptime: showUptime);
      },
    );
  }

  Widget _tableBody(
    AppLocalizations l, {
    required bool showVersion,
    required bool showUptime,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            DsSpace.xl,
            DsSpace.xl,
            DsSpace.xl,
            DsSpace.md,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  l.featureLabelPartners,
                  style: DsType.display,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
              const SizedBox(width: DsSpace.md),
              Flexible(
                flex: 2,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 260,
                    minWidth: 120,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: DsField(
                      controller: _search,
                      hint: l.serverListSearchHint,
                      icon: Icons.search_rounded,
                      onChanged: _onSearchChanged,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DsSpace.xl),
          child: Row(
            children: [
              _sortChip(l.serverListSortVotes, 'votes'),
              const SizedBox(width: DsSpace.sm),
              _sortChip(l.serverListSortPlayers, 'players'),
              const SizedBox(width: DsSpace.sm),
              _sortChip(l.serverListSortNewest, 'newest'),
              const Spacer(),
              Text('$_total', style: DsType.caption),
            ],
          ),
        ),
        const SizedBox(height: DsSpace.md),
        _header(l, showVersion: showVersion, showUptime: showUptime),
        Container(height: 1, color: DsColor.line),
        Expanded(
          child: _loading
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
              : ListView.builder(
                  controller: _scroll,
                  itemCount: _servers.length + (_loadingMore ? 1 : 0),
                  itemBuilder: (context, i) {
                    if (i >= _servers.length) {
                      return const Padding(
                        padding: EdgeInsets.all(DsSpace.lg),
                        child: Center(
                          child: SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 1.8),
                          ),
                        ),
                      );
                    }
                    return _row(
                      l,
                      _servers[i],
                      i + 1,
                      showVersion: showVersion,
                      showUptime: showUptime,
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _sortChip(String label, String value) {
    final active = _sort == value;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() => _sort = value);
          _load();
        },
        borderRadius: DsRadius.pillR,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: DsSpace.md,
            vertical: DsSpace.sm - 2,
          ),
          decoration: BoxDecoration(
            color: active ? DsColor.accent.withValues(alpha: 0.14) : null,
            borderRadius: DsRadius.pillR,
            border: Border.all(color: active ? DsColor.accent : DsColor.line),
          ),
          child: Text(
            label,
            style: DsType.caption.copyWith(
              color: active ? DsColor.accent : DsColor.textSoft,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(
    AppLocalizations l, {
    required bool showVersion,
    required bool showUptime,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        DsSpace.xl,
        DsSpace.sm,
        DsSpace.xl,
        DsSpace.sm,
      ),
      child: Row(
        children: [
          SizedBox(width: 30, child: Text('#', style: DsType.caption)),
          Expanded(
            flex: 4,
            child: Text(l.serversSection, style: DsType.caption),
          ),
          if (showVersion)
            SizedBox(
              width: 96,
              child: Text(l.versionLabel, style: DsType.caption),
            ),
          SizedBox(
            width: 84,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(l.serverStatPlayers, style: DsType.caption),
            ),
          ),
          if (showUptime)
            SizedBox(
              width: 72,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(l.serverStatUptime, style: DsType.caption),
              ),
            ),
          const SizedBox(width: 44),
        ],
      ),
    );
  }

  Widget _row(
    AppLocalizations l,
    DirectoryServer server,
    int rank, {
    required bool showVersion,
    required bool showUptime,
  }) {
    final selected = _selected?.slug == server.slug;
    final hovered = _hovered == server.slug;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = server.slug),
      onExit: (_) => setState(() => _hovered = null),
      child: GestureDetector(
        onTap: () => setState(() {
          _selected = server;
          _detailOpen = true;
        }),
        onDoubleTap: () => widget.onPlay(server),
        behavior: HitTestBehavior.opaque,
        child: Container(
          decoration: BoxDecoration(
            color: selected
                ? DsColor.accent.withValues(alpha: 0.10)
                : hovered
                ? DsColor.surface
                : null,
            border: Border(
              left: BorderSide(
                color: selected ? DsColor.accent : Colors.transparent,
                width: 2,
              ),
              bottom: BorderSide(color: DsColor.line),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(
            DsSpace.xl - 2,
            DsSpace.sm + 2,
            DsSpace.xl,
            DsSpace.sm + 2,
          ),
          child: Row(
            children: [
              SizedBox(width: 30, child: Text('$rank', style: DsType.mono)),
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    _icon(server, 26),
                    const SizedBox(width: DsSpace.md - 2),
                    Flexible(
                      flex: 3,
                      child: Text(
                        server.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: DsType.bodyStrong,
                      ),
                    ),
                    if (server.featured) ...[
                      const SizedBox(width: DsSpace.sm - 2),
                      Icon(
                        Icons.star_rounded,
                        size: 15,
                        color: DsColor.warning,
                      ),
                    ],
                    const SizedBox(width: DsSpace.md),
                    Flexible(
                      flex: 2,
                      child: Text(
                        '${server.host}:${server.port}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: DsType.caption,
                      ),
                    ),
                  ],
                ),
              ),
              if (showVersion)
                SizedBox(
                  width: 96,
                  child: Tooltip(
                    message: server.version ?? '',
                    child: Text(
                      _shortVersion(server.version),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: DsType.caption,
                    ),
                  ),
                ),
              SizedBox(
                width: 84,
                child: Text(
                  server.avgPlayers.round().toString(),
                  textAlign: TextAlign.right,
                  style: DsType.mono.copyWith(color: DsColor.text),
                ),
              ),
              if (showUptime)
                SizedBox(
                  width: 72,
                  child: Text(
                    '${server.uptime}%',
                    textAlign: TextAlign.right,
                    style: DsType.mono,
                  ),
                ),
              SizedBox(
                width: 44,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedOpacity(
                    duration: DsDuration.fast,
                    opacity: hovered || selected ? 1 : 0,
                    child: DsIconButton(
                      icon: Icons.play_arrow_rounded,
                      size: 30,
                      color: DsColor.accent,
                      tooltip: l.serverCardPlay,
                      onPressed: () => widget.onPlay(server),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _shortVersion(String? version) {
    if (version == null || version.trim().isEmpty) return '—';
    final match = RegExp(r'\d+(\.\d+)+').firstMatch(version);
    return match?.group(0) ?? version;
  }

  Widget _icon(DirectoryServer server, double size) {
    final url = server.iconUrl;
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: DsColor.inset,
        borderRadius: BorderRadius.circular(size * 0.24),
      ),
      child: url == null || url.isEmpty
          ? Icon(Icons.dns_rounded, size: size * 0.5, color: DsColor.textFaint)
          : Image.network(
              url,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Icon(
                Icons.dns_rounded,
                size: size * 0.5,
                color: DsColor.textFaint,
              ),
            ),
    );
  }

  Widget _detail(AppLocalizations l) {
    final server = _selected;
    if (server == null) {
      return Center(
        child: DsEmptyState(
          icon: Icons.dns_rounded,
          title: l.chooseServerTitle,
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(DsSpace.xl),
      children: [
        if (server.bannerUrl != null && server.bannerUrl!.isNotEmpty)
          ClipRRect(
            borderRadius: DsRadius.cardR,
            child: Image.network(
              server.bannerUrl!,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              errorBuilder: (_, _, _) => const SizedBox.shrink(),
            ),
          ),
        const SizedBox(height: DsSpace.lg),
        Row(
          children: [
            _icon(server, 46),
            const SizedBox(width: DsSpace.md),
            Expanded(
              child: Text(
                server.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: DsType.title,
              ),
            ),
          ],
        ),
        const SizedBox(height: DsSpace.md),
        Wrap(
          spacing: DsSpace.sm - 2,
          runSpacing: DsSpace.sm - 2,
          children: [
            if (server.version != null)
              DsBadge(label: server.version!, color: DsColor.textFaint),
            for (final tag in server.tags.take(4))
              DsBadge(label: tag, color: DsColor.textFaint),
          ],
        ),
        if (server.description != null &&
            server.description!.trim().isNotEmpty) ...[
          const SizedBox(height: DsSpace.lg),
          Text(
            server.description!.trim(),
            style: DsType.label.copyWith(height: 1.55),
          ),
        ],
        const SizedBox(height: DsSpace.lg),
        Row(
          children: [
            Expanded(
              child: _statTile(
                l.serverStatPlayers,
                server.avgPlayers.round().toString(),
              ),
            ),
            const SizedBox(width: DsSpace.md),
            Expanded(
              child: _statTile(l.serverStatPeak, '${server.peakPlayers}'),
            ),
          ],
        ),
        const SizedBox(height: DsSpace.md),
        Row(
          children: [
            Expanded(child: _statTile(l.serverStatUptime, '${server.uptime}%')),
            const SizedBox(width: DsSpace.md),
            Expanded(
              child: _statTile(l.serverStatVotesMonth, '${server.votesMonth}'),
            ),
          ],
        ),
        const SizedBox(height: DsSpace.lg),
        DsButton(
          label: l.serverCardPlay,
          icon: Icons.play_arrow_rounded,
          size: DsButtonSize.large,
          expand: true,
          onPressed: () => widget.onPlay(server),
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
                onPressed: () => _copyAddress(server),
              ),
            ),
            const SizedBox(width: DsSpace.sm),
            Expanded(
              child: DsButton(
                label: l.serverCardVote,
                icon: Icons.favorite_rounded,
                tone: DsButtonTone.neutral,
                expand: true,
                onPressed: () => _vote(server),
              ),
            ),
          ],
        ),
        if (server.websiteUrl != null || server.discordUrl != null) ...[
          const SizedBox(height: DsSpace.sm),
          Row(
            children: [
              if (server.discordUrl != null)
                Expanded(
                  child: DsButton(
                    label: l.serverLinkDiscord,
                    icon: Icons.forum_rounded,
                    tone: DsButtonTone.quiet,
                    expand: true,
                    onPressed: () => launchUrl(
                      Uri.parse(server.discordUrl!),
                      mode: LaunchMode.externalApplication,
                    ),
                  ),
                ),
              if (server.discordUrl != null && server.websiteUrl != null)
                const SizedBox(width: DsSpace.sm),
              if (server.websiteUrl != null)
                Expanded(
                  child: DsButton(
                    label: l.serverLinkWebsite,
                    icon: Icons.language_rounded,
                    tone: DsButtonTone.quiet,
                    expand: true,
                    onPressed: () => launchUrl(
                      Uri.parse(server.websiteUrl!),
                      mode: LaunchMode.externalApplication,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }

  Future<void> _copyAddress(DirectoryServer server) async {
    await Clipboard.setData(
      ClipboardData(text: '${server.host}:${server.port}'),
    );
    if (!mounted) return;
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  Future<void> _vote(DirectoryServer server) async {
    final l = AppLocalizations.of(context)!;

    if (AuthService.currentUser == null) {
      AppToast.show(
        context,
        message: l.serverVoteSignInRequired,
        icon: Icons.person_outline,
        color: DsColor.warning,
      );
      return;
    }

    final username = await showDialog<String>(
      context: context,
      builder: (_) => _VoteDialog(server: server),
    );
    if (username == null || !mounted) return;

    final result = await ServerDirectoryService.vote(
      slug: server.slug,
      username: username,
    );
    if (!mounted) return;

    if (result.ok) {
      AppToast.show(
        context,
        message: result.delivered
            ? l.serverVoteDelivered
            : l.serverVoteNoRewards,
        icon: Icons.check_rounded,
        color: DsColor.success,
      );
      _load();
    } else {
      AppToast.show(
        context,
        message: switch (result.error) {
          'sign_in_required' => l.serverVoteSignInRequired,
          'network' => l.serverVoteOffline,
          _ => result.message ?? l.serverVoteFailed,
        },
        icon: Icons.error_outline,
        color: DsColor.danger,
      );
    }
  }

  Widget _statTile(String label, String value) {
    return DsCard(
      padding: const EdgeInsets.all(DsSpace.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: DsType.caption),
          const SizedBox(height: DsSpace.xs),
          Text(value, style: DsType.display.copyWith(fontSize: 24)),
        ],
      ),
    );
  }
}

class _VoteDialog extends StatefulWidget {
  final DirectoryServer server;

  const _VoteDialog({required this.server});

  @override
  State<_VoteDialog> createState() => _VoteDialogState();
}

class _VoteDialogState extends State<_VoteDialog> {
  static final _valid = RegExp(r'^[A-Za-z0-9_]{3,16}$');
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final name = _controller.text.trim();
    final ok = _valid.hasMatch(name);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Container(
          padding: const EdgeInsets.all(DsSpace.xl),
          decoration: BoxDecoration(
            color: DsColor.surface,
            borderRadius: DsRadius.cardR,
            border: Border.all(color: DsColor.line),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l.serverVoteSheetTitle(widget.server.name),
                style: DsType.heading,
              ),
              const SizedBox(height: DsSpace.xs),
              Text(l.serverVoteSheetSubtitle, style: DsType.label),
              const SizedBox(height: DsSpace.lg),
              DsField(
                controller: _controller,
                hint: l.serverVoteSheetHint,
                icon: Icons.person_rounded,
                autofocus: true,
                onChanged: (_) => setState(() {}),
                onSubmitted: (_) {
                  if (ok) Navigator.of(context).pop(name);
                },
              ),
              const SizedBox(height: DsSpace.lg),
              Row(
                children: [
                  Expanded(
                    child: DsButton(
                      label: l.cancel,
                      tone: DsButtonTone.neutral,
                      expand: true,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(width: DsSpace.sm),
                  Expanded(
                    child: DsButton(
                      label: l.serverCardVote,
                      expand: true,
                      onPressed: ok
                          ? () => Navigator.of(context).pop(name)
                          : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
