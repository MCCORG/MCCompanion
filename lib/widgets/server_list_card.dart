import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../util/directory_server.dart';

class ServerListCard extends StatefulWidget {
  const ServerListCard({
    super.key,
    required this.server,
    required this.rank,
    required this.onPlay,
    this.onOpenDetails,
  });

  final DirectoryServer server;
  final int rank;

  final VoidCallback onPlay;

  final VoidCallback? onOpenDetails;

  static const _amber = Color(0xFFF59E0B);
  static const _purple = Color(0xFFA78BFA);

  @override
  State<ServerListCard> createState() => _ServerListCardState();
}

class _ServerListCardState extends State<ServerListCard> {
  bool _hovered = false;

  DirectoryServer get server => widget.server;
  int get rank => widget.rank;
  VoidCallback get onPlay => widget.onPlay;
  VoidCallback? get onOpenDetails => widget.onOpenDetails;

  static const _wideBreakpoint = 700.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: onOpenDetails,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: _hovered ? AppTheme.surfaceLight : Colors.transparent,
          ),
          child: _card(),
        ),
      ),
    );
  }

  Widget _card() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: server.featured
              ? ServerListCard._amber.withValues(alpha: 0.30)
              : _hovered
              ? AppTheme.accent.withValues(alpha: 0.35)
              : AppTheme.borderGray,
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: LayoutBuilder(
        builder: (context, constraints) => constraints.maxWidth >= _wideBreakpoint
            ? _wide()
            : _stacked(),
      ),
    );
  }

  Widget _wide() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 116,
          child: Column(
            children: [
              _Icon(server: server, size: 64),
              const SizedBox(height: 6),
              Text(
                server.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '#$rank',
                style: TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_hasBanner) ...[_banner(), const SizedBox(height: 8)],
              if (server.blurb != null) ...[_blurb(), const SizedBox(height: 8)],
              _Badges(server: server),
              const SizedBox(height: 9),
              _viewServer(),
            ],
          ),
        ),
        const SizedBox(width: 14),

        SizedBox(
          width: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Address(server: server),
              const SizedBox(height: 8),
              _Stats(server: server),
              const SizedBox(height: 8),
              _actions(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _stacked() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            _Icon(server: server, size: 52),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    server.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '#$rank',
                    style: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (_hasBanner) ...[const SizedBox(height: 10), _banner()],
        if (server.blurb != null) ...[const SizedBox(height: 9), _blurb()],
        const SizedBox(height: 9),
        _Badges(server: server),
        const SizedBox(height: 9),
        _viewServer(),
        const SizedBox(height: 10),
        _Address(server: server),
        const SizedBox(height: 10),
        _Stats(server: server),
        const SizedBox(height: 10),
        _actions(),
      ],
    );
  }

  bool get _hasBanner =>
      server.bannerUrl != null && server.bannerUrl!.isNotEmpty;

  Widget _banner() => ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Image.network(
      server.bannerUrl!,
      fit: BoxFit.contain,
      alignment: Alignment.centerLeft,
      errorBuilder: (_, _, _) => const SizedBox.shrink(),
    ),
  );

  Widget _blurb() => Text(
    server.blurb!,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: AppTheme.textSecondary,
      fontSize: 13,
      height: 1.45,
    ),
  );

  Widget _viewServer() => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        AppLocalizations.of(context)!.serverCardViewServer,
        style: TextStyle(
          color: _hovered ? AppTheme.accent : AppTheme.textMuted,
          fontSize: 12.5,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(width: 4),
      Icon(
        Icons.arrow_forward_rounded,
        size: 13,
        color: _hovered ? AppTheme.accent : AppTheme.textMuted,
      ),
    ],
  );

  Widget _actions() => Row(
    children: [
      Expanded(
        child: FilledButton(
          onPressed: onPlay,
          style: FilledButton.styleFrom(
            backgroundColor: AppTheme.accent,
            foregroundColor: const Color(0xFF0D1A18),
            padding: const EdgeInsets.symmetric(vertical: 11),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: Text(
            AppLocalizations.of(context)!.serverCardPlay,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: OutlinedButton(
          onPressed: onOpenDetails,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppTheme.accent,
            side: BorderSide(color: AppTheme.accent.withValues(alpha: 0.4)),
            padding: const EdgeInsets.symmetric(vertical: 11),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: Text(
            AppLocalizations.of(context)!.serverCardVote,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    ],
  );
}


class _Icon extends StatelessWidget {
  const _Icon({required this.server, required this.size});

  final DirectoryServer server;
  final double size;

  @override
  Widget build(BuildContext context) {
    final letter = (server.name.isNotEmpty ? server.name : server.host)
        .trim()
        .characters
        .first
        .toUpperCase();

    return ClipRRect(
      borderRadius: BorderRadius.circular(size * 0.22),
      child: Container(
        width: size,
        height: size,
        color: AppTheme.surface,
        alignment: Alignment.center,
        child: server.iconUrl != null && server.iconUrl!.isNotEmpty
            ? Image.network(
                server.iconUrl!,
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => _letter(letter),
              )
            : _letter(letter),
      ),
    );
  }

  Widget _letter(String letter) => Text(
    letter,
    style: TextStyle(
      color: AppTheme.textMuted,
      fontSize: size * 0.4,
      fontWeight: FontWeight.w800,
    ),
  );
}

class _Badges extends StatelessWidget {
  const _Badges({required this.server});

  final DirectoryServer server;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final edition = switch (server.editionBadge) {
      ServerEdition.java => (l.serverEditionJava, const Color(0xFFF59E0B)),
      ServerEdition.bedrock => (l.serverEditionBedrock, AppTheme.info),
      ServerEdition.crossplay => (l.serverEditionCrossplay, ServerListCard._purple),
    };

    return Wrap(
      spacing: 6,
      runSpacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (server.featured)
          _Pill(label: l.serverBadgeFeatured, color: ServerListCard._amber),
        _Pill(label: edition.$1, color: edition.$2),
        if (server.usefulVersion != null)
          Text(
            server.usefulVersion!,
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 11,
              fontFamily: 'monospace',
            ),
          ),
        ...server.tags.take(3).map(
          (tag) => _Pill(label: tag, color: AppTheme.textSecondary, quiet: true),
        ),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.label, required this.color, this.quiet = false});

  final String label;
  final Color color;
  final bool quiet;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: quiet ? AppTheme.surface : color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: quiet ? AppTheme.borderGray : color.withValues(alpha: 0.26),
        ),
      ),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          color: quiet ? AppTheme.textSecondary : color,
          fontSize: 9.5,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}

class _Address extends StatefulWidget {
  const _Address({required this.server});

  final DirectoryServer server;

  @override
  State<_Address> createState() => _AddressState();
}

class _AddressState extends State<_Address> {
  bool _copied = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
              child: Text(
                widget.server.connectAddress,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 12.5,
                  fontFamily: 'monospace',
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await Clipboard.setData(
                ClipboardData(text: widget.server.connectAddress),
              );
              if (!mounted) return;
              setState(() => _copied = true);
              await Future<void>.delayed(const Duration(milliseconds: 1500));
              if (mounted) setState(() => _copied = false);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              child: Text(
                _copied
                    ? AppLocalizations.of(context)!.serverCopied
                    : AppLocalizations.of(context)!.serverCopyIp,
                style: TextStyle(
                  color: _copied ? AppTheme.success : AppTheme.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Stats extends StatelessWidget {
  const _Stats({required this.server});

  final DirectoryServer server;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final rows = <(String, String, Color)>[
      (
        l.serverStatPlayers,
        server.avgPlayers.round().toString(),
        AppTheme.textPrimary,
      ),
      (
        l.serverStatVotesMonth,
        '${server.votesMonth}',
        server.votesMonth > 0 ? AppTheme.accent : AppTheme.textSecondary,
      ),
      (l.serverStatVotesAllTime, '${server.votesAllTime}', AppTheme.textSecondary),
      (l.serverStatUptime, '${server.uptime}%', AppTheme.textSecondary),
    ];

    return Column(
      children: rows
          .map(
            (row) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    row.$1,
                    style: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 12,
                      fontFamily: 'monospace',
                    ),
                  ),
                  Text(
                    row.$2,
                    style: TextStyle(
                      color: row.$3,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(growable: false),
    );
  }
}
