import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../util/partners_servers.dart';
import '../services/server_status_service.dart';
import '../widgets/components/app_painters.dart';
import '../widgets/components/app_toast.dart';

class FeaturedServerHero extends StatefulWidget {
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

  List<WaveConfig> get _heroWaves => [
    WaveConfig(
      yFraction: 0.72,
      amplitude: 18,
      frequency: 2.5,
      phase: 0.3,
      color: AppTheme.accent,
      opacity: 0.12,
      strokeWidth: 1.8,
    ),
    WaveConfig(
      yFraction: 0.55,
      amplitude: 10,
      frequency: 3.8,
      phase: 1.8,
      color: AppTheme.accent,
      opacity: 0.07,
      strokeWidth: 1.2,
    ),
    WaveConfig(
      yFraction: 0.88,
      amplitude: 7,
      frequency: 5.0,
      phase: 0.9,
      color: Colors.white,
      opacity: 0.04,
      strokeWidth: 1.0,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _heroBgController = PageController();
    widget.partnerServersFuture?.then((list) {
      if (!mounted || list.isEmpty) return;
      final featured = list.where((s) => s.featured).toList();
      setState(() => _featuredServers = featured..shuffle(Random()));
      _startHeroTimer();
    });
  }

  @override
  void dispose() {
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

    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: SizedBox(
        height: 230,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _featuredServers.isEmpty
                ? _defaultHeroBg()
                : PageView.builder(
                    controller: _heroBgController,
                    onPageChanged: (i) => setState(() => _heroBgPage = i),
                    itemCount: _featuredServers.length,
                    itemBuilder: (_, i) {
                      final url = _featuredServers[i].iconUrl;
                      if (url != null && url.isNotEmpty) {
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            _defaultHeroBg(),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Image.network(
                                url,
                                height: double.infinity,
                                fit: BoxFit.fitHeight,
                                errorBuilder: (_, __, ___) =>
                                    const SizedBox.shrink(),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  stops: [0.0, 0.45, 0.72, 1.0],
                                  colors: [
                                    Color(0xFF0D0B1E),
                                    Color(0xEE0D0B1E),
                                    Color(0x660D0B1E),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return _defaultHeroBg();
                    },
                  ),
            const CustomPaint(
              painter: AppNoisePainter(
                color: Colors.white,
                opacity: 0.030,
                seed: 99,
                count: 320,
              ),
            ),
            CustomPaint(painter: AppWavePainter(waves: _heroWaves)),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.4, 1.0],
                  colors: [
                    Color(0x55000000),
                    Color(0x00000000),
                    Color(0xBB000000),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _heroBadge(
                        icon: Icons.star_rounded,
                        label: 'FEATURED SERVER',
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
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                height: 1.2,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 220),
                              child: Text(
                                server?.description.isNotEmpty == true
                                    ? server!.description
                                    : 'Connect and start your adventure.',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.60),
                                  fontSize: 11,
                                  height: 1.5,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 10),
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
                            color: Colors.white.withValues(alpha: 
                              server == null || broadcasting ? 0.08 : 0.15,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 
                                server == null || broadcasting ? 0.10 : 0.30,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Play',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 
                                    server == null || broadcasting ? 0.35 : 1.0,
                                  ),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white.withValues(alpha: 
                                  server == null || broadcasting ? 0.35 : 1.0,
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

  Widget _defaultHeroBg() => Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF0D0D28), Color(0xFF16113A), Color(0xFF0A1830)],
      ),
    ),
  );

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
            style: const TextStyle(
              color: Colors.white,
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
            label: 'Offline',
            sub: null,
          );
        }
        final playerText = (status.players != null && status.maxPlayers != null)
            ? '${status.players} / ${status.maxPlayers}'
            : null;
        return _badge(
          dot: const Color(0xFF4ADE80),
          label: 'Online',
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
