import 'dart:async';
import 'dart:async' show unawaited;
import 'package:flutter/material.dart';
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
import '../widgets/components/global_notice_banner.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/components/header_nav_bar.dart';
import '../services/notification_service.dart';
import '../services/region_detector.dart';
import '../network/broadcast_mode.dart';
import '../services/navigation_controller.dart';
import '../services/user_service.dart';
import '../widgets/dialogs/howto_dialogs.dart';

class HomeScreen extends StatefulWidget {
  final RelayPingResult selectedRelay;
  final void Function(String?) onRelayChanged;
  final NavigationController navigationController;
  final Future<List<FeaturedServer>> partnerServersFuture;
  final VoidCallback onOpenPartnerServers;
  final VoidCallback onOpenManageServers;
  final VoidCallback? onOpenMore;
  final VoidCallback? onOpenSupport;
  final VoidCallback? onOpenHowTo;
  final VoidCallback? onOpenConsole;
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
    required this.ipController,
    required this.portController,
    this.onOpenMore,
    this.onOpenSupport,
    this.onOpenHowTo,
    this.onOpenConsole,
  });

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late final SocketHandler socketHandler;
  late final BroadcastManager _broadcastManager;
  late final Logger logger;

  final ValueNotifier<bool> _debugEnabledNotifier = ValueNotifier(false);
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
  Map<String, String>? _currentNotice;
  Timer? _noticeTimer;

  static String _friendNameForRelay(String relayName) => switch (relayName) {
    'EU Server' => 'NetherLinkEU',
    'US Server' => 'NetherLinkUS',
    _ => '-',
  };

  @override
  void initState() {
    super.initState();
    _initializeComponents();
    loadUserServers();
    _fetchNotification();
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedRelay.ip != widget.selectedRelay.ip) {
      _fetchNotification();
    }
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
    _noticeTimer?.cancel();
    _mainScrollController.dispose();
    _broadcastingNotifier.dispose();
    _debugEnabledNotifier.dispose();
    _userServersNotifier.dispose();
    unawaited(_broadcastManager.stopBroadcast());
    super.dispose();
  }

  Future<void> _fetchNotification() async {
    final notice = await NotificationService.fetchNotice(
      widget.selectedRelay.base,
    );
    if (!mounted || notice == null) return;
    setState(() => _currentNotice = notice);
    _noticeTimer?.cancel();
    _noticeTimer = Timer(const Duration(seconds: 20), () {
      if (mounted) setState(() => _currentNotice = null);
    });
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

  Future<String?> _getBedrockGamertag() async {
    try {
      final me = await UserService.getMe();
      return me?.xboxGamertag;
    } catch (_) {
      return null;
    }
  }

  Future<void> _handleDnsMode(
    PanelMode mode,
    String host,
    int port,
    AppLocalizations loc,
  ) async {
    final gamertag = await _getBedrockGamertag();
    final ok = await _broadcastManager.sendRelayConfigOnly(
      host,
      port,
      relayIp: widget.selectedRelay.ip,
      relayBase: widget.selectedRelay.base,
      mode: BroadcastMode.values[mode.index],
      bedrockGamertag: gamertag,
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
        friendName: _friendNameForRelay(widget.selectedRelay.name),
      );
    }
  }

  Future<void> _handleBroadcastMode(
    PanelMode mode,
    String host,
    int port,
    AppLocalizations loc,
  ) async {
    logger.info('Starting NetherLink');
    try {
      await WakelockPlus.enable();
    } catch (e) {
      logger.error('Failed to enable wakelock: $e');
    }
    final gamertag = await _getBedrockGamertag();
    final success = await _broadcastManager.startBroadcast(
      host,
      port,
      relayIp: widget.selectedRelay.ip,
      relayBase: widget.selectedRelay.base,
      isJava: mode == PanelMode.java,
      mode: BroadcastMode.values[mode.index],
      bedrockGamertag: gamertag,
    );
    _broadcastingNotifier.value = success;
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
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  const Text(
                    'Connector',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  HeaderNavBar(
                    items: [
                      if (widget.onOpenSupport != null)
                        HeaderNavItem(label: 'Support', onTap: widget.onOpenSupport),
                      if (widget.onOpenHowTo != null)
                        HeaderNavItem(label: 'How to use', onTap: widget.onOpenHowTo),
                      if (widget.onOpenConsole != null)
                        HeaderNavItem(label: 'Console', onTap: widget.onOpenConsole),
                      if (widget.onOpenMore != null)
                        HeaderNavItem(
                          label: 'Relay',
                          onTap: widget.onOpenMore,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 4, 14, 0),
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
                      selectedRelayIp: widget.selectedRelay.ip,
                      onRelayChanged: widget.onRelayChanged,
                      nintendoDnsMode: _nintendoDnsMode,
                      onNintendoDnsModeChanged: (value) =>
                          setState(() => _nintendoDnsMode = value),
                      navigationController: widget.navigationController,
                      partnerServersFuture: widget.partnerServersFuture,
                      onOpenPartnerServers: widget.onOpenPartnerServers,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (_currentNotice != null)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GlobalNoticeBanner(
              message: _currentNotice!['message']!,
              type: _currentNotice!['type'] ?? 'info',
              onDismiss: () {
                _noticeTimer?.cancel();
                setState(() => _currentNotice = null);
              },
            ),
          ),
      ],
    );
  }
}
