import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../design/design.dart';
import '../util/directory_server.dart';
import '../theme/app_tokens.dart';

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
            borderRadius: DsRadius.cardR,
            color: Colors.transparent,
          ),
          child: _card(),
        ),
      ),
    );
  }

  Widget _card() {
    return Container(
      decoration: BoxDecoration(
        color: DsColor.surface,
        borderRadius: DsRadius.cardR,
        border: Border.all(
          color: _hovered
              ? DsColor.accent.withValues(alpha: 0.35)
              : DsColor.line,
        ),
      ),
      padding: const EdgeInsets.all(DsSpace.lg),
      child: LayoutBuilder(
        builder: (context, constraints) =>
            constraints.maxWidth >= _wideBreakpoint ? _wide() : _stacked(),
      ),
    );
  }

  Widget _wide() => _stacked();

  Widget _stacked() {
    final l = AppLocalizations.of(context)!;
    final meta = [
      if (server.version != null) server.version!,
      ...server.tags.take(2),
    ].join('  ·  ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Icon(server: server, size: 46),
            const SizedBox(width: DsSpace.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        '#$rank',
                        style: DsType.mono.copyWith(
                          color: DsColor.textFaint,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: DsSpace.sm - 2),
                      Expanded(
                        child: Text(
                          server.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: DsType.bodyStrong,
                        ),
                      ),
                      if (server.featured) ...[
                        const SizedBox(width: DsSpace.sm - 2),
                        DsBadge(
                          label: l.serverBadgeFeatured,
                          color: DsColor.warning,
                        ),
                      ],
                      const SizedBox(width: DsSpace.xs),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 20,
                        color: _hovered ? DsColor.accent : DsColor.textFaint,
                      ),
                    ],
                  ),
                  const SizedBox(height: DsSpace.xxs),
                  Text(
                    '${server.host}:${server.port}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: DsType.caption,
                  ),
                  if (meta.isNotEmpty) ...[
                    const SizedBox(height: DsSpace.xxs),
                    Text(
                      meta,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: DsType.caption,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: DsSpace.md),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.people_outline_rounded,
                    size: 15,
                    color: DsColor.textFaint,
                  ),
                  const SizedBox(width: DsSpace.xs + 1),
                  Text(
                    server.avgPlayers.round().toString(),
                    style: DsType.caption.copyWith(color: DsColor.textSoft),
                  ),
                  const SizedBox(width: DsSpace.md),
                  Text(
                    '${server.uptime}%',
                    style: DsType.caption.copyWith(color: DsColor.textSoft),
                  ),
                ],
              ),
            ),
            DsButton(
              label: l.serverCardViewServer,
              tone: DsButtonTone.quiet,
              size: DsButtonSize.small,
              onPressed: onOpenDetails,
            ),
            const SizedBox(width: DsSpace.xs),
            DsButton(
              label: l.serverCardPlay,
              icon: Icons.play_arrow_rounded,
              size: DsButtonSize.small,
              onPressed: onPlay,
            ),
          ],
        ),
      ],
    );
  }
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
        borderRadius: AppRadius.small,
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
