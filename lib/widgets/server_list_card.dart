import 'package:flutter/material.dart';

import '../design/design.dart';
import '../l10n/app_localizations.dart';
import '../util/directory_server.dart';

class ServerListCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final edition = server.editionBadge;
    final version = server.usefulVersion;
    final meta = [?version, ...server.tags.take(2)].join(
      '  ·  ',
    );
    final banner = server.bannerUrl;

    return DsCard(
      onTap: onOpenDetails,
      highlighted: server.featured,
      accent: DsColor.warning,
      padding: const EdgeInsets.all(DsSpace.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (banner != null && banner.isNotEmpty) ...[
            _Banner(url: banner),
            const SizedBox(height: DsSpace.md),
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Icon(server: server, size: 44),
              const SizedBox(width: DsSpace.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      server.name,
                      style: DsType.bodyStrong,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: DsSpace.xxs),
                    Text(
                      server.connectAddress,
                      style: DsType.caption,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: DsSpace.sm),
                    Wrap(
                      spacing: DsSpace.sm - 2,
                      runSpacing: DsSpace.xs,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        if (server.featured)
                          DsBadge(
                            label: l.serverBadgeFeatured,
                            color: DsColor.warning,
                          ),
                        DsBadge(
                          label: switch (edition) {
                            ServerEdition.java => l.serverEditionJava,
                            ServerEdition.bedrock => l.serverEditionBedrock,
                            ServerEdition.crossplay => l.serverEditionCrossplay,
                          },
                          color: switch (edition) {
                            ServerEdition.java => DsColor.warning,
                            ServerEdition.bedrock => DsColor.info,
                            ServerEdition.crossplay => DsColor.accent,
                          },
                        ),
                        if (meta.isNotEmpty) Text(meta, style: DsType.caption),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: DsSpace.md),
          Row(
            children: [
              Text(
                '#$rank',
                style: DsType.mono.copyWith(
                  color: DsColor.textFaint,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: DsSpace.md),
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
              Icon(
                Icons.schedule_rounded,
                size: 15,
                color: DsColor.textFaint,
              ),
              const SizedBox(width: DsSpace.xs + 1),
              Text(
                '${server.uptime}%',
                style: DsType.caption.copyWith(color: DsColor.textSoft),
              ),
              const Spacer(),
              DsButton(
                label: l.serverCardPlay,
                icon: Icons.play_arrow_rounded,
                size: DsButtonSize.small,
                onPressed: onPlay,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(DsRadius.control - 4),
      child: AspectRatio(
        aspectRatio: 468 / 60,
        child: Image.network(
          url,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.none,
          errorBuilder: (_, _, _) => ColoredBox(color: DsColor.inset),
        ),
      ),
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
        color: DsColor.inset,
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
      color: DsColor.textFaint,
      fontSize: size * 0.4,
      fontWeight: FontWeight.w800,
    ),
  );
}
