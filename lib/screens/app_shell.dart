import 'dart:async';
import 'package:flutter/material.dart';
import '../services/navigation_controller.dart';
import '../services/locale_provider.dart';
import '../services/region_detector.dart';
import '../services/relay_service.dart';
import '../services/auth_service.dart';
import '../services/message_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../services/push_notification_service.dart';
import '../constants/app_constants.dart';
import '../widgets/navigation/bottom_nav_bar.dart';
import '../widgets/navigation/howto_menu.dart';
import '../widgets/navigation/help_menu.dart';
import '../widgets/navigation/info_menu.dart';
import '../widgets/dialogs/howto_dialogs.dart';
import '../widgets/dialogs/help_dialogs.dart';
import '../util/logger.dart';
import '../util/partners_servers.dart';
import '../services/partners_servers_service.dart';
import '../l10n/app_localizations.dart';
import '../services/user_service.dart';
import '../models/user_model.dart';
import 'landing_screen.dart';
import 'home_screen.dart';
import 'skins_screen.dart';
import 'wiki_screen.dart';
import 'partner_servers_screen.dart';
import 'player_lookup_screen.dart';
import 'manage_servers_screen.dart';
import 'profile_screen.dart';
import 'chat_screen.dart';
import 'server_tracker_screen.dart';
import '../services/server_tracker_service.dart';
import '../services/home_customization_service.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';

enum _ActiveSheet { none, help, howTo, more, info }

const int _pageHome = 0;
const int _pageConnector = 1;
const int _pagePartners = 2;
const int _pageManageServers = 3;
const int _pageAddEditServer = 4;
const int _pageSkins = 5;
const int _pageWiki = 6;
const int _pageProfile = 7;
const int _pagePlayerLookup = 8;
const int _pageServerTracker = 9;

class AppShell extends StatefulWidget {
  final RelayPingResult? initialRelay;
  const AppShell({super.key, this.initialRelay});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell>
    with SingleTickerProviderStateMixin {
  late final NavigationController navigationController;
  late final Future<List<FeaturedServer>> _partnerServersFuture;
  late final Logger logger;
  StreamSubscription? _authSub;

  final ValueNotifier<bool> _debugEnabledNotifier = ValueNotifier(false);
  final ValueNotifier<List<String>> _logsNotifier = ValueNotifier([]);
  final ScrollController _logScrollController = ScrollController();

  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _portController = TextEditingController();

  final GlobalKey<ManageServersScreenState> _manageServersKey = GlobalKey();
  final GlobalKey<HomeScreenState> _connectorKey = GlobalKey();
  final GlobalKey<SkinsScreenState> _skinsKey = GlobalKey();
  final GlobalKey<ProfileScreenState> _profileKey = GlobalKey();
  bool _loginFromTracker = false;

  late RelayPingResult _selectedRelay;
  int _pageIndex = _pageHome;
  int? _editingServerIndex;

  _ActiveSheet _activeSheet = _ActiveSheet.none;
  late final AnimationController _sheetAnimController;
  late final Animation<double> _sheetAnim;

  @override
  void initState() {
    super.initState();
    _selectedRelay = widget.initialRelay ?? _fallbackRelay();
    RelayService.setRelay(_selectedRelay);
    _partnerServersFuture = FeaturedServersService.fetchFeaturedServers();

    _sheetAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _sheetAnim = CurvedAnimation(
      parent: _sheetAnimController,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    logger = Logger(debugEnabled: false, logCallback: (_) {});
    _initNavigationController();

    _authSub = AuthService.userStream.listen((user) {
      if (user != null) {
        MessageService.connect();
        unawaited(PushNotificationService.onUserSignedIn());
        unawaited(ServerTrackerService.instance.start());
      } else {
        MessageService.disconnect();
        ServerTrackerService.instance.stop();
      }
    });

    PushNotificationService.init(onNotificationTap: _handleNotificationTap);
    HomeCustomizationService.instance.addListener(_onCustomizationChanged);
    ThemeService.instance.addListener(_onCustomizationChanged);
  }

  void _onCustomizationChanged() {
    if (mounted) setState(() {});
  }

  RelayPingResult _fallbackRelay() {
    final first = AppConstants.relayServers[0];
    return RelayPingResult(
      ip: first['ip']!,
      base: first['base']!,
      name: first['name']!,
      latencyMs: 999999,
    );
  }

  void _initNavigationController() {
    navigationController = NavigationController(
      websiteUrl: AppConstants.websiteUrl,
      discordUrl: AppConstants.discordUrl,
      appLocaleNotifier: appLocale,
      logsNotifier: _logsNotifier,
      logsScrollController: _logScrollController,
      debugEnabledNotifier: _debugEnabledNotifier,
      showHowToMenuCallback: (_) => _openSheet(_ActiveSheet.howTo),
      showHelpMenuCallback: (_) => _openSheet(_ActiveSheet.help),
    );
  }

  void _openSheet(_ActiveSheet sheet) {
    if (_activeSheet == sheet) {
      _closeSheet();
      return;
    }
    setState(() => _activeSheet = sheet);
    _sheetAnimController.forward(from: 0);
  }

  Future<void> _closeSheet() async {
    if (_activeSheet == _ActiveSheet.none) return;
    await _sheetAnimController.reverse();
    if (mounted) setState(() => _activeSheet = _ActiveSheet.none);
  }

  void _closeSheetInstant() {
    _sheetAnimController.stop();
    _sheetAnimController.value = 0;
    setState(() => _activeSheet = _ActiveSheet.none);
  }

  void _handleNotificationTap(RemoteMessage message) {
    final type = message.data['type'] as String? ?? 'unknown';
    switch (type) {
      case 'message':
        final username = message.data['senderUsername'] as String?;
        _goToProfileTab(3);
        if (username != null) unawaited(_openChatFromNotification(username));
      case 'friend_request':
        _goToProfileTab(2);
      case 'friend_online':
      case 'friend_session':
        _goToProfileTab(1);
      default:
        _goTo(_pageHome);
    }
  }

  void _goToProfileTab(int tab) {
    _goTo(_pageProfile);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _profileKey.currentState?.switchToTab(tab);
    });
  }

  Future<void> _openChatFromNotification(String username) async {
    final user = await UserService.getProfile(username);
    if (!mounted || user == null) return;
    final friend = FriendModel(
      firebaseUid: '',
      username: user.username,
      displayName: user.displayName,
      avatarUrl: user.avatarUrl,
      online: false,
    );
    if (!mounted) return;
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => ChatScreen(friend: friend)));
  }

  void _goTo(int page) {
    _closeSheetInstant();
    if (page == _pageConnector) {
      _connectorKey.currentState?.loadUserServers();
    }
    if (page == _pageSkins) {
      _skinsKey.currentState?.refresh();
    }
    setState(() => _pageIndex = page);
  }

  void _openManageServers() => _goTo(_pageManageServers);

  VoidCallback _navCallbackFor(AppFeature feature) => switch (feature) {
    AppFeature.connector => () => _goTo(_pageConnector),
    AppFeature.skins => () => _goTo(_pageSkins),
    AppFeature.wiki => () => _goTo(_pageWiki),
    AppFeature.partners => () => _goTo(_pagePartners),
    AppFeature.lookup => () => _goTo(_pagePlayerLookup),
    AppFeature.tracker => () => _goTo(_pageServerTracker),
  };

  bool _isNavFeatureActive(AppFeature feature) {
    return switch (feature) {
      AppFeature.skins => _pageIndex == _pageSkins,
      AppFeature.wiki => _pageIndex == _pageWiki,
      AppFeature.partners => _pageIndex == _pagePartners,
      AppFeature.lookup => _pageIndex == _pagePlayerLookup,
      AppFeature.tracker => _pageIndex == _pageServerTracker,
      AppFeature.connector => _pageIndex == _pageConnector,
    };
  }

  void _openAddServer() {
    setState(() {
      _editingServerIndex = null;
      _pageIndex = _pageAddEditServer;
    });
  }

  void _openEditServer(int index) {
    setState(() {
      _editingServerIndex = index;
      _pageIndex = _pageAddEditServer;
    });
  }

  void _onRelayChanged(String? ip) {
    if (ip == null) return;
    final matched = AppConstants.relayServers.firstWhere(
      (e) => e['ip'] == ip,
      orElse: () => AppConstants.relayServers[0],
    );
    final relay = RelayPingResult(
      ip: matched['ip']!,
      base: matched['base']!,
      name: matched['name']!,
      latencyMs: 0,
    );
    RelayService.setRelay(relay);
    setState(() => _selectedRelay = relay);
  }

  static String _friendNameForRelay(String relayName) => switch (relayName) {
    'EU Server' => 'NetherLinkEU',
    'US Server' => 'NetherLinkUS',
    _ => '-',
  };

  String? get _activeNavItem {
    switch (_pageIndex) {
      case _pageHome:
        return _activeSheet == _ActiveSheet.none ? 'home' : null;
      case _pageConnector:
        return 'connector';
      case _pageSkins:
        return 'skins';
      case _pageWiki:
        return 'wiki';
      case _pageProfile:
        return 'profile';
      default:
        return null;
    }
  }

  bool get _canPop =>
      _pageIndex == _pageHome && _activeSheet == _ActiveSheet.none;

  void _handlePop() {
    if (_activeSheet != _ActiveSheet.none) {
      _closeSheet();
    } else if (_pageIndex == _pageAddEditServer) {
      setState(() => _pageIndex = _pageManageServers);
    } else if (_pageIndex == _pagePlayerLookup) {
      _goTo(_pageHome);
    } else if (_pageIndex == _pageServerTracker) {
      _goTo(_pageHome);
    } else if (_pageIndex == _pageManageServers ||
        _pageIndex == _pagePartners) {
      _goTo(_pageConnector);
    } else if (_pageIndex != _pageHome) {
      _goTo(_pageHome);
    }
  }

  @override
  void dispose() {
    HomeCustomizationService.instance.removeListener(_onCustomizationChanged);
    ThemeService.instance.removeListener(_onCustomizationChanged);
    _authSub?.cancel();
    MessageService.disconnect();
    _sheetAnimController.dispose();
    _logScrollController.dispose();
    _logsNotifier.dispose();
    _debugEnabledNotifier.dispose();
    _ipController.dispose();
    _portController.dispose();
    navigationController.consoleOpen.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return PopScope(
      canPop: _canPop,
      onPopInvoked: (didPop) {
        if (!didPop) _handlePop();
      },
      child: Stack(
        children: [
          Positioned.fill(child: ColoredBox(color: AppTheme.background)),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.8, -1.1),
                  radius: 0.9,
                  colors: [
                    AppTheme.accent.withOpacity(0.07),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(-1.0, 1.2),
                  radius: 0.7,
                  colors: [
                    AppTheme.accent.withOpacity(0.04),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: Builder(
              builder: (_) {
                final svc = HomeCustomizationService.instance;
                return BottomGlassSimpleNavBar(
                  navigationController: navigationController,
                  dark: true,
                  selectedRelayIp: _selectedRelay.ip,
                  onRelayChanged: _onRelayChanged,
                  activeItem: _activeNavItem,
                  onHomeTap: () => _goTo(_pageHome),
                  onConnectorTap: () => _goTo(_pageConnector),
                  onProfileTap: () {
                    _loginFromTracker = false;
                    _goTo(_pageProfile);
                  },
                  navLeftFeature: svc.navLeft,
                  navRightFeature: svc.navRight,
                  onNavLeftTap: _navCallbackFor(svc.navLeft),
                  onNavRightTap: _navCallbackFor(svc.navRight),
                  navLeftActive: _isNavFeatureActive(svc.navLeft),
                  navRightActive: _isNavFeatureActive(svc.navRight),
                );
              },
            ),
            body: SafeArea(
              top: true,
              bottom: false,
              child: Stack(
                children: [
                  IndexedStack(
                    index: _pageIndex,
                    children: [
                      LandingScreen(
                        onGoToConnector: () => _goTo(_pageConnector),
                        onGoToSkins: () => _goTo(_pageSkins),
                        onGoToWiki: () => _goTo(_pageWiki),
                        onGoToPartners: () => _goTo(_pagePartners),
                        onGoToPlayerLookup: () => _goTo(_pagePlayerLookup),
                        onGoToServerTracker: () => _goTo(_pageServerTracker),
                        onWebsiteTap: () =>
                            navigationController.openWebsite(context),
                        onDiscordTap: () =>
                            navigationController.openDiscord(context),
                        onLanguageTap: () =>
                            navigationController.showLanguageDialog(context),
                        onInfoTap: () => _openSheet(_ActiveSheet.info),
                        partnerServersFuture: _partnerServersFuture,
                        onPlayServer: (ip, port) {
                          _ipController.text = ip;
                          _portController.text = port.toString();
                          _goTo(_pageConnector);
                        },
                      ),
                      HomeScreen(
                        key: _connectorKey,
                        selectedRelay: _selectedRelay,
                        onRelayChanged: _onRelayChanged,
                        navigationController: navigationController,
                        partnerServersFuture: _partnerServersFuture,
                        onOpenPartnerServers: () => _goTo(_pagePartners),
                        onOpenManageServers: _openManageServers,
                        onOpenMore: () => _openSheet(_ActiveSheet.more),
                        onOpenSupport: () => _openSheet(_ActiveSheet.help),
                        onOpenHowTo: () => _openSheet(_ActiveSheet.howTo),
                        onOpenConsole: () =>
                            navigationController.showConsole(context),
                        ipController: _ipController,
                        portController: _portController,
                      ),
                      PartnerServersScreen(
                        partnerServersFuture: _partnerServersFuture,
                        ipController: _ipController,
                        portController: _portController,
                        onBack: () => _goTo(_pageHome),
                        onPlay: () => _goTo(_pageConnector),
                      ),
                      ManageServersScreen(
                        key: _manageServersKey,
                        onBack: () => _goTo(_pageConnector),
                        onAddServer: _openAddServer,
                        onEditServer: _openEditServer,
                      ),
                      AddEditServerScreen(
                        editingIndex: _editingServerIndex,
                        onSaved: () {
                          _manageServersKey.currentState?.reload();
                          setState(() => _pageIndex = _pageManageServers);
                        },
                        onCancel: () =>
                            setState(() => _pageIndex = _pageManageServers),
                      ),
                      SkinsScreen(key: _skinsKey),
                      const WikiScreen(),
                      ProfileScreen(
                        key: _profileKey,
                        onGoToHome: () => _goTo(_pageHome),
                        onGoToConnector: () => _goTo(_pageConnector),
                        onGoToSkins: () => _goTo(_pageSkins),
                        onGoToWiki: () => _goTo(_pageWiki),
                        onLoggedIn: () {
                          if (_loginFromTracker) {
                            _loginFromTracker = false;
                            _goTo(_pageServerTracker);
                          }
                        },
                      ),
                      PlayerLookupScreen(onBack: () => _goTo(_pageHome)),
                      ServerTrackerScreen(
                        onBack: () => _goTo(_pageHome),
                        onGoToLogin: () {
                          _loginFromTracker = true;
                          _goTo(_pageProfile);
                        },
                      ),
                    ],
                  ),

                  if (_activeSheet != _ActiveSheet.none) ...[
                    AnimatedBuilder(
                      animation: _sheetAnim,
                      builder: (_, __) => GestureDetector(
                        onTap: _closeSheet,
                        child: Container(
                          color: Colors.black.withOpacity(
                            0.45 * _sheetAnim.value,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AnimatedBuilder(
                        animation: _sheetAnim,
                        builder: (_, child) => FractionalTranslation(
                          translation: Offset(0, 1 - _sheetAnim.value),
                          child: child,
                        ),
                        child: _buildActiveSheetContent(loc),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveSheetContent(AppLocalizations loc) {
    switch (_activeSheet) {
      case _ActiveSheet.help:
        return HelpSheetContent(
          loc: loc,
          onClose: _closeSheet,
          onMCCompanion: () {
            _closeSheetInstant();
            HelpDialogs.showNetherlinkNotAppearing(context);
          },
          onMultiplayerFailed: () {
            _closeSheetInstant();
            HelpDialogs.showMultiplayerConnectionFailed(context);
          },
          onNintendoDns: () {
            _closeSheetInstant();
            HelpDialogs.showNintendoDns(context);
          },
          onFriendsMode: () {
            _closeSheetInstant();
            HelpDialogs.showFriendsMode(context);
          },
        );
      case _ActiveSheet.howTo:
        return HowToSheetContent(
          loc: loc,
          onClose: _closeSheet,
          onXbox: () {
            _closeSheetInstant();
            HowToDialogs.showXboxInstructions(context);
          },
          onNintendo: () {
            _closeSheetInstant();
            HowToDialogs.showNintendoInstructions(
              context,
              relayName: _selectedRelay.name,
              relayIp: _selectedRelay.ip,
            );
          },
          onFriends: () {
            _closeSheetInstant();
            HowToDialogs.showFriendsInstructions(
              context,
              friendName: _friendNameForRelay(_selectedRelay.name),
            );
          },
          onJava: () {
            _closeSheetInstant();
            HowToDialogs.showJavaInstructions(context);
          },
        );
      case _ActiveSheet.more:
        return MoreSheetContent(
          loc: loc,
          navigationController: navigationController,
          selectedRelayIp: _selectedRelay.ip,
          onClose: _closeSheet,
          onRelayChanged: (ip) {
            _closeSheetInstant();
            _onRelayChanged(ip);
          },
        );
      case _ActiveSheet.info:
        return InfoSheetContent(onClose: _closeSheet);
      case _ActiveSheet.none:
        return const SizedBox.shrink();
    }
  }
}
