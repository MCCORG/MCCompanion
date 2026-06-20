import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../../models/user_model.dart';
import '../../theme/app_theme.dart';
import '../../util/user_servers.dart';
import '../../util/partners_servers.dart';
import '../../services/navigation_controller.dart';
import '../../widgets/components/app_painters.dart';
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
    required this.onResourcePack,
    required this.selectedRelayIp,
    required this.onRelayChanged,
    required this.nintendoDnsMode,
    required this.onNintendoDnsModeChanged,
    required this.navigationController,
    required this.partnerServersFuture,
    required this.onOpenPartnerServers,
    this.bedrockAccounts = const [],
    this.selectedBedrockXuid,
    this.onBedrockAccountChanged,
    this.navChips,
    this.resourcePackActive = false,
    this.resourcePackLoading = false,
    this.onDeleteServer,
  });

  final TextEditingController ipController;
  final TextEditingController portController;
  final ValueNotifier<bool> broadcastingNotifier;
  final Future<void> Function(PanelMode) onStartBroadcast;
  final VoidCallback onStopBroadcast;
  final List<UserServer> savedServers;
  final Function(UserServer) onServerSelected;
  final VoidCallback onManageServers;
  final VoidCallback onResourcePack;
  final String? selectedRelayIp;
  final void Function(String?) onRelayChanged;
  final bool nintendoDnsMode;
  final ValueChanged<bool> onNintendoDnsModeChanged;
  final NavigationController navigationController;
  final Future<List<FeaturedServer>>? partnerServersFuture;
  final VoidCallback onOpenPartnerServers;
  final List<BedrockAccount> bedrockAccounts;
  final String? selectedBedrockXuid;
  final ValueChanged<String>? onBedrockAccountChanged;
  final Widget? navChips;
  final bool resourcePackActive;
  final bool resourcePackLoading;
  final Function(int index)? onDeleteServer;

  @override
  State<ConnectionPanel> createState() => _ConnectionPanelState();
}

class _ConnectionPanelState extends State<ConnectionPanel> {
  PanelMode _mode = PanelMode.lan;

  bool _broadcasting = false;
  bool _starting = false;

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

  @override
  void initState() {
    super.initState();
    _mode = widget.nintendoDnsMode ? PanelMode.nintendo : PanelMode.lan;
    _broadcasting = widget.broadcastingNotifier.value;

    widget.broadcastingNotifier.addListener(_onBroadcastingChanged);
    widget.ipController.addListener(_onControllerChanged);
    widget.portController.addListener(_onControllerChanged);
  }

  void _onBroadcastingChanged() {
    if (mounted) {
      setState(() => _broadcasting = widget.broadcastingNotifier.value);
    }
  }

  void _onControllerChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    widget.broadcastingNotifier.removeListener(_onBroadcastingChanged);
    widget.ipController.removeListener(_onControllerChanged);
    widget.portController.removeListener(_onControllerChanged);
    super.dispose();
  }

  Future<void> _handleStart() async {
    if (_starting || widget.resourcePackLoading) return;
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

    return LayoutBuilder(builder: (context, constraints) {
      final isDesktop = constraints.maxWidth > 800;
      return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: isDesktop ? double.infinity : 720),
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
            if (widget.navChips != null) ...[
              const SizedBox(height: 10),
              widget.navChips!,
            ],
            const SizedBox(height: 18),
            _sectionLabel(loc.selectModeSection),
            const SizedBox(height: 10),
            _buildModeChips(broadcasting, loc),
            const SizedBox(height: 12),
            _buildBroadcastCard(broadcasting, loc),
            const SizedBox(height: 22),
            _sectionLabel(loc.serversSection),
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
                  onResourcePack: widget.onResourcePack,
                  resourcePackActive: widget.resourcePackActive,
                  broadcasting: broadcasting,
                  onDelete: widget.onDeleteServer,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
    });
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
                      ? Color.alphaBlend(
                          cfg.color.withValues(alpha: 0.32),
                          AppTheme.surfaceRaisedSolid,
                        )
                      : AppTheme.surface.withValues(alpha: 0.50),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected
                        ? cfg.color.withValues(alpha: 0.55)
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
        : loc.noServerSelected;

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
            Container(color: AppTheme.surfaceRaisedSolid),
            Container(color: color.withValues(alpha: 0.14)),
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
                border: Border.all(color: color.withValues(alpha: 0.40)),
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
                            color: color.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: color.withValues(alpha: 0.28)),
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
                              Row(),
                              const SizedBox(height: 3),
                              Text(
                                broadcasting
                                    ? loc.stopBroadcasting
                                    : buttonLabel,
                                style: TextStyle(
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
                                        ? color.withValues(alpha: 0.70)
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
                              if (_mode == PanelMode.lan &&
                                  widget.bedrockAccounts.length > 1) ...[
                                const SizedBox(height: 5),
                                _BedrockAccountSelector(
                                  accounts: widget.bedrockAccounts,
                                  selectedXuid: widget.selectedBedrockXuid,
                                  onChanged: widget.onBedrockAccountChanged,
                                  color: color,
                                  enabled: !broadcasting,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: (_starting || widget.resourcePackLoading)
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
                        color: (_starting || widget.resourcePackLoading) ? color.withValues(alpha: 0.55) : color,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: (_starting || widget.resourcePackLoading)
                          ? SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white.withValues(alpha: 0.80),
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
    style: TextStyle(
      color: AppTheme.textMuted,
      fontSize: 10,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.4,
    ),
  );
}

class _BedrockAccountSelector extends StatelessWidget {
  final List<BedrockAccount> accounts;
  final String? selectedXuid;
  final ValueChanged<String>? onChanged;
  final Color color;
  final bool enabled;

  const _BedrockAccountSelector({
    required this.accounts,
    required this.selectedXuid,
    required this.onChanged,
    required this.color,
    required this.enabled,
  });

  BedrockAccount get _selected => accounts.firstWhere(
    (a) => a.xboxXuid == selectedXuid,
    orElse: () => accounts.first,
  );

  @override
  Widget build(BuildContext context) {
    final account = _selected;
    final label = account.xboxGamertag ?? account.xboxXuid;

    return GestureDetector(
      onTap: enabled ? () => _showPicker(context) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.sports_esports_rounded,
            size: 10,
            color: enabled ? color.withValues(alpha: 0.70) : AppTheme.textDisabled,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: enabled ? AppTheme.textSecondary : AppTheme.textDisabled,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(width: 3),
          Icon(
            Icons.arrow_drop_down_rounded,
            size: 13,
            color: enabled ? AppTheme.textMuted : AppTheme.textDisabled,
          ),
        ],
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppTheme.surfaceRaisedSolid,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.selectBedrockAccount,
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              ...accounts.map((a) {
                final isSelected =
                    a.xboxXuid == selectedXuid ||
                    (selectedXuid == null && a == accounts.first);
                final name = a.xboxGamertag ?? a.xboxXuid;
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.sports_esports_rounded,
                    color: isSelected ? AppTheme.accent : AppTheme.textMuted,
                    size: 20,
                  ),
                  title: Text(
                    name,
                    style: TextStyle(
                      color: isSelected
                          ? AppTheme.textPrimary
                          : AppTheme.textSecondary,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                  trailing: isSelected
                      ? Icon(
                          Icons.check_rounded,
                          color: AppTheme.accent,
                          size: 18,
                        )
                      : null,
                  onTap: () {
                    onChanged?.call(a.xboxXuid);
                    Navigator.pop(context);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
