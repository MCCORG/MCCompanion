import 'dart:async';
import 'dart:async' show unawaited;
import 'package:flutter/material.dart';
import '../widgets/components/swipe_back.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../l10n/app_localizations.dart';
import '../network/socket_handler.dart';
import '../network/broadcast_manager.dart';
import '../util/logger.dart';
import '../util/user_servers.dart';
import '../util/user_servers_storage.dart';
import '../util/partners_servers.dart';
import '../constants/app_constants.dart';
import '../theme/app_theme.dart';
import '../widgets/connection/connection_panel.dart';
import '../widgets/components/app_toast.dart';
import '../services/region_detector.dart';
import '../network/broadcast_mode.dart';
import '../services/navigation_controller.dart';
import '../services/review_service.dart';
import '../services/user_service.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';
import '../util/bedrock_account_prefs.dart';
import '../util/resource_pack_prefs.dart';
import '../widgets/dialogs/howto_dialogs.dart';

class HomeScreen extends StatefulWidget {
  final RelayPingResult selectedRelay;
  final void Function(String?) onRelayChanged;
  final NavigationController navigationController;
  final Future<List<FeaturedServer>> partnerServersFuture;
  final VoidCallback onOpenPartnerServers;
  final VoidCallback onOpenManageServers;
  final VoidCallback onOpenResourcePack;
  final VoidCallback? onOpenMore;
  final VoidCallback? onOpenSupport;
  final VoidCallback? onOpenHowTo;
  final VoidCallback? onOpenConsole;
  final VoidCallback? onBack;
  final VoidCallback? onServerDeleted;
  final TextEditingController ipController;
  final TextEditingController portController;

  const HomeScreen({
    super.key,
    required this.selectedRelay,
    required this.onRelayChanged,
    required this.navigationController,
    required this.partnerServersFuture,
    required this.onOpenPartnerServers,
    required this.onOpenManageServers,
    required this.onOpenResourcePack,
    required this.ipController,
    required this.portController,
    this.onOpenMore,
    this.onOpenSupport,
    this.onOpenHowTo,
    this.onOpenConsole,
    this.onBack,
    this.onServerDeleted,
  });

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late final SocketHandler socketHandler;
  late final BroadcastManager _broadcastManager;
  late final Logger logger;

  final ValueNotifier<bool> _broadcastingNotifier = ValueNotifier(false);
  final ValueNotifier<List<UserServer>> _userServersNotifier = ValueNotifier(
    [],
  );

  final ScrollController _mainScrollController = ScrollController();

  ValueNotifier<List<String>> get _logsNotifier =>
      widget.navigationController.logsNotifier;
  ScrollController get _logScrollController =>
      widget.navigationController.logsScrollController;

  bool _nintendoDnsMode = false;
  List<BedrockAccount>? _cachedBedrockAccounts;
  String? _selectedBedrockXuid;
  String? _activeResourcePackUrl;
  bool _rpLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeComponents();
    loadUserServers();
    _loadBedrockAccounts();
    _loadResourcePackUrl();
  }

  void toggleDebug() {
    logger.debugEnabled = !logger.debugEnabled;
    widget.navigationController.debugEnabledNotifier.value = logger.debugEnabled;
  }

  void _initializeComponents() {
    logger = Logger(debugEnabled: false, logCallback: _log);
    socketHandler = SocketHandler(logger: logger);
    _broadcastManager = BroadcastManager(
      socketHandler: socketHandler,
      logger: logger,
    );
    _broadcastManager.onAutoDisconnect = _handleAutoDisconnect;
    _broadcastManager.onRelayError = _handleRelayError;
  }

  @override
  void dispose() {
    _mainScrollController.dispose();
    _broadcastingNotifier.dispose();
    _userServersNotifier.dispose();
    unawaited(_broadcastManager.stopBroadcast());
    super.dispose();
  }

  Future<void> loadUserServers() async {
    try {
      final servers = await UserServersStorage.loadServers();
      _userServersNotifier.value = servers;
      _setDefaultServerIfNeeded(servers);
    } catch (e) {
      logger.error('Failed to load user servers: $e');
    }
  }

  void _setDefaultServerIfNeeded(List<UserServer> servers) {
    if (widget.ipController.text.trim().isNotEmpty || servers.isEmpty) return;
    widget.ipController.text = servers.first.address;
    widget.portController.text = servers.first.port.toString();
  }

  void _log(String message) {
    final current = _logsNotifier.value;
    final next = [
      if (current.length >= AppConstants.maxLogEntries)
        ...current.skip(current.length - AppConstants.maxLogEntries + 1),
      if (current.length < AppConstants.maxLogEntries) ...current,
      message,
    ];
    _logsNotifier.value = next;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_logScrollController.hasClients && mounted) {
        _logScrollController.animateTo(
          _logScrollController.position.maxScrollExtent,
          duration: AppConstants.animationDuration,
          curve: Curves.fastOutSlowIn,
        );
      }
    });
  }

  Future<void> _startBroadcast(PanelMode mode) async {
    final loc = AppLocalizations.of(context)!;
    final remoteHost = widget.ipController.text.trim();
    final remotePortParsed = int.tryParse(widget.portController.text);

    if (remoteHost.isEmpty) {
      _snack(
        loc.pleaseEnterServer,
        AppTheme.warning,
        icon: Icons.warning_amber_rounded,
      );
      return;
    }
    if (remotePortParsed == null ||
        remotePortParsed < 1 ||
        remotePortParsed > 65535) {
      _snack(
        loc.invalidPort,
        AppTheme.error,
        icon: Icons.error_outline_rounded,
      );
      return;
    }

    if (mode == PanelMode.nintendo || mode == PanelMode.friends) {
      await _handleDnsMode(mode, remoteHost, remotePortParsed, loc);
      return;
    }
    await _handleBroadcastMode(mode, remoteHost, remotePortParsed, loc);
  }

  Future<void> _loadResourcePackUrl() async {
    if (mounted) setState(() => _rpLoading = true);
    try {
      final enabled = await ResourcePackPrefs.isEnabled();
      final url = enabled ? await ResourcePackPrefs.getUrl() : null;
      final activeUrl = (enabled && url != null && url.isNotEmpty) ? url : null;
      if (mounted) setState(() { _activeResourcePackUrl = activeUrl; _rpLoading = false; });
    } catch (_) {
      if (mounted) setState(() => _rpLoading = false);
    }
  }

  Future<void> reloadResourcePackUrl() => _loadResourcePackUrl();

  Future<void> _loadBedrockAccounts() async {
    try {
      final me = await UserService.getMe();
      if (!mounted || me == null) return;
      final savedXuid = await BedrockAccountPrefs.getSelectedXuid();
      final accounts = me.bedrockAccounts;
      final validXuid = accounts.any((a) => a.xboxXuid == savedXuid)
          ? savedXuid
          : accounts.isNotEmpty
          ? accounts.first.xboxXuid
          : null;
      setState(() {
        _cachedBedrockAccounts = accounts;
        _selectedBedrockXuid = validXuid;
      });
    } catch (_) {}
  }

  String? _getBedrockGamertag() {
    final accounts = _cachedBedrockAccounts;
    if (accounts == null || accounts.isEmpty) return null;
    if (_selectedBedrockXuid != null) {
      final match = accounts
          .where((a) => a.xboxXuid == _selectedBedrockXuid)
          .firstOrNull;
      if (match != null) return match.xboxGamertag;
    }
    return accounts.first.xboxGamertag;
  }

  void _onBedrockAccountChanged(String xuid) {
    setState(() => _selectedBedrockXuid = xuid);
    unawaited(BedrockAccountPrefs.setSelectedXuid(xuid));
  }

  Future<void> _handleDnsMode(
    PanelMode mode,
    String host,
    int port,
    AppLocalizations loc,
  ) async {
    final gamertag = _getBedrockGamertag();
    final resourcePackUrl = await ResourcePackPrefs.getActiveUrl();
    final ok = await _broadcastManager.sendRelayConfigOnly(
      host,
      port,
      relayIp: widget.selectedRelay.ip,
      relayBase: widget.selectedRelay.base,
      mode: BroadcastMode.values[mode.index],
      bedrockGamertag: gamertag,
      resourcePackUrl: resourcePackUrl,
    );
    if (!ok) return;
    if (mode == PanelMode.nintendo) {
      await HowToDialogs.showNintendoInstructions(
        context,
        relayName: widget.selectedRelay.name,
        relayIp: widget.selectedRelay.ip,
      );
    } else {
      await HowToDialogs.showFriendsInstructions(
        context,
        userRegion: widget.selectedRelay.name.toLowerCase().contains('eu') ? 'eu' : 'us',
      );
    }
  }

  Future<void> _handleBroadcastMode(
    PanelMode mode,
    String host,
    int port,
    AppLocalizations loc,
  ) async {
    logger.info('Starting MCCompanion');
    try {
      await WakelockPlus.enable();
    } catch (e) {
      logger.error('Failed to enable wakelock: $e');
    }
    final gamertag = _getBedrockGamertag();
    final authToken = await AuthService.getIdToken();
    final resourcePackUrl = await ResourcePackPrefs.getActiveUrl();
    final success = await _broadcastManager.startBroadcast(
      host,
      port,
      relayIp: widget.selectedRelay.ip,
      relayBase: widget.selectedRelay.base,
      isJava: mode == PanelMode.java,
      mode: BroadcastMode.values[mode.index],
      bedrockGamertag: gamertag,
      authToken: authToken,
      resourcePackUrl: resourcePackUrl,
    );
    _broadcastingNotifier.value = success;
    if (success) {
      unawaited(ReviewService.instance.onSuccessfulConnection());
    }
  }

  Future<void> _stopBroadcast() async {
    await _broadcastManager.stopBroadcast();
    _broadcastingNotifier.value = false;
  }

  void _handleAutoDisconnect() {
    if (!mounted) return;
    _broadcastingNotifier.value = false;
    _snack(
      AppLocalizations.of(context)!.clientDisconnected,
      AppTheme.info,
      icon: Icons.info_outline_rounded,
    );
  }

  void _handleRelayError(String message) {
    if (!mounted) return;
    _snack(message, AppTheme.error, icon: Icons.error_outline_rounded);
  }

  void _onUserServerSelected(UserServer server) {
    widget.ipController.text = server.address;
    widget.portController.text = server.port.toString();
    logger.info('Selected saved server: ${server.name}');
    _snack(
      AppLocalizations.of(context)!.selectedServer(server.name),
      AppTheme.accent,
      icon: Icons.bookmark_rounded,
    );
  }

  void _snack(String message, Color color, {IconData? icon}) {
    if (!mounted) return;
    AppToast.show(context, message: message, icon: icon, color: color);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = LayoutBuilder(
      builder: (context, constraints) => Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: constraints.maxWidth > 700 ? 900 : double.infinity),
          child: Padding(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
      child: SingleChildScrollView(
        controller: _mainScrollController,
        physics: const ClampingScrollPhysics(),
        child: ValueListenableBuilder<List<UserServer>>(
          valueListenable: _userServersNotifier,
          builder: (context, userServers, _) => ConnectionPanel(
            ipController: widget.ipController,
            portController: widget.portController,
            broadcastingNotifier: _broadcastingNotifier,
            onStartBroadcast: _startBroadcast,
            onStopBroadcast: _stopBroadcast,
            savedServers: userServers,
            onServerSelected: _onUserServerSelected,
            onManageServers: widget.onOpenManageServers,
            onResourcePack: widget.onOpenResourcePack,
            resourcePackActive: _activeResourcePackUrl != null,
            resourcePackLoading: _rpLoading,
            selectedRelayIp: widget.selectedRelay.ip,
            onRelayChanged: widget.onRelayChanged,
            nintendoDnsMode: _nintendoDnsMode,
            onNintendoDnsModeChanged: (value) =>
                setState(() => _nintendoDnsMode = value),
            navigationController: widget.navigationController,
            partnerServersFuture: widget.partnerServersFuture,
            onOpenPartnerServers: widget.onOpenPartnerServers,
            bedrockAccounts: _cachedBedrockAccounts ?? [],
            selectedBedrockXuid: _selectedBedrockXuid,
            onBedrockAccountChanged: _onBedrockAccountChanged,
            navChips: _ConnectorNavChips(
              onSupport: widget.onOpenSupport,
              onHowTo: widget.onOpenHowTo,
              onConsole: widget.onOpenConsole,
              onRelay: widget.onOpenMore,
            ),
            onDeleteServer: (index) async {
              await UserServersStorage.removeServer(index);
              await loadUserServers();
              widget.onServerDeleted?.call();
            },
          ),
        ),
      ),
          ),
        ),
      ),
    );
    if (widget.onBack != null) {
      content = SwipeBack(onBack: widget.onBack!, child: content);
    }
    return content;
  }
}

class _ConnectorNavChips extends StatelessWidget {
  final VoidCallback? onSupport;
  final VoidCallback? onHowTo;
  final VoidCallback? onConsole;
  final VoidCallback? onRelay;

  const _ConnectorNavChips({
    this.onSupport,
    this.onHowTo,
    this.onConsole,
    this.onRelay,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final chips = <({IconData icon, String label, VoidCallback onTap})>[
      if (onSupport != null)
        (icon: Icons.help_outline_rounded, label: loc.support, onTap: onSupport!),
      if (onHowTo != null)
        (icon: Icons.lightbulb_outline_rounded, label: loc.howToUseMenu, onTap: onHowTo!),
      if (onConsole != null)
        (icon: Icons.terminal_rounded, label: loc.console, onTap: onConsole!),
      if (onRelay != null)
        (icon: Icons.settings_ethernet_rounded, label: loc.relay, onTap: onRelay!),
    ];

    return Row(
      children: List.generate(chips.length, (i) {
        final c = chips[i];
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: i < chips.length - 1 ? 8 : 0),
            child: _NavChip(icon: c.icon, label: c.label, onTap: c.onTap),
          ),
        );
      }),
    );
  }
}

class _NavChip extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _NavChip({required this.icon, required this.label, required this.onTap});

  @override
  State<_NavChip> createState() => _NavChipState();
}

class _NavChipState extends State<_NavChip> {
  bool _hovered = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.label,
      waitDuration: const Duration(milliseconds: 600),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTapDown: (_) => setState(() => _pressed = true),
          onTapUp: (_) => setState(() => _pressed = false),
          onTapCancel: () => setState(() => _pressed = false),
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: _pressed ? 0.95 : 1.0,
            duration: const Duration(milliseconds: 100),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: _hovered
                    ? AppTheme.surfaceRaised
                    : AppTheme.surface.withValues(alpha: 0.60),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _hovered ? AppTheme.borderGray : AppTheme.borderLight,
                ),
              ),
              child: Icon(
                widget.icon,
                size: 18,
                color: _hovered ? AppTheme.textSecondary : AppTheme.textMuted,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
