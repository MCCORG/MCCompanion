import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../util/user_servers.dart';
import '../../util/partners_servers.dart';
import '../../services/server_status_service.dart';
import '../../services/navigation_controller.dart';
import '../../widgets/components/app_painters.dart';
import '../../widgets/components/app_toast.dart';
import '../../widgets/dialogs/howto_dialogs.dart';
import '../../widgets/featured_server_hero.dart';
import 'server_tabs_section.dart';

enum PanelMode { lan, nintendo, friends, java }

class _ModeConfig {
  final PanelMode mode;
  final FaIconData icon;
  final Color color;
  const _ModeConfig({
    required this.mode,
    required this.icon,
    required this.color,
  });
}

class ConnectionPanel extends StatefulWidget {
  const ConnectionPanel({
    super.key,
    required this.ipController,
    required this.portController,
    required this.broadcastingNotifier,
    required this.onStartBroadcast,
    required this.onStopBroadcast,
    required this.savedServers,
    required this.onServerSelected,
    required this.onManageServers,
    required this.selectedRelayIp,
    required this.onRelayChanged,
    required this.nintendoDnsMode,
    required this.onNintendoDnsModeChanged,
    required this.navigationController,
    required this.partnerServersFuture,
    required this.onOpenPartnerServers,
  });

  final TextEditingController ipController;
  final TextEditingController portController;
  final ValueNotifier<bool> broadcastingNotifier;
  final Future<void> Function(PanelMode) onStartBroadcast;
  final VoidCallback onStopBroadcast;
  final List<UserServer> savedServers;
  final Function(UserServer) onServerSelected;
  final VoidCallback onManageServers;
  final String? selectedRelayIp;
  final void Function(String?) onRelayChanged;
  final bool nintendoDnsMode;
  final ValueChanged<bool> onNintendoDnsModeChanged;
  final NavigationController navigationController;
  final Future<List<FeaturedServer>>? partnerServersFuture;
  final VoidCallback onOpenPartnerServers;

  @override
  State<ConnectionPanel> createState() => _ConnectionPanelState();
}

class _ConnectionPanelState extends State<ConnectionPanel> {
  PanelMode _mode = PanelMode.lan;

  bool _broadcasting = false;
  bool _starting = false;

  List<FeaturedServer> _featuredServers = [];
  late final PageController _heroBgController;
  int _heroBgPage = 0;
  Timer? _heroTimer;

  final Map<String, Future<ServerStatus>> _statusCache = {};

  static const _modes = [
    _ModeConfig(
      mode: PanelMode.lan,
      icon: FontAwesomeIcons.xbox,
      color: AppTheme.modeXbox,
    ),
    _ModeConfig(
      mode: PanelMode.nintendo,
      icon: FontAwesomeIcons.gamepad,
      color: AppTheme.modeNintendo,
    ),
    _ModeConfig(
      mode: PanelMode.friends,
      icon: FontAwesomeIcons.userGroup,
      color: AppTheme.modeFriends,
    ),
    _ModeConfig(
      mode: PanelMode.java,
      icon: FontAwesomeIcons.java,
      color: AppTheme.modeJava,
    ),
  ];

  static const _heroWaves = [
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

  Future<ServerStatus> _getHeroStatus(FeaturedServer server) {
    final key = '${server.address}:${server.port}';
    return _statusCache.putIfAbsent(
      key,
      () => ServerStatusService.getStatus(server.address, server.port),
    );
  }

  @override
  void initState() {
    super.initState();
    _heroBgController = PageController();
    _mode = widget.nintendoDnsMode ? PanelMode.nintendo : PanelMode.lan;
    _broadcasting = widget.broadcastingNotifier.value;

    widget.broadcastingNotifier.addListener(_onBroadcastingChanged);
    widget.ipController.addListener(_onControllerChanged);
    widget.portController.addListener(_onControllerChanged);

widget.partnerServersFuture?.then((list) {
  if (!mounted || list.isEmpty) return;
  final featured = list.where((server) => server.featured).toList();
  setState(() => _featuredServers = featured..shuffle(Random()));
  _startHeroTimer();
});
  }

  void _onBroadcastingChanged() {
    if (mounted) {
      setState(() => _broadcasting = widget.broadcastingNotifier.value);
    }
  }

  void _onControllerChanged() {
    if (mounted) setState(() {});
  }

  void _startHeroTimer() {
    _heroTimer?.cancel();
    _heroTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!mounted || _featuredServers.isEmpty) return;
      if (!_heroBgController.hasClients) return;
      final next = (_heroBgPage + 1) % _featuredServers.length;
      _heroBgController.animateToPage(
        next,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    widget.broadcastingNotifier.removeListener(_onBroadcastingChanged);
    widget.ipController.removeListener(_onControllerChanged);
    widget.portController.removeListener(_onControllerChanged);
    _heroBgController.dispose();
    _heroTimer?.cancel();
    super.dispose();
  }

  Future<void> _handleStart() async {
    if (_starting) return;
    setState(() => _starting = true);

    try {
      await widget.onStartBroadcast(_mode);
    } finally {
      if (mounted) setState(() => _starting = false);
    }

    if (!mounted) return;

    switch (_mode) {
      case PanelMode.lan:
        if (_broadcasting) await HowToDialogs.showXboxInstructions(context);
      case PanelMode.java:
        if (_broadcasting) await HowToDialogs.showJavaInstructions(context);
      case PanelMode.nintendo:
      case PanelMode.friends:
        break;
    }
  }

  FeaturedServer? get _currentHeroServer => _featuredServers.isEmpty
      ? null
      : _featuredServers[_heroBgPage % _featuredServers.length];

  String _modeLabel(PanelMode mode, AppLocalizations loc) => switch (mode) {
    PanelMode.lan => loc.labelXbox,
    PanelMode.nintendo => loc.labelNintendo,
    PanelMode.friends => loc.labelFriends,
    PanelMode.java => loc.labelJava,
  };

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final broadcasting = _broadcasting;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            FeaturedServerHero(
              partnerServersFuture: widget.partnerServersFuture,
              ipController: widget.ipController,
              portController: widget.portController,
              broadcasting: broadcasting,
            ),
            const SizedBox(height: 22),
            _sectionLabel('SELECT MODE'),
            const SizedBox(height: 10),
            _buildModeChips(broadcasting, loc),
            const SizedBox(height: 12),
            _buildBroadcastCard(broadcasting, loc),
            const SizedBox(height: 22),
            _sectionLabel('SERVERS'),
            const SizedBox(height: 10),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 300),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppTheme.borderGray),
                ),
                child: ServerTabsSection(
                  savedServers: widget.savedServers,
                  ipController: widget.ipController,
                  portController: widget.portController,
                  onServerSelected: widget.onServerSelected,
                  onManageServers: widget.onManageServers,
                  broadcasting: broadcasting,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(bool broadcasting, AppLocalizations loc) {
    final server = _currentHeroServer;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
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
            const CustomPaint(painter: AppWavePainter(waves: _heroWaves)),
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
                                      : Colors.white.withOpacity(0.25),
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
                              server?.name ?? 'NetherLink',
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
                                  color: Colors.white.withOpacity(0.60),
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
                              },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(
                              server == null || broadcasting ? 0.08 : 0.15,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(
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
                                  color: Colors.white.withOpacity(
                                    server == null || broadcasting ? 0.35 : 1.0,
                                  ),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white.withOpacity(
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
        color: Colors.black.withOpacity(0.45),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
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
        color: Colors.black.withOpacity(0.45),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
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

  Widget _buildModeChips(bool broadcasting, AppLocalizations loc) {
    return Row(
      children: List.generate(_modes.length, (i) {
        final cfg = _modes[i];
        final isSelected = cfg.mode == _mode;
        final dimmed = broadcasting && !isSelected;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: i < _modes.length - 1 ? 8 : 0),
            child: GestureDetector(
              onTap: broadcasting || isSelected
                  ? null
                  : () {
                      setState(() => _mode = cfg.mode);
                      widget.onNintendoDnsModeChanged(
                        cfg.mode == PanelMode.nintendo ||
                            cfg.mode == PanelMode.friends,
                      );
                    },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 84,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Color.alphaBlend(cfg.color.withOpacity(0.32), AppTheme.surfaceRaised)
                      : AppTheme.surface.withOpacity(0.50),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected
                        ? cfg.color.withOpacity(0.55)
                        : AppTheme.borderLight,
                    width: isSelected ? 1.5 : 1.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      cfg.icon,
                      size: 24,
                      color: isSelected
                          ? cfg.color
                          : dimmed
                          ? AppTheme.textDisabled
                          : AppTheme.textMuted,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _modeLabel(cfg.mode, loc),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: isSelected
                            ? cfg.color
                            : dimmed
                            ? AppTheme.textDisabled
                            : AppTheme.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildBroadcastCard(bool broadcasting, AppLocalizations loc) {
    final cfg = _modes.firstWhere((c) => c.mode == _mode);
    final color = broadcasting ? AppTheme.error : cfg.color;
    final hasServer = widget.ipController.text.isNotEmpty;
    final serverLabel = hasServer
        ? '${widget.ipController.text}:${widget.portController.text}'
        : 'No server selected';

    final buttonLabel = switch (_mode) {
      PanelMode.lan => loc.startBroadcasting,
      PanelMode.nintendo => loc.startNintendoMode,
      PanelMode.friends => loc.startFriendsMode,
      PanelMode.java => loc.startJavaMode,
    };

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 88,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(color: AppTheme.surfaceRaised),
            Container(color: color.withOpacity(0.14)),
            CustomPaint(
              painter: AppNoisePainter(
                color: color,
                opacity: 0.055,
                seed: 42,
                count: 180,
              ),
            ),
            CustomPaint(
              painter: AppWavePainter(
                waves: [
                  WaveConfig(
                    yFraction: 0.45,
                    amplitude: 12,
                    frequency: 3.0,
                    phase: 0.5,
                    color: color,
                    opacity: 0.18,
                    strokeWidth: 1.5,
                  ),
                  WaveConfig(
                    yFraction: 0.65,
                    amplitude: 8,
                    frequency: 4.0,
                    phase: 1.2,
                    color: color,
                    opacity: 0.09,
                    strokeWidth: 1.0,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: color.withOpacity(0.40)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: color.withOpacity(0.28)),
                          ),
                          child: Icon(
                            broadcasting
                                ? Icons.sensors_rounded
                                : Icons.sensors_off_rounded,
                            color: color,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                              ),
                              const SizedBox(height: 3),
                              Text(
                                broadcasting
                                    ? loc.stopBroadcasting
                                    : buttonLabel,
                                style: const TextStyle(
                                  color: AppTheme.textPrimary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Icon(
                                    Icons.dns_rounded,
                                    size: 10,
                                    color: hasServer
                                        ? color.withOpacity(0.70)
                                        : AppTheme.textDisabled,
                                  ),
                                  const SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      serverLabel,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: hasServer
                                            ? AppTheme.textSecondary
                                            : AppTheme.textDisabled,
                                        fontStyle: hasServer
                                            ? FontStyle.normal
                                            : FontStyle.italic,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: _starting
                        ? null
                        : broadcasting
                        ? widget.onStopBroadcast
                        : _handleStart,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: _starting ? color.withOpacity(0.55) : color,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: _starting
                          ? SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white.withOpacity(0.80),
                              ),
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  broadcasting
                                      ? Icons.stop_rounded
                                      : Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  broadcasting ? loc.stop : loc.start,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) => Text(
    text,
    style: const TextStyle(
      color: AppTheme.textMuted,
      fontSize: 10,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.4,
    ),
  );
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
            dot: Colors.white.withOpacity(0.40),
            label: '...',
            sub: null,
          );
        }
        final status = snapshot.data!;
        if (!status.isOnline) {
          return _badge(
            dot: AppTheme.error.withOpacity(0.80),
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
        color: Colors.black.withOpacity(0.45),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
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
            Container(
              width: 1,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 7),
              color: Colors.white.withOpacity(0.25),
            ),
            const Icon(Icons.people_rounded, size: 11, color: Colors.white70),
            const SizedBox(width: 4),
            Text(
              sub,
              style: TextStyle(
                color: Colors.white.withOpacity(0.80),
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
