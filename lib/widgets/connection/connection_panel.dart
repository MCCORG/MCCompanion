import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../../models/user_model.dart';
import '../../theme/app_theme.dart';
import '../../util/user_servers.dart';
import '../../util/partners_servers.dart';
import '../../services/navigation_controller.dart';
import '../../widgets/components/app_painters.dart';
import '../../util/howto_prefs.dart';
import '../../widgets/dialogs/howto_dialogs.dart';
import '../../widgets/featured_server_hero.dart';
import 'my_servers_tab.dart';
import 'server_picker_sheet.dart';

enum PanelMode { lan, nintendo, friends, direct }

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
    this.navChipsBuilder,
    this.resourcePackConfigured = false,
    this.resourcePackEnabled = false,
    this.resourcePackName,
    this.onResourcePackToggle,
    this.resourcePackLoading = false,
    this.onDeleteServer,
    this.availableHeight,
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
  final Widget Function(bool consoleVisible)? navChipsBuilder;

  final bool resourcePackConfigured;
  final bool resourcePackEnabled;
  final String? resourcePackName;
  final ValueChanged<bool>? onResourcePackToggle;
  final bool resourcePackLoading;
  final Function(int index)? onDeleteServer;

  final double? availableHeight;

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
      mode: PanelMode.direct,
      icon: FontAwesomeIcons.bolt,
      color: AppTheme.modeDirect,
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

    if (!mounted || !_broadcasting) return;

    final topic = switch (_mode) {
      PanelMode.direct => HowToTopic.direct,
      _ => HowToTopic.xbox,
    };
    if (!await HowToPrefs.isAutoShowEnabled(topic)) return;
    if (!mounted) return;

    switch (_mode) {
      case PanelMode.lan:
        await HowToDialogs.showXboxInstructions(context);
      case PanelMode.direct:
        await HowToDialogs.showDirectInstructions(context);
      case PanelMode.nintendo:
      case PanelMode.friends:
        break;
    }
  }

  String _modeLabel(PanelMode mode, AppLocalizations loc) => switch (mode) {
    PanelMode.lan => loc.labelXbox,
    PanelMode.nintendo => loc.labelNintendo,
    PanelMode.friends => loc.labelFriends,
    PanelMode.direct => loc.labelDirect,
  };

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final broadcasting = _broadcasting;

    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 900;
        return Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: wide ? 1180 : 720),
            child: wide
                ? _buildWideLayout(broadcasting, loc)
                : _buildNarrowLayout(broadcasting, loc),
          ),
        );
      },
    );
  }

  Widget _hero(bool broadcasting) => FeaturedServerHero(
    partnerServersFuture: widget.partnerServersFuture,
    ipController: widget.ipController,
    portController: widget.portController,
    broadcasting: broadcasting,
  );

  Widget _spreadBelowHero(Widget steps) {
    final available = widget.availableHeight;
    if (available == null) return steps;

    final remaining = available - FeaturedServerHero.defaultHeight;
    if (remaining <= 0) return steps;

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: remaining),
      child: Center(child: steps),
    );
  }

  Widget _buildNarrowLayout(bool broadcasting, AppLocalizations loc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _hero(broadcasting),
        _spreadBelowHero(
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 22),
              _buildConfigColumn(broadcasting, loc),
              const SizedBox(height: 30),
              _buildActionColumn(broadcasting, loc),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWideLayout(bool broadcasting, AppLocalizations loc) {
    final available = widget.availableHeight;
    final rowHeight = available != null
        ? (available - 24).clamp(520.0, 1100.0)
        : 620.0;

    return SizedBox(
      height: rowHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 4, child: _buildWideLeft(broadcasting, loc)),
          const SizedBox(width: 32),
          Expanded(flex: 3, child: _buildWideRight(broadcasting, loc)),
        ],
      ),
    );
  }

  Widget _buildWideLeft(bool broadcasting, AppLocalizations loc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _hero(broadcasting),
        const SizedBox(height: 34),
        _stepLabel(null, loc.selectModeSection),
        const SizedBox(height: 10),
        _buildModeChips(broadcasting, loc),
        if (_mode == PanelMode.lan && widget.bedrockAccounts.length > 1) ...[
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: _BedrockAccountSelector(
              accounts: widget.bedrockAccounts,
              selectedXuid: widget.selectedBedrockXuid,
              onChanged: widget.onBedrockAccountChanged,
              color: _modes.firstWhere((c) => c.mode == _mode).color,
              enabled: !broadcasting,
            ),
          ),
        ],
        const SizedBox(height: 30),
        _buildStartButton(broadcasting, loc),
        const SizedBox(height: 26),
        _buildResourcePackRow(broadcasting, loc),
        const Spacer(),
        if (widget.navChipsBuilder != null) widget.navChipsBuilder!(false),
      ],
    );
  }

  Widget _buildWideRight(bool broadcasting, AppLocalizations loc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _stepLabel(null, loc.serversSection),
        const SizedBox(height: 10),
        Expanded(child: _buildInlineServerList(broadcasting, loc)),
      ],
    );
  }

  Widget _buildConfigColumn(bool broadcasting, AppLocalizations loc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _stepLabel('1', loc.serversSection),
        const SizedBox(height: 10),
        _buildServerCard(broadcasting, loc),
        const SizedBox(height: 30),
        _stepLabel('2', loc.selectModeSection),
        const SizedBox(height: 10),
        _buildModeChips(broadcasting, loc),
        if (_mode == PanelMode.lan && widget.bedrockAccounts.length > 1) ...[
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: _BedrockAccountSelector(
              accounts: widget.bedrockAccounts,
              selectedXuid: widget.selectedBedrockXuid,
              onChanged: widget.onBedrockAccountChanged,
              color: _modes.firstWhere((c) => c.mode == _mode).color,
              enabled: !broadcasting,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildActionColumn(bool broadcasting, AppLocalizations loc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildStartButton(broadcasting, loc),
        const SizedBox(height: 22),
        _buildResourcePackRow(broadcasting, loc),
        if (widget.navChipsBuilder != null) ...[
          const SizedBox(height: 24),
          widget.navChipsBuilder!(false),
        ],
      ],
    );
  }

  Widget _buildModeChips(bool broadcasting, AppLocalizations loc) {
    const gap = 8.0;

    const minChipWidth = 88.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final total = constraints.maxWidth;

        var perRow = _modes.length;
        if ((total - gap * (perRow - 1)) / perRow < minChipWidth) {
          perRow = (total - gap * 2) / 3 >= minChipWidth ? 3 : 2;
        }

        final singleRow = perRow >= _modes.length;
        final chipWidth = (total - gap * (perRow - 1)) / perRow;

        return Wrap(
          spacing: gap,
          runSpacing: gap,
          alignment: WrapAlignment.center,
          children: [
            for (final cfg in _modes)
              SizedBox(
                width: chipWidth,
                child: _modeChip(cfg, broadcasting, loc, tall: singleRow),
              ),
          ],
        );
      },
    );
  }

  Widget _modeChip(
    _ModeConfig cfg,
    bool broadcasting,
    AppLocalizations loc, {
    required bool tall,
  }) {
    final isSelected = cfg.mode == _mode;
    final dimmed = broadcasting && !isSelected;

    return _Hoverable(
      onTap: broadcasting || isSelected
          ? null
          : () {
              setState(() => _mode = cfg.mode);
              widget.onNintendoDnsModeChanged(
                cfg.mode == PanelMode.nintendo || cfg.mode == PanelMode.friends,
              );
            },
      builder: (hovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: tall ? 84 : 74,
        decoration: BoxDecoration(
          color: isSelected
              ? Color.alphaBlend(
                  cfg.color.withValues(alpha: 0.32),
                  AppTheme.surfaceRaisedSolid,
                )
              : hovered
              ? Color.alphaBlend(
                  cfg.color.withValues(alpha: 0.12),
                  AppTheme.surfaceRaisedSolid,
                )
              : AppTheme.surface.withValues(alpha: 0.50),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? cfg.color.withValues(alpha: 0.55)
                : hovered
                ? cfg.color.withValues(alpha: 0.35)
                : AppTheme.borderLight,
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              cfg.icon,
              size: tall ? 24 : 21,
              color: isSelected
                  ? cfg.color
                  : dimmed
                  ? AppTheme.textDisabled
                  : AppTheme.textMuted,
            ),
            SizedBox(height: tall ? 8 : 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                _modeLabel(cfg.mode, loc),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
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
            ),
          ],
        ),
      ),
    );
  }

  void _openServerPicker() {
    ServerPickerSheet.show(
      context,
      savedServers: widget.savedServers,
      ipController: widget.ipController,
      portController: widget.portController,
      onServerSelected: widget.onServerSelected,
      onManageServers: widget.onManageServers,
      onDelete: widget.onDeleteServer,
    );
  }

  UserServer? get _selectedServer {
    final address = widget.ipController.text.trim();
    final port = int.tryParse(widget.portController.text);
    if (address.isEmpty) return null;
    for (final server in widget.savedServers) {
      if (server.address == address && server.port == port) return server;
    }
    return null;
  }

  Widget _buildServerCard(bool broadcasting, AppLocalizations loc) {
    final address = widget.ipController.text.trim();
    final hasServer = address.isNotEmpty;
    final saved = _selectedServer;
    final title = saved?.name ?? (hasServer ? address : loc.noServerSelected);
    final subtitle = hasServer
        ? '$address:${widget.portController.text}'
        : widget.savedServers.isEmpty
        ? loc.noServerYet.split('\n').first
        : loc.chooseServerTitle;

    return _Hoverable(
      onTap: broadcasting ? null : _openServerPicker,
      builder: (hovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: hovered ? AppTheme.surfaceRaised : AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: hovered
                ? AppTheme.accent.withValues(alpha: 0.35)
                : hasServer
                ? AppTheme.borderGray
                : AppTheme.borderLight,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: hasServer
                    ? AppTheme.accent.withValues(alpha: 0.12)
                    : AppTheme.surfaceRaised,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.dns_rounded,
                size: 17,
                color: hasServer ? AppTheme.accent : AppTheme.textMuted,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: hasServer
                          ? AppTheme.textPrimary
                          : AppTheme.textMuted,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: AppTheme.textMuted, fontSize: 11),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            if (!broadcasting)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    loc.changeLabel,
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 18,
                    color: AppTheme.textMuted,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInlineServerList(bool broadcasting, AppLocalizations loc) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.borderLight),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: MyServersTab(
              savedServers: widget.savedServers,
              ipController: widget.ipController,
              portController: widget.portController,
              onServerSelected: widget.onServerSelected,
              broadcasting: broadcasting,
              onDelete: widget.onDeleteServer,
              selectedAddress: widget.ipController.text.trim(),
              selectedPort: int.tryParse(widget.portController.text),
            ),
          ),
          const Divider(height: 1, thickness: 1, color: AppTheme.borderDim),
          _Hoverable(
            onTap: broadcasting ? null : widget.onManageServers,
            builder: (hovered) => AnimatedContainer(
              duration: const Duration(milliseconds: 140),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
              color: hovered
                  ? AppTheme.surfaceRaised.withValues(alpha: 0.55)
                  : Colors.transparent,
              child: Row(
                children: [
                  Icon(
                    Icons.settings_rounded,
                    size: 14,
                    color: broadcasting
                        ? AppTheme.textDisabled
                        : hovered
                        ? AppTheme.accent
                        : AppTheme.textMuted,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    loc.manageServers,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: broadcasting
                          ? AppTheme.textDisabled
                          : hovered
                          ? AppTheme.accent
                          : AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResourcePackRow(bool broadcasting, AppLocalizations loc) {
    final configured = widget.resourcePackConfigured;
    final on = configured && widget.resourcePackEnabled;
    final canToggle =
        configured && !broadcasting && widget.onResourcePackToggle != null;

    final subtitle = !configured
        ? loc.rpNoPackSelected
        : widget.resourcePackName ??
              (on ? loc.rpActiveOnConnect : loc.rpDisabled);

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface.withValues(alpha: 0.60),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: on
              ? AppTheme.accent.withValues(alpha: 0.30)
              : AppTheme.borderLight,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Expanded(
            child: _Hoverable(
              onTap: broadcasting ? null : widget.onResourcePack,
              builder: (hovered) => AnimatedContainer(
                duration: const Duration(milliseconds: 140),
                color: hovered
                    ? AppTheme.surfaceRaised.withValues(alpha: 0.55)
                    : Colors.transparent,
                padding: const EdgeInsets.fromLTRB(14, 14, 8, 14),
                child: Row(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: on
                            ? AppTheme.accent.withValues(alpha: 0.12)
                            : AppTheme.surfaceRaised,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.extension_rounded,
                        size: 16,
                        color: broadcasting
                            ? AppTheme.textDisabled
                            : on
                            ? AppTheme.accent
                            : AppTheme.textMuted,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            loc.rpScreenTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: broadcasting
                                  ? AppTheme.textDisabled
                                  : AppTheme.textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            subtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!broadcasting) ...[
                      Text(
                        loc.changeLabel,
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 18,
                        color: AppTheme.textMuted,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          Container(width: 1, height: 32, color: AppTheme.borderDim),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: widget.resourcePackLoading
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Switch.adaptive(
                    value: on,
                    onChanged: canToggle
                        ? (value) => widget.onResourcePackToggle!(value)
                        : null,
                    activeThumbColor: Colors.white,
                    activeTrackColor: AppTheme.accent,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartButton(bool broadcasting, AppLocalizations loc) {
    final cfg = _modes.firstWhere((c) => c.mode == _mode);
    final color = broadcasting ? AppTheme.error : cfg.color;
    final hasServer = widget.ipController.text.trim().isNotEmpty;
    final busy = _starting || widget.resourcePackLoading;
    final enabled = !busy && (broadcasting || hasServer);

    final label = broadcasting
        ? loc.stopBroadcasting
        : switch (_mode) {
            PanelMode.lan => loc.startBroadcasting,
            PanelMode.nintendo => loc.startNintendoMode,
            PanelMode.friends => loc.startFriendsMode,
            PanelMode.direct => loc.startDirectMode,
          };

    return _Hoverable(
      onTap: enabled
          ? (broadcasting ? widget.onStopBroadcast : _handleStart)
          : null,
      builder: (hovered) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 62,
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 140),
                color: enabled
                    ? (hovered
                          ? Color.alphaBlend(
                              Colors.white.withValues(alpha: 0.12),
                              color,
                            )
                          : color)
                    : Color.alphaBlend(
                        color.withValues(alpha: 0.28),
                        AppTheme.surfaceRaisedSolid,
                      ),
              ),
              CustomPaint(
                painter: AppNoisePainter(
                  color: Colors.white,
                  opacity: 0.05,
                  seed: 42,
                  count: 160,
                ),
              ),
              CustomPaint(
                painter: AppWavePainter(
                  waves: [
                    WaveConfig(
                      yFraction: 0.42,
                      amplitude: 10,
                      frequency: 2.6,
                      phase: 0.5,
                      color: Colors.white,
                      opacity: 0.16,
                      strokeWidth: 1.4,
                    ),
                    WaveConfig(
                      yFraction: 0.68,
                      amplitude: 7,
                      frequency: 3.6,
                      phase: 1.2,
                      color: Colors.white,
                      opacity: 0.09,
                      strokeWidth: 1.0,
                    ),
                  ],
                ),
              ),
              Center(
                child: busy
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              broadcasting
                                  ? Icons.stop_rounded
                                  : Icons.play_arrow_rounded,
                              color: Colors.white.withValues(
                                alpha: enabled ? 1.0 : 0.55,
                              ),
                              size: 22,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  label,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: TextStyle(
                                    color: Colors.white.withValues(
                                      alpha: enabled ? 1.0 : 0.55,
                                    ),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stepLabel(String? step, String text) => Row(
    children: [
      if (step != null) ...[
        Container(
          width: 18,
          height: 18,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppTheme.surfaceRaised,
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.borderGray),
          ),
          child: Text(
            step,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
      Text(
        text,
        style: TextStyle(
          color: AppTheme.textMuted,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.4,
        ),
      ),
    ],
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
            color: enabled
                ? color.withValues(alpha: 0.70)
                : AppTheme.textDisabled,
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

class _Hoverable extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget Function(bool hovered) builder;

  const _Hoverable({required this.onTap, required this.builder});

  @override
  State<_Hoverable> createState() => _HoverableState();
}

class _HoverableState extends State<_Hoverable> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onTap != null;
    return MouseRegion(
      cursor: enabled ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: enabled ? (_) => setState(() => _hovered = true) : null,
      onExit: enabled ? (_) => setState(() => _hovered = false) : null,
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: widget.builder(enabled && _hovered),
      ),
    );
  }
}
