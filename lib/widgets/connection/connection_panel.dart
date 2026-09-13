import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../../models/user_model.dart';
import '../../theme/app_theme.dart';
import '../../util/user_servers.dart';
import '../../util/connector_prefs.dart';
import '../../util/partners_servers.dart';
import '../../services/navigation_controller.dart';
import '../../util/howto_prefs.dart';
import '../../widgets/dialogs/howto_dialogs.dart';
import '../../widgets/featured_server_banner.dart';
import '../../design/design.dart';
import 'link_panel.dart';

enum PanelMode { lan, nintendo, friends }

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
  ];

  @override
  void initState() {
    super.initState();
    _mode = widget.nintendoDnsMode ? PanelMode.nintendo : PanelMode.lan;
    unawaited(_restoreMode());
    _broadcasting = widget.broadcastingNotifier.value;

    widget.broadcastingNotifier.addListener(_onBroadcastingChanged);
    widget.ipController.addListener(_onControllerChanged);
    widget.portController.addListener(_onControllerChanged);
  }

  Future<void> _restoreMode() async {
    final saved = await ConnectorPrefs.loadMode();
    if (!mounted || saved == null) return;
    final mode = PanelMode.values.firstWhere(
      (m) => m.name == saved,
      orElse: () => _mode,
    );
    if (mode == _mode) return;
    setState(() => _mode = mode);
    widget.onNintendoDnsModeChanged(
      mode == PanelMode.nintendo || mode == PanelMode.friends,
    );
  }

  void _applyMode(PanelMode mode) {
    setState(() => _mode = mode);
    unawaited(ConnectorPrefs.saveMode(mode.name));
    widget.onNintendoDnsModeChanged(
      mode == PanelMode.nintendo || mode == PanelMode.friends,
    );
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

    if (!await HowToPrefs.isAutoShowEnabled(HowToTopic.xbox)) return;
    if (!mounted) return;

    switch (_mode) {
      case PanelMode.lan:
        await HowToDialogs.showXboxInstructions(context);
      case PanelMode.nintendo:
      case PanelMode.friends:
        break;
    }
  }

  String _modeLabel(PanelMode mode, AppLocalizations loc) => switch (mode) {
    PanelMode.lan => loc.labelXbox,
    PanelMode.nintendo => loc.labelNintendo,
    PanelMode.friends => loc.labelFriends,
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

  Widget _hero(bool broadcasting) => FeaturedServerBanner(
    partnerServersFuture: widget.partnerServersFuture,
    ipController: widget.ipController,
    portController: widget.portController,
    broadcasting: broadcasting,
  );

  Widget _buildNarrowLayout(bool broadcasting, AppLocalizations loc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _hero(broadcasting),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            DsSpace.gutter,
            DsSpace.xl,
            DsSpace.gutter,
            DsSpace.xxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLinkPanel(broadcasting, loc),
              if (_mode == PanelMode.lan &&
                  widget.bedrockAccounts.length > 1) ...[
                const SizedBox(height: DsSpace.md),
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
              const SizedBox(height: DsSpace.lg),
              _buildStartButton(broadcasting, loc),
              const SizedBox(height: DsSpace.md),
              Align(
                alignment: Alignment.center,
                child: DsButton(
                  label: loc.console,
                  icon: Icons.terminal_rounded,
                  tone: DsButtonTone.quiet,
                  size: DsButtonSize.small,
                  onPressed: () =>
                      widget.navigationController.showConsole(context),
                ),
              ),
              if (widget.navChipsBuilder != null) ...[
                const SizedBox(height: DsSpace.section),
                widget.navChipsBuilder!(false),
              ],
            ],
          ),
        ),
      ],
    );
  }

  String _modeDescription(PanelMode mode, AppLocalizations loc) =>
      switch (mode) {
        PanelMode.lan => loc.howToXboxSubtitle,
        PanelMode.nintendo => loc.howToNintendoSubtitle,
        PanelMode.friends => loc.howToFriendsSubtitle,
      };

  IconData _modeIcon(PanelMode mode) => switch (mode) {
    PanelMode.lan => Icons.sports_esports_rounded,
    PanelMode.nintendo => Icons.videogame_asset_rounded,
    PanelMode.friends => Icons.group_rounded,
  };

  Widget _buildLinkPanel(bool broadcasting, AppLocalizations loc) {
    return LinkPanel<PanelMode>(
      consoleTitle: loc.modeLabel,
      serverTitle: loc.serversSection,
      manageLabel: loc.manageServers,
      changeLabel: loc.changeLabel,
      chooseLabel: loc.chooseServerTitle,
      modes: [
        for (final cfg in _modes)
          LinkOption(
            value: cfg.mode,
            label: _modeLabel(cfg.mode, loc),
            icon: _modeIcon(cfg.mode),
            description: _modeDescription(cfg.mode, loc),
          ),
      ],
      mode: _mode,
      onModeChanged: broadcasting ? null : _applyMode,
      servers: widget.savedServers,
      selectedAddress: widget.ipController.text.trim(),
      selectedPort: int.tryParse(widget.portController.text),
      onServerSelected: widget.onServerSelected,
      onManageServers: widget.onManageServers,
      broadcasting: broadcasting,
      packTitle: loc.rpScreenTitle,
      packLabel: widget.resourcePackConfigured
          ? (widget.resourcePackName ?? loc.rpScreenTitle)
          : loc.none,
      packStatus: widget.resourcePackConfigured
          ? (widget.resourcePackEnabled ? loc.active : loc.rpDisabled)
          : null,
      packEnabled: widget.resourcePackConfigured && widget.resourcePackEnabled,
      packConfigured: widget.resourcePackConfigured,
      packLoading: widget.resourcePackLoading,
      onPackChange: widget.onResourcePack,
    );
  }

  Widget _buildWideLayout(bool broadcasting, AppLocalizations loc) {
    final selected = _selectedServer;
    final address = widget.ipController.text.trim();
    final hasTarget = address.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.all(DsSpace.xxl),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(loc.featureLabelConnector, style: DsType.display),
                const SizedBox(height: DsSpace.xl),
                DsCard(
                  padding: const EdgeInsets.all(DsSpace.xl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(loc.serversSection, style: DsType.caption),
                      const SizedBox(height: DsSpace.xs),
                      Text(
                        selected?.name ??
                            (hasTarget ? address : loc.chooseServerTitle),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: DsType.display.copyWith(fontSize: 26),
                      ),
                      if (hasTarget) ...[
                        const SizedBox(height: DsSpace.xxs),
                        Text(
                          '$address:${widget.portController.text}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: DsType.label,
                        ),
                      ],
                      const SizedBox(height: DsSpace.xl),
                      Text(loc.modeLabel, style: DsType.caption),
                      const SizedBox(height: DsSpace.sm),
                      Row(
                        children: [
                          for (final cfg in _modes) ...[
                            if (cfg != _modes.first)
                              const SizedBox(width: DsSpace.sm),
                            Expanded(child: _modeChip(cfg, broadcasting, loc)),
                          ],
                        ],
                      ),
                      if (_mode == PanelMode.lan &&
                          widget.bedrockAccounts.length > 1) ...[
                        const SizedBox(height: DsSpace.md),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: _BedrockAccountSelector(
                            accounts: widget.bedrockAccounts,
                            selectedXuid: widget.selectedBedrockXuid,
                            onChanged: widget.onBedrockAccountChanged,
                            color: _modes
                                .firstWhere((c) => c.mode == _mode)
                                .color,
                            enabled: !broadcasting,
                          ),
                        ),
                      ],
                      const SizedBox(height: DsSpace.xl),
                      _packRow(loc, broadcasting),
                      const SizedBox(height: DsSpace.xl),
                      _buildStartButton(broadcasting, loc),
                    ],
                  ),
                ),
                const SizedBox(height: DsSpace.lg),
                _hero(broadcasting),
              ],
            ),
          ),
          const SizedBox(width: DsSpace.xxl),
          Expanded(flex: 2, child: _buildWideServerList(broadcasting, loc)),
        ],
      ),
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

  Widget _modeChip(_ModeConfig cfg, bool broadcasting, AppLocalizations loc) {
    final active = cfg.mode == _mode;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: broadcasting ? null : () => _applyMode(cfg.mode),
        borderRadius: DsRadius.controlR,
        child: AnimatedContainer(
          duration: DsDuration.fast,
          padding: const EdgeInsets.symmetric(
            horizontal: DsSpace.md,
            vertical: DsSpace.md,
          ),
          decoration: BoxDecoration(
            color: active
                ? DsColor.accent.withValues(alpha: 0.12)
                : DsColor.inset,
            borderRadius: DsRadius.controlR,
            border: Border.all(color: active ? DsColor.accent : DsColor.line),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _modeIcon(cfg.mode),
                size: 17,
                color: active ? DsColor.accent : DsColor.textFaint,
              ),
              const SizedBox(width: DsSpace.sm),
              Flexible(
                child: Text(
                  _modeLabel(cfg.mode, loc),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: DsType.body.copyWith(
                    color: active ? DsColor.text : DsColor.textSoft,
                    fontWeight: active ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _packRow(AppLocalizations loc, bool broadcasting) {
    final configured = widget.resourcePackConfigured;
    final on = configured && widget.resourcePackEnabled;

    return Row(
      children: [
        Icon(
          Icons.extension_rounded,
          size: 18,
          color: on ? DsColor.accent : DsColor.textFaint,
        ),
        const SizedBox(width: DsSpace.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(loc.rpScreenTitle, style: DsType.caption),
              const SizedBox(height: DsSpace.xxs),
              Text(
                configured
                    ? (widget.resourcePackName ?? loc.rpScreenTitle)
                    : loc.none,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: DsType.bodyStrong,
              ),
            ],
          ),
        ),
        if (configured)
          DsSwitch(
            value: on,
            onChanged: broadcasting || widget.onResourcePackToggle == null
                ? null
                : (value) => widget.onResourcePackToggle!(value),
          ),
        const SizedBox(width: DsSpace.sm),
        DsButton(
          label: loc.changeLabel,
          tone: DsButtonTone.neutral,
          size: DsButtonSize.small,
          onPressed: broadcasting ? null : widget.onResourcePack,
        ),
      ],
    );
  }

  Widget _buildWideServerList(bool broadcasting, AppLocalizations loc) {
    final selectedAddress = widget.ipController.text.trim();
    final selectedPort = int.tryParse(widget.portController.text);
    final servers = widget.savedServers;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(child: Text(loc.serversSection, style: DsType.heading)),
            DsButton(
              label: loc.manageServers,
              icon: Icons.tune_rounded,
              tone: DsButtonTone.quiet,
              size: DsButtonSize.small,
              onPressed: broadcasting ? null : widget.onManageServers,
            ),
          ],
        ),
        const SizedBox(height: DsSpace.md),
        if (servers.isEmpty)
          DsCard(
            padding: EdgeInsets.zero,
            child: DsEmptyState(
              icon: Icons.dns_rounded,
              title: loc.chooseServerTitle,
              action: DsButton(
                label: loc.addServer,
                icon: Icons.add_rounded,
                tone: DsButtonTone.neutral,
                size: DsButtonSize.small,
                onPressed: broadcasting ? null : widget.onManageServers,
              ),
            ),
          )
        else
          for (final server in servers) ...[
            if (server != servers.first) const SizedBox(height: DsSpace.sm),
            DsTile(
              title: server.name,
              subtitle: '${server.address}:${server.port}',
              icon: Icons.dns_rounded,
              dense: true,
              selected:
                  server.address == selectedAddress &&
                  server.port == selectedPort,
              trailing:
                  server.address == selectedAddress &&
                      server.port == selectedPort
                  ? Icon(
                      Icons.check_circle_rounded,
                      size: 20,
                      color: DsColor.accent,
                    )
                  : null,
              onTap: broadcasting
                  ? null
                  : () => widget.onServerSelected(server),
            ),
          ],
      ],
    );
  }

  Widget _buildStartButton(bool broadcasting, AppLocalizations loc) {
    final hasServer = widget.ipController.text.trim().isNotEmpty;
    final busy = _starting || widget.resourcePackLoading;
    final enabled = !busy && (broadcasting || hasServer);

    final label = broadcasting
        ? loc.stopBroadcasting
        : switch (_mode) {
            PanelMode.lan => loc.startBroadcasting,
            PanelMode.nintendo => loc.startNintendoMode,
            PanelMode.friends => loc.startFriendsMode,
          };

    return DsButton(
      label: label,
      icon: broadcasting ? Icons.stop_rounded : Icons.play_arrow_rounded,
      tone: broadcasting ? DsButtonTone.danger : DsButtonTone.accent,
      size: DsButtonSize.large,
      busy: busy,
      expand: true,
      onPressed: enabled
          ? (broadcasting ? widget.onStopBroadcast : _handleStart)
          : null,
    );
  }
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
