import 'dart:async';
import 'package:palette_generator/palette_generator.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/server_status_service.dart';
import '../../screens/server_detail_screen.dart';
import '../../util/partners_servers.dart';

class LandingPartnerBanner extends StatefulWidget {
  final Future<List<FeaturedServer>> future;
  final VoidCallback onTap;
  final void Function(String ip, int port)? onPlay;
  const LandingPartnerBanner({
    super.key,
    required this.future,
    required this.onTap,
    this.onPlay,
  });

  @override
  State<LandingPartnerBanner> createState() => LandingPartnerBannerState();
}

class LandingPartnerBannerState extends State<LandingPartnerBanner> {
  List<FeaturedServer> _servers = [];
  final Map<String, bool?> _statusCache = {};

  void _open(FeaturedServer server) {
    if (server.slug == null) {
      widget.onTap();
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ServerDetailScreen.fromSlug(
          slug: server.slug!,
          onPlay: (chosen) {
            Navigator.of(context).pop();
            widget.onPlay?.call(chosen.host, chosen.port);
          },
        ),
      ),
    );
  }
  int _index = 0;
  Timer? _rotateTimer;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    widget.future.then((all) {
      final featured = all.where((s) => s.featured).toList();
      if (!mounted) return;
      setState(() {
        _servers = featured;
        _loaded = true;
      });
      if (featured.isEmpty) return;
      for (var i = 0; i < featured.length; i++) {
        Future.delayed(Duration(milliseconds: i * 200), () {
          if (mounted) _fetchStatus(featured[i]);
        });
      }
      _startRotation();
    });
  }

  @override
  void dispose() {
    _rotateTimer?.cancel();
    super.dispose();
  }

  void _startRotation() {
    _rotateTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted || _servers.isEmpty) return;
      setState(() => _index = (_index + 1) % _servers.length);
    });
  }

  Future<void> _fetchStatus(FeaturedServer s) async {
    final result = await ServerStatusService.getStatus(s.address, s.port);
    if (mounted) setState(() => _statusCache[s.address] = result.isOnline);
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) return const LandingPartnerBannerSkeleton();
    if (_servers.isEmpty) return const SizedBox();
    final s = _servers[_index];
    final online = _statusCache[s.address];
    final dotColor = online == null
        ? AppTheme.textDisabled
        : online
        ? AppTheme.success
        : AppTheme.error;

    return GestureDetector(
      onTap: () => _open(s),
      child: Container(
        margin: const EdgeInsets.fromLTRB(14, 6, 14, 0),
        constraints: const BoxConstraints(minHeight: 90),
        decoration: BoxDecoration(
          color: AppTheme.surfaceRaised,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (s.iconUrl != null && s.iconUrl!.isNotEmpty)
                Positioned.fill(
                  child: FutureBuilder<PaletteGenerator>(
                    future: PaletteGenerator.fromImageProvider(
                      NetworkImage(s.iconUrl!),
                      size: const Size(80, 80),
                    ),
                    builder: (context, snap) {
                      final g = snap.data;
                      if (g == null) return const SizedBox.shrink();
                      final colors = [
                        g.vibrantColor?.color,
                        g.lightVibrantColor?.color,
                        g.mutedColor?.color,
                        g.dominantColor?.color,
                      ].whereType<Color>().take(3).toList();
                      if (colors.isEmpty) return const SizedBox.shrink();
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: colors.length >= 2
                                ? [
                                    colors[0].withValues(alpha: 0.12),
                                    colors[1].withValues(alpha: 0.22),
                                    if (colors.length >= 3)
                                      colors[2].withValues(alpha: 0.16),
                                  ]
                                : [
                                    colors[0].withValues(alpha: 0.12),
                                    colors[0].withValues(alpha: 0.22),
                                  ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Container(width: 3, color: AppTheme.accent),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.circle, color: dotColor, size: 8),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        transitionBuilder: (child, anim) => FadeTransition(
                          opacity: anim,
                          child: SlideTransition(
                            position: Tween(
                              begin: const Offset(0, 0.3),
                              end: Offset.zero,
                            ).animate(anim),
                            child: child,
                          ),
                        ),
                        child: Column(
                          key: ValueKey(_index),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              s.name,
                              style: TextStyle(
                                color: AppTheme.textPrimary,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              s.description,
                              style: TextStyle(
                                color: AppTheme.textMuted,
                                fontSize: 11,
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: List.generate(
                                _servers.length,
                                (i) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.only(right: 4),
                                  width: i == _index ? 12 : 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: i == _index
                                        ? AppTheme.accent
                                        : AppTheme.borderLight,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (widget.onPlay != null)
                      GestureDetector(
                        onTap: () => widget.onPlay!(s.address, s.port),
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: AppTheme.accent.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppTheme.accent.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: AppTheme.accent,
                            size: 22,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LandingPartnerBannerSkeleton extends StatefulWidget {
  const LandingPartnerBannerSkeleton({super.key});
  @override
  State<LandingPartnerBannerSkeleton> createState() => LandingPartnerBannerSkeletonState();
}

class LandingPartnerBannerSkeletonState extends State<LandingPartnerBannerSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, w) {
        final shimmer = Color.lerp(
          AppTheme.surfaceRaised,
          AppTheme.borderLight,
          _anim.value,
        )!;
        return Container(
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: shimmer,
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }
}
