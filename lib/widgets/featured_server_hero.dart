import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import '../theme/app_theme.dart';
import '../util/partners_servers.dart';
import '../services/server_status_service.dart';
import '../services/theme_service.dart';
import '../widgets/components/app_toast.dart';
import '../l10n/app_localizations.dart';

class FeaturedServerHero extends StatefulWidget {
  static const double height = 190;

  final Future<List<FeaturedServer>>? partnerServersFuture;
  final TextEditingController ipController;
  final TextEditingController portController;
  final bool broadcasting;
  final VoidCallback? onSelected;
  final BorderRadius borderRadius;

  const FeaturedServerHero({
    super.key,
    required this.partnerServersFuture,
    required this.ipController,
    required this.portController,
    this.broadcasting = false,
    this.onSelected,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  });

  @override
  State<FeaturedServerHero> createState() => _FeaturedServerHeroState();
}

class _FeaturedServerHeroState extends State<FeaturedServerHero> {
  List<FeaturedServer> _featuredServers = [];
  late final PageController _heroBgController;
  int _heroBgPage = 0;
  Timer? _heroTimer;
  final Map<String, Future<ServerStatus>> _statusCache = {};
  final Map<String, List<Color>> _paletteCache = {};

  @override
  void initState() {
    super.initState();
    _heroBgController = PageController();
    ThemeService.instance.addListener(_onThemeChanged);
    widget.partnerServersFuture?.then((list) {
      if (!mounted || list.isEmpty) return;
      final featured = list.where((s) => s.featured).toList();
      setState(() => _featuredServers = featured..shuffle(Random()));
      _startHeroTimer();
    });
  }

  void _onThemeChanged() => setState(() {});

  @override
  void dispose() {
    ThemeService.instance.removeListener(_onThemeChanged);
    _heroBgController.dispose();
    _heroTimer?.cancel();
    super.dispose();
  }

  void _startHeroTimer() {
    _heroTimer?.cancel();
    _heroTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!mounted || _featuredServers.isEmpty) return;
      final next = (_heroBgPage + 1) % _featuredServers.length;
      _heroBgController.animateToPage(
        next,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    });
  }

  Future<List<Color>> _getPalette(String url) async {
    if (_paletteCache.containsKey(url)) return _paletteCache[url]!;
    try {
      final generator = await PaletteGenerator.fromImageProvider(
        NetworkImage(url),
        size: const Size(80, 80),
      );
      final colors = [
        generator.vibrantColor?.color,
        generator.lightVibrantColor?.color,
        generator.mutedColor?.color,
        generator.dominantColor?.color,
      ].whereType<Color>().take(3).toList();
      _paletteCache[url] = colors;
      return colors;
    } catch (_) {
      _paletteCache[url] = [];
      return [];
    }
  }

  Future<ServerStatus> _getHeroStatus(FeaturedServer server) {
    final key = '${server.address}:${server.port}';
    return _statusCache.putIfAbsent(
      key,
      () => ServerStatusService.getStatus(server.address, server.port),
    );
  }

  FeaturedServer? get _currentHeroServer => _featuredServers.isEmpty
      ? null
      : _featuredServers[_heroBgPage % _featuredServers.length];

  @override
  Widget build(BuildContext context) {
    final server = _currentHeroServer;
    final broadcasting = widget.broadcasting;
    final card = AppTheme.surfaceRaisedSolid;

    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: SizedBox(
        height: FeaturedServerHero.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            FutureBuilder<List<Color>>(
              future: (_currentHeroServer?.iconUrl ?? '').isNotEmpty
                  ? _getPalette(_currentHeroServer!.iconUrl!)
                  : Future.value([]),
              builder: (context, snap) {
                final colors = snap.data ?? [];
                if (colors.length >= 2) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          colors[0],
                          colors[1],
                          if (colors.length >= 3) colors[2],
                        ],
                      ),
                    ),
                  );
                }
                if (colors.length == 1) {
                  return Container(color: colors[0]);
                }
                return _defaultHeroBg();
              },
            ),
            PageView.builder(
              controller: _heroBgController,
              onPageChanged: (i) => setState(() => _heroBgPage = i),
              itemCount: _featuredServers.isEmpty ? 1 : _featuredServers.length,
              itemBuilder: (_, i) {
                if (_featuredServers.isEmpty) return const SizedBox.shrink();
                final url = _featuredServers[i].iconUrl;
                if (url != null && url.isNotEmpty) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.network(
                            url,
                            height: 150,
                            fit: BoxFit.fitHeight,
                            errorBuilder: (_, __, ___) =>
                                const SizedBox.shrink(),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: const [0.0, 0.40, 0.75, 1.0],
                              colors: [
                                card,
                                card.withValues(alpha: 0.80),
                                card.withValues(alpha: 0.27),
                                card.withValues(alpha: 0.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.3, 0.7, 1.0],
                  colors: [
                    card.withValues(alpha: 0.40),
                    card.withValues(alpha: 0.0),
                    card.withValues(alpha: 0.0),
                    card.withValues(alpha: 0.60),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _heroBadge(
                        icon: Icons.star_rounded,
                        label: AppLocalizations.of(
                          context,
                        )!.featuredServerLabel,
                      ),
                      const Spacer(),
                      if (_featuredServers.length > 1)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            _featuredServers.length.clamp(0, 6),
                            (i) {
                              final active =
                                  i == _heroBgPage % _featuredServers.length;
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.only(left: 4),
                                width: active ? 14 : 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: active
                                      ? Colors.white
                                      : Colors.white.withValues(alpha: 0.25),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              server?.name ?? 'MCCompanion',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                height: 1.15,
                                color: ThemeService.instance.textPrimary,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 220),
                              child: Text(
                                server?.description.isNotEmpty == true
                                    ? server!.description
                                    : AppLocalizations.of(
                                        context,
                                      )!.featuredServerTagline,
                                style: TextStyle(
                                  color: ThemeService.instance.textPrimary
                                      .withValues(alpha: 0.60),
                                  fontSize: 11,
                                  height: 1.35,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 8),
                            if (server != null)
                              _HeroStatusBadge(
                                statusFuture: _getHeroStatus(server),
                              )
                            else
                              _staticStatusBadge(
                                dot: AppTheme.textMuted,
                                label: '...',
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: server == null || broadcasting
                            ? null
                            : () {
                                widget.ipController.text = server.address;
                                widget.portController.text = server.port
                                    .toString();
                                AppToast.show(
                                  context,
                                  message: server.name,
                                  icon: Icons.play_arrow_rounded,
                                  color: AppTheme.accent,
                                );
                                widget.onSelected?.call();
                              },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(
                              alpha: server == null || broadcasting
                                  ? 0.08
                                  : 0.15,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withValues(
                                alpha: server == null || broadcasting
                                    ? 0.10
                                    : 0.30,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                AppLocalizations.of(
                                  context,
                                )!.featuredServerPlay,
                                style: TextStyle(
                                  color: ThemeService.instance.textPrimary
                                      .withValues(
                                        alpha: server == null || broadcasting
                                            ? 0.35
                                            : 1.0,
                                      ),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Icon(
                                Icons.play_arrow_rounded,
                                color: ThemeService.instance.textPrimary
                                    .withValues(
                                      alpha: server == null || broadcasting
                                          ? 0.35
                                          : 1.0,
                                    ),
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _defaultHeroBg() {
    final bg = ThemeService.instance.background;
    final bgLight = Color.lerp(bg, Colors.white, 0.06)!;
    final bgMid = Color.lerp(bg, Colors.black, 0.10)!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [bg, bgLight, bgMid],
        ),
      ),
    );
  }

  Widget _heroBadge({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: AppTheme.accent),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: ThemeService.instance.textPrimary,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _staticStatusBadge({required Color dot, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroStatusBadge extends StatelessWidget {
  final Future<ServerStatus> statusFuture;
  const _HeroStatusBadge({required this.statusFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ServerStatus>(
      future: statusFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return _badge(
            dot: Colors.white.withValues(alpha: 0.40),
            label: '...',
            sub: null,
          );
        }
        final status = snapshot.data!;
        if (!status.isOnline) {
          return _badge(
            dot: AppTheme.error.withValues(alpha: 0.80),
            label: AppLocalizations.of(context)!.statusOffline,
            sub: null,
          );
        }
        final playerText = (status.players != null && status.maxPlayers != null)
            ? '${status.players} / ${status.maxPlayers}'
            : null;
        return _badge(
          dot: const Color(0xFF4ADE80),
          label: AppLocalizations.of(context)!.statusOnline,
          sub: playerText,
        );
      },
    );
  }

  Widget _badge({
    required Color dot,
    required String label,
    required String? sub,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (sub != null) ...[
            const SizedBox(width: 6),
            Container(width: 1, height: 10, color: Colors.white24),
            const SizedBox(width: 6),
            const Icon(Icons.people_rounded, size: 11, color: Colors.white70),
            const SizedBox(width: 4),
            Text(
              sub,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.80),
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
