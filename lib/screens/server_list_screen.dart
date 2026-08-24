import 'dart:async';

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/server_directory_service.dart';
import '../theme/app_theme.dart';
import '../util/directory_server.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/components/swipe_back.dart';
import '../widgets/server_list_card.dart';
import 'server_detail_screen.dart';

class ServerListScreen extends StatefulWidget {
  const ServerListScreen({
    super.key,
    required this.ipController,
    required this.portController,
    required this.onBack,
    this.onPlay,
  });

  final TextEditingController ipController;
  final TextEditingController portController;
  final VoidCallback onBack;
  final VoidCallback? onPlay;

  @override
  State<ServerListScreen> createState() => _ServerListScreenState();
}

class _ServerListScreenState extends State<ServerListScreen> {
  List<(String, String)> _sorts(AppLocalizations l) => [
    ('votes', l.serverListSortVotes),
    ('players', l.serverListSortPlayers),
    ('peak', l.serverListSortPeak),
    ('newest', l.serverListSortNewest),
    ('name', l.serverListSortName),
  ];

  List<(String, String)> _editions(AppLocalizations l) => [
    ('', l.serverListEditionAny),
    ('java', l.serverListEditionJava),
    ('MCPE', l.serverListEditionBedrock),
  ];

  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  final List<DirectoryServer> _servers = [];
  List<ServerTag> _tags = const [];

  String _query = '';
  String? _tag;
  String _edition = '';
  String _sort = 'votes';

  int _page = 0;
  int _total = 0;
  bool _loading = true;
  bool _loadingMore = false;
  bool _failed = false;

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _load();
    ServerDirectoryService.fetchTags().then((tags) {
      if (mounted) setState(() => _tags = tags);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      if (!mounted || value.trim() == _query) return;
      setState(() => _query = value.trim());
      _load();
    });
  }

  void _onScroll() {
    if (_loading || _loadingMore) return;
    if (_servers.length >= _total) return;
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 600) _loadMore();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _failed = false;
      _page = 0;
    });

    final page = await ServerDirectoryService.fetchServers(
      search: _query,
      tag: _tag,
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
      _failed = page.servers.isEmpty && _query.isEmpty && _tag == null;
    });
  }

  Future<void> _loadMore() async {
    setState(() => _loadingMore = true);

    final next = _page + 1;
    final page = await ServerDirectoryService.fetchServers(
      search: _query,
      tag: _tag,
      edition: _edition,
      sort: _sort,
      page: next,
    );

    if (!mounted) return;
    setState(() {
      _page = next;
      _servers.addAll(page.servers);
      if (page.total > 0) _total = page.total;
      _loadingMore = false;
    });
  }

  Future<void> _openDetails(DirectoryServer server) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ServerDetailScreen(
          server: server,
          onPlay: (chosen) {
            Navigator.of(context).pop();
            _play(chosen);
          },
        ),
      ),
    );
  }

  void _play(DirectoryServer server) {
    widget.ipController.text = server.host;
    widget.portController.text = server.port.toString();

    AppToast.show(
      context,
      message: AppLocalizations.of(context)!.selectedFeaturedServer(server.name),
      icon: Icons.play_arrow_rounded,
      color: AppTheme.success,
      duration: const Duration(seconds: 2),
    );

    (widget.onPlay ?? widget.onBack)();
  }

  @override
  Widget build(BuildContext context) {
    return SwipeBack(
      onBack: widget.onBack,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: RefreshIndicator(
            onRefresh: _load,
            color: AppTheme.accent,
            backgroundColor: AppTheme.surfaceRaised,
            child: CustomScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
                  sliver: SliverToBoxAdapter(child: _filters()),
                ),
                if (_tags.isNotEmpty)
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
                    sliver: SliverToBoxAdapter(child: _tagChips()),
                  ),
                if (_loading)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: _Spinner()),
                  )
                else if (_servers.isEmpty)
                  SliverFillRemaining(hasScrollBody: false, child: _empty())
                else
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 16),
                    sliver: SliverList.separated(
                      itemCount: _servers.length + (_loadingMore ? 1 : 0),
                      separatorBuilder: (_, _) => const SizedBox(height: 8),
                      itemBuilder: (context, i) {
                        if (i >= _servers.length) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(child: _Spinner()),
                          );
                        }
                        final server = _servers[i];
                        return ServerListCard(
                          server: server,
                          rank: i + 1,
                          onPlay: () => _play(server),
                          onOpenDetails: () => _openDetails(server),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _filters() {
    final l = AppLocalizations.of(context)!;
    return Column(
      children: [
        TextField(
          controller: _searchController,
          onChanged: _onSearchChanged,
          style: TextStyle(color: AppTheme.textPrimary, fontSize: 14),
          decoration: InputDecoration(
            hintText: l.serverListSearchHint,
            hintStyle: TextStyle(color: AppTheme.textMuted, fontSize: 14),
            prefixIcon: Icon(Icons.search, size: 18, color: AppTheme.textMuted),
            filled: true,
            fillColor: AppTheme.surfaceRaised,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
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
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _dropdown(
                value: _edition,
                items: _editions(l),
                onChanged: (value) {
                  setState(() => _edition = value);
                  _load();
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _dropdown(
                value: _sort,
                items: _sorts(l),
                onChanged: (value) {
                  setState(() => _sort = value);
                  _load();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _dropdown({
    required String value,
    required List<(String, String)> items,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: AppTheme.surfaceRaised,
          borderRadius: BorderRadius.circular(10),
          icon: Icon(Icons.expand_more, size: 18, color: AppTheme.textMuted),
          style: TextStyle(color: AppTheme.textPrimary, fontSize: 13),
          items: items
              .map(
                (item) => DropdownMenuItem(
                  value: item.$1,
                  child: Text(item.$2, overflow: TextOverflow.ellipsis),
                ),
              )
              .toList(growable: false),
          onChanged: (selected) {
            if (selected != null) onChanged(selected);
          },
        ),
      ),
    );
  }

  Widget _tagChips() {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _tags.length + 1,
        separatorBuilder: (_, _) => const SizedBox(width: 6),
        itemBuilder: (context, i) {
          if (i == 0) {
            return _chip(
                label: AppLocalizations.of(context)!.serverListAllCategories,
                count: null,
                active: _tag == null,
                onTap: () {
                  setState(() => _tag = null);
                  _load();
                });
          }
          final tag = _tags[i - 1];
          return _chip(
            label: tag.tag,
            count: tag.count,
            active: _tag == tag.tag,
            onTap: () {
              setState(() => _tag = _tag == tag.tag ? null : tag.tag);
              _load();
            },
          );
        },
      ),
    );
  }

  Widget _chip({
    required String label,
    required int? count,
    required bool active,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active
              ? AppTheme.accent.withValues(alpha: 0.12)
              : AppTheme.surfaceRaised,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: active
                ? AppTheme.accent.withValues(alpha: 0.35)
                : AppTheme.borderGray,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: active ? AppTheme.accent : AppTheme.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: 'monospace',
              ),
            ),
            if (count != null) ...[
              const SizedBox(width: 5),
              Text(
                '$count',
                style: TextStyle(color: AppTheme.textMuted, fontSize: 11),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _empty() {
    final l = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppTheme.surfaceRaised,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppTheme.borderGray),
            ),
            child: Icon(
              _failed ? Icons.cloud_off_rounded : Icons.search_off_rounded,
              size: 24,
              color: AppTheme.textMuted,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            _failed ? l.serverListLoadFailed : l.serverListNoMatch,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _failed ? l.serverListLoadFailedHint : l.serverListNoMatchHint,
            style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _Spinner extends StatelessWidget {
  const _Spinner();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
        color: AppTheme.textMuted,
      ),
    );
  }
}
