import 'dart:async';
import 'dart:io';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/navigation_controller.dart';
import '../services/locale_provider.dart';
import '../services/region_detector.dart';
import '../services/relay_service.dart';
import '../services/auth_service.dart';
import '../services/presence_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../services/push_notification_service.dart';
import '../constants/app_constants.dart';
import '../widgets/console/console_widget.dart';
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
import 'my_feedback_screen.dart';
import 'landing_screen.dart';
import '../widgets/landing/landing_customize_sheet.dart';
import 'connector_screen.dart';
import 'skins_screen.dart';
import 'server_list_screen.dart';
import 'player_lookup_screen.dart';
import 'manage_servers_screen.dart';
import 'resource_pack_screen.dart';
import 'profile_screen.dart';
import 'public_profile_screen.dart';
import 'server_tracker_screen.dart';
import 'feedback_screen.dart';
import '../services/server_tracker_service.dart';
import '../services/subscription_service.dart';
import '../services/home_customization_service.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/onboarding/onboarding_wizard.dart';
import 'package:flutter/services.dart';

const int _pageHome = 0;
const int _pageConnector = 1;
const int _pagePartners = 2;
const int _pageManageServers = 3;
const int _pageAddEditServer = 4;
const int _pageSkins = 5;
const int _pageProfile = 6;
const int _pagePlayerLookup = 7;
const int _pageServerTracker = 8;
const int _pageFeedback = 9;
const int _pageResourcePack = 10;

class AppShell extends StatefulWidget {
  final RelaySelection? initialRelay;
  const AppShell({super.key, this.initialRelay});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> with WidgetsBindingObserver {
  late final NavigationController navigationController;
  late final Future<List<FeaturedServer>> _partnerServersFuture;
  late final Logger logger;
  StreamSubscription? _authSub;
  StreamSubscription? _linkSub;

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
  bool _loginFromRp = false;
  String? _lastSignedInUid;

  late RelaySelection _selectedRelay;
  final ValueNotifier<int> _pageIndexNotifier = ValueNotifier(_pageHome);
  int get _pageIndex => _pageIndexNotifier.value;
  final Set<int> _builtPages = {};

  set _pageIndex(int v) {
    _builtPages.add(v);
    _pageIndexNotifier.value = v;
  }

  int? _editingServerIndex;

  final GlobalKey<NavigatorState> _desktopNavKey = GlobalKey<NavigatorState>();

  NavigatorState get _contentNavigator =>
      _desktopNavKey.currentState ?? Navigator.of(context);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _selectedRelay = widget.initialRelay ?? _fallbackRelay();
    RelayService.setRelay(_selectedRelay);
    RelayService.selection.addListener(_onRelayServiceChanged);
    _partnerServersFuture = FeaturedServersService.fetchFeaturedServers();

    logger = Logger(debugEnabled: false, logCallback: (_) {});
    _initNavigationController();

    _authSub = AuthService.userStream.listen((user) {
      if (user != null) {
        PresenceService.connect();
        if (_lastSignedInUid != user.uid) {
          _lastSignedInUid = user.uid;
          unawaited(PushNotificationService.onUserSignedIn());
        }
        unawaited(ServerTrackerService.instance.start());
        unawaited(SubscriptionService.instance.init(user.uid));
        _warmLikelyScreens();
      } else {
        _lastSignedInUid = null;
        PresenceService.disconnect();
        ServerTrackerService.instance.stop();
        SubscriptionService.instance.reset();
      }
    });

    PushNotificationService.init(onNotificationTap: _handleNotificationTap);
    HomeCustomizationService.instance.addListener(_onCustomizationChanged);
    ThemeService.instance.addListener(_onCustomizationChanged);
    _initDeepLinks();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkOnboarding());
  }

  void _warmLikelyScreens() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 600), () {
        if (!mounted) return;
        unawaited(UserService.warmSocialInit());
      });
    });
  }

  void _checkOnboarding() {
    final svc = HomeCustomizationService.instance;
    if (!svc.isOnboardingDone) {
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black87,
        builder: (_) => OnboardingWizard(
          onComplete: _goToStartPage,
          onCustomize: () {
            _goToStartPage();
            _showCustomizeSheet();
          },
        ),
      );
    } else {
      _goToStartPage();
    }
  }

  void _goToStartPage() {
    final svc = HomeCustomizationService.instance;
    if (svc.useLandingAsStart) {
      _goTo(_pageHome);
    } else {
      _goTo(_pageIndexFor(svc.startPage));
    }
  }

  void _showCustomizeSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LandingCustomizeSheet(callbackFor: _navCallbackFor),
    );
  }

  int _pageIndexFor(AppFeature feature) => switch (feature) {
    AppFeature.connector => _pageConnector,
    AppFeature.skins => _pageSkins,
    AppFeature.partners => _pagePartners,
    AppFeature.lookup => _pagePlayerLookup,
    AppFeature.tracker => _pageServerTracker,
  };

  void _onCustomizationChanged() {
    if (mounted) setState(() {});
  }

  void _initDeepLinks() {
    final appLinks = AppLinks();
    appLinks.getInitialLink().then((uri) {
      if (uri != null) _handleDeepLink(uri);
    });
    _linkSub = appLinks.uriLinkStream.listen(_handleDeepLink);
  }

  static const String _linkHost = 'mccompanion.net';

  bool _isWebLink(Uri uri, String path) =>
      (uri.scheme == 'https' || uri.scheme == 'http') &&
      uri.host == _linkHost &&
      uri.path == path;

  void _handleDeepLink(Uri uri) {
    String? username;
    if (uri.scheme == 'mccompanion' && uri.host == 'user') {
      username = uri.pathSegments.isNotEmpty ? uri.pathSegments.first : null;
    } else if (_isWebLink(uri, '/u')) {
      username = uri.queryParameters['name'];
    }
    if (username != null && username.isNotEmpty) {
      _openPublicProfile(username);
      return;
    }

    if ((uri.scheme == 'mccompanion' && uri.host == 'join') ||
        _isWebLink(uri, '/j')) {
      _openJoinLink(uri.queryParameters);
    }
  }

  /// Fills the connector with a server someone shared and shows it, so the
  /// only thing left to do is press start.
  void _openJoinLink(Map<String, String> params) {
    final ip = params['ip']?.trim();
    if (ip == null || ip.isEmpty) return;

    final port = int.tryParse(params['port'] ?? '');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _ipController.text = ip;
      _portController.text = (port != null && port > 0 && port <= 65535)
          ? port.toString()
          : '19132';
      _goTo(_pageConnector);
    });
  }

  void _openPublicProfile(String username) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final nav = _contentNavigator;
      nav.push(
        MaterialPageRoute(
          builder: (_) => PublicProfileScreen(
            username: username,
            onGoToHome: () {
              nav.pop();
              _goTo(_pageHome);
            },
            onGoToConnector: () {
              nav.pop();
              _goTo(_pageConnector);
            },
          ),
        ),
      );
    });
  }

  void _toggleDebug() {
    _connectorKey.currentState?.toggleDebug();
  }

  void _clearLogs() {
    _logsNotifier.value = [];
  }

  Future<void> _copyLogs() async {
    final logs = _logsNotifier.value;
    if (logs.isEmpty) return;
    await Clipboard.setData(ClipboardData(text: logs.join('\n')));
    if (!mounted) return;
    AppToast.show(
      context,
      message: AppLocalizations.of(context)!.copiedLogs(logs.length),
      icon: Icons.check_rounded,
      color: AppTheme.accent,
    );
  }

  RelaySelection _fallbackRelay() => RelaySelection.first;

  void _initNavigationController() {
    navigationController = NavigationController(
      websiteUrl: AppConstants.websiteUrl,
      discordUrl: AppConstants.discordUrl,
      appLocaleNotifier: appLocale,
      logsNotifier: _logsNotifier,
      logsScrollController: _logScrollController,
      debugEnabledNotifier: _debugEnabledNotifier,
      toggleDebugCallback: _toggleDebug,
      clearLogsCallback: _clearLogs,
      copyLogsCallback: _copyLogs,
      showHowToMenuCallback: (_) => _showHowToSheet(),
      showHelpMenuCallback: (_) => _showHelpSheet(),
    );
  }

  Future<T?> _showSheet<T>(Widget content) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (_) => content,
    );
  }

  void _showHowToSheet() {
    final loc = AppLocalizations.of(context)!;
    _showSheet(
      HowToSheetContent(
        loc: loc,
        onClose: () => Navigator.of(context).pop(),
        onXbox: () {
          Navigator.of(context).pop();
          HowToDialogs.showXboxInstructions(context);
        },
        onNintendo: () {
          Navigator.of(context).pop();
          HowToDialogs.showNintendoInstructions(
            context,
            relayName: _selectedRelay.name,
            relayIp: _selectedRelay.ip,
          );
        },
        onFriends: () {
          Navigator.of(context).pop();
          HowToDialogs.showFriendsInstructions(
            context,
            userRegion: _selectedRelay.name.toLowerCase().contains('eu')
                ? 'eu'
                : 'us',
          );
        },
        onDirect: () {
          Navigator.of(context).pop();
          HowToDialogs.showDirectInstructions(context);
        },
      ),
    );
  }

  void _showHelpSheet() {
    final loc = AppLocalizations.of(context)!;
    _showSheet(
      HelpSheetContent(
        loc: loc,
        onClose: () => Navigator.of(context).pop(),
        onMCCompanion: () {
          Navigator.of(context).pop();
          HelpDialogs.showMCCompanionNotAppearing(context);
        },
        onMultiplayerFailed: () {
          Navigator.of(context).pop();
          HelpDialogs.showMultiplayerConnectionFailed(context);
        },
        onNintendoDns: () {
          Navigator.of(context).pop();
          HelpDialogs.showNintendoDns(context);
        },
        onFriendsMode: () {
          Navigator.of(context).pop();
          HelpDialogs.showFriendsMode(context);
        },
      ),
    );
  }

  void _showInfoSheet() {
    _showSheet(
      InfoSheetContent(
        onClose: () => Navigator.of(context).pop(),
        onFeedback: () {
          Navigator.of(context).pop();
          _goTo(_pageFeedback);
        },
      ),
    );
  }

  void _showMoreSheet() {
    final loc = AppLocalizations.of(context)!;
    _showSheet(
      MoreSheetContent(
        loc: loc,
        navigationController: navigationController,
        selectedRelayIp: _selectedRelay.ip,
        onClose: () => Navigator.of(context).pop(),
        onRelayChanged: (ip) {
          Navigator.of(context).pop();
          _onRelayChanged(ip);
        },
      ),
    );
  }

  void _handleNotificationTap(RemoteMessage message) {
    final type = message.data['type'] as String? ?? 'unknown';
    switch (type) {
      case 'friend_request':
        _goToProfileTab(2);
      case 'friend_online':
      case 'friend_session':
        _goToProfileTab(1);
      case 'feedback':
        if (UserService.isAdmin) {
          _goToProfileTab(5);
        } else {
          final id = int.tryParse('${message.data['id']}');
          _contentNavigator.push(
            MaterialPageRoute(
              builder: (_) => MyFeedbackScreen(initialTicketId: id),
            ),
          );
        }
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



  void _goTo(int page) {
    _desktopNavKey.currentState?.popUntil((r) => r.isFirst);
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
    AppFeature.partners => () => _goTo(_pagePartners),
    AppFeature.lookup => () => _goTo(_pagePlayerLookup),
    AppFeature.tracker => () => _goTo(_pageServerTracker),
  };

  bool _isNavFeatureActive(AppFeature feature) {
    return switch (feature) {
      AppFeature.skins => _pageIndex == _pageSkins,
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

  void _onRelayServiceChanged() {
    final current = RelayService.selection.value;
    if (current == null || current.ip == _selectedRelay.ip) return;
    if (mounted) setState(() => _selectedRelay = current);
  }

  void _onRelayChanged(String? ip) {
    final relay =
        RelaySelection.fromIp(ip, RelaySource.manual) ?? RelaySelection.first;
    unawaited(RelayService.setManual(relay));
    setState(() => _selectedRelay = relay);
  }

  String? get _activeNavItem {
    switch (_pageIndex) {
      case _pageHome:
        return 'home';
      case _pageConnector:
        return 'connector';
      case _pageSkins:
        return 'skins';
      case _pageProfile:
        return 'profile';
      case _pagePartners:
        return 'partners';
      case _pagePlayerLookup:
        return 'lookup';
      case _pageServerTracker:
        return 'tracker';
      case _pageFeedback:
        return 'feedback';
      default:
        return null;
    }
  }

  bool get _canPop => _pageIndex == _pageHome;

  void _handlePop() {
    if (_pageIndex == _pageAddEditServer) {
      setState(() => _pageIndex = _pageManageServers);
    } else if (_pageIndex == _pagePlayerLookup) {
      _goTo(_pageHome);
    } else if (_pageIndex == _pageServerTracker) {
      _goTo(_pageHome);
    } else if (_pageIndex == _pageResourcePack) {
      _connectorKey.currentState?.reloadResourcePackUrl();
      _goTo(_pageConnector);
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
    WidgetsBinding.instance.removeObserver(this);
    RelayService.selection.removeListener(_onRelayServiceChanged);
    _authSub?.cancel();
    _linkSub?.cancel();
    PresenceService.disconnect();
    _logScrollController.dispose();
    _logsNotifier.dispose();
    _debugEnabledNotifier.dispose();
    _ipController.dispose();
    _portController.dispose();
    _pageIndexNotifier.dispose();
    navigationController.consoleOpen.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    ServerTrackerService.instance.setForeground(
      state == AppLifecycleState.resumed,
    );

    if (state == AppLifecycleState.resumed) {
      if (AuthService.currentUser != null) PresenceService.reconnectIfNeeded();
      unawaited(RegionDetector.refreshInBackground());
    }
  }

  bool get _isDesktop =>
      Platform.isMacOS || Platform.isWindows || Platform.isLinux;

  Widget _buildBackground() =>
      Positioned.fill(child: ColoredBox(color: AppTheme.background));

  Widget _buildPageStack() {
    final pages = <Widget>[
      LandingScreen(
        onGoToConnector: () => _goTo(_pageConnector),
        onGoToSkins: () => _goTo(_pageSkins),
        onGoToPartners: () => _goTo(_pagePartners),
        onGoToPlayerLookup: () => _goTo(_pagePlayerLookup),
        onGoToServerTracker: () => _goTo(_pageServerTracker),
        onGoToFeedback: () => _goTo(_pageFeedback),
        onWebsiteTap: () => navigationController.openWebsite(context),
        onDiscordTap: () => navigationController.openDiscord(context),
        onLanguageTap: () => navigationController.showLanguageDialog(context),
        onInfoTap: () => _showInfoSheet(),
        partnerServersFuture: _partnerServersFuture,
        ipController: _ipController,
        portController: _portController,
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
        onOpenResourcePack: () {
          if (AuthService.currentUser == null) {
            _loginFromRp = true;
            _goTo(_pageProfile);
          } else {
            _goTo(_pageResourcePack);
          }
        },
        onOpenMore: () => _showMoreSheet(),
        onOpenSupport: () => _showHelpSheet(),
        onOpenHowTo: () => _showHowToSheet(),
        onOpenConsole: () => navigationController.showConsole(context),
        ipController: _ipController,
        portController: _portController,
        onBack: () => _goTo(_pageHome),
        onServerDeleted: () => _manageServersKey.currentState?.reload(),
      ),
      // The paid placements still lead this list, they are just no longer the
      // whole of it: this is the same directory the website shows.
      ServerListScreen(
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
        onCancel: () => setState(() => _pageIndex = _pageManageServers),
      ),
      SkinsScreen(key: _skinsKey, onBack: () => _goTo(_pageHome)),
      ProfileScreen(
        key: _profileKey,
        onGoToHome: () => _goTo(_pageHome),
        onGoToConnector: () => _goTo(_pageConnector),
        onGoToSkins: () => _goTo(_pageSkins),
        onLoggedIn: () {
          if (_loginFromTracker) {
            _loginFromTracker = false;
            _goTo(_pageServerTracker);
          } else if (_loginFromRp) {
            _loginFromRp = false;
            _goTo(_pageResourcePack);
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
      FeedbackScreen(
        onBack: () => _goTo(_pageHome),
        onGoToLogin: () => _goTo(_pageProfile),
      ),
      ResourcePackScreen(
        onBack: () {
          _connectorKey.currentState?.reloadResourcePackUrl();
          _goTo(_pageConnector);
        },
      ),
    ];

    return IndexedStack(
      index: _pageIndex,
      children: [
        for (var i = 0; i < pages.length; i++)
          if (i == _pageIndex || _builtPages.contains(i))
            TickerMode(enabled: i == _pageIndex, child: pages[i])
          else
            const SizedBox.shrink(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final svc = HomeCustomizationService.instance;

    return PopScope(
      canPop: _canPop,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) _handlePop();
      },
      child: _isDesktop
          ? _buildDesktopShell(loc, svc)
          : _buildMobileShell(loc, svc),
    );
  }

  Widget _buildMobileShell(AppLocalizations loc, HomeCustomizationService svc) {
    return Stack(
      children: [
        _buildBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomGlassSimpleNavBar(
            navigationController: navigationController,
            dark: true,
            selectedRelayIp: _selectedRelay.ip,
            onRelayChanged: _onRelayChanged,
            activeItem: _activeNavItem,
            onHomeTap: () => _goTo(_pageHome),
            onConnectorTap: () => _goTo(_pageConnector),
            onProfileTap: () {
              _loginFromTracker = false;
              _loginFromRp = false;
              _goTo(_pageProfile);
            },
            navLeftFeature: svc.navLeft,
            navRightFeature: svc.navRight,
            onNavLeftTap: svc.navLeft != null
                ? _navCallbackFor(svc.navLeft!)
                : null,
            onNavRightTap: svc.navRight != null
                ? _navCallbackFor(svc.navRight!)
                : null,
            navLeftActive:
                svc.navLeft != null && _isNavFeatureActive(svc.navLeft!),
            navRightActive:
                svc.navRight != null && _isNavFeatureActive(svc.navRight!),
          ),
          body: Stack(
            children: [
              SafeArea(
                top: _pageIndex != _pageHome && _pageIndex != _pageConnector,
                bottom: false,
                child: _buildPageStack(),
              ),
              _buildConsoleOverlay(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConsoleOverlay() {
    return ValueListenableBuilder<bool>(
      valueListenable: navigationController.consoleOpen,
      builder: (_, open, _) {
        if (!open) return const SizedBox.shrink();
        return Positioned.fill(
          child: ValueListenableBuilder<bool>(
            valueListenable: _debugEnabledNotifier,
            builder: (_, debugEnabled, _) => ConsoleDialog(
              logsNotifier: _logsNotifier,
              scrollController: _logScrollController,
              debugEnabled: debugEnabled,
              onToggleDebug: _toggleDebug,
              onClearLogs: _clearLogs,
              onCopyLogs: _copyLogs,
              onClose: navigationController.hideConsole,
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopShell(
    AppLocalizations loc,
    HomeCustomizationService svc,
  ) {
    return Stack(
      children: [
        _buildBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Row(
            children: [
              _DesktopSidebar(
                activeItem: _activeNavItem,
                onHomeTap: () => _goTo(_pageHome),
                onConnectorTap: () => _goTo(_pageConnector),
                onSkinsTap: () => _goTo(_pageSkins),
                onPartnersTap: () => _goTo(_pagePartners),
                onLookupTap: () => _goTo(_pagePlayerLookup),
                onTrackerTap: () => _goTo(_pageServerTracker),
                onProfileTap: () {
                  _loginFromTracker = false;
                  _loginFromRp = false;
                  _goTo(_pageProfile);
                },
                onFeedbackTap: () => _goTo(_pageFeedback),
                onHelpTap: () => _showHelpSheet(),
                onHowToTap: () => _showHowToSheet(),
              ),
              VerticalDivider(width: 1, color: AppTheme.borderGray),
              Expanded(
                child: ClipRect(
                  child: Stack(
                    children: [
                      Navigator(
                        key: _desktopNavKey,
                        onGenerateRoute: (settings) => MaterialPageRoute(
                          settings: settings,
                          builder: (_) => ValueListenableBuilder<int>(
                            valueListenable: _pageIndexNotifier,
                            builder: (_, _, _) => _buildPageStack(),
                          ),
                        ),
                      ),
                      _buildConsoleOverlay(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DesktopSidebar extends StatelessWidget {
  final String? activeItem;
  final VoidCallback onHomeTap;
  final VoidCallback onConnectorTap;
  final VoidCallback onSkinsTap;
  final VoidCallback onPartnersTap;
  final VoidCallback onLookupTap;
  final VoidCallback onTrackerTap;
  final VoidCallback onProfileTap;
  final VoidCallback onFeedbackTap;
  final VoidCallback onHelpTap;
  final VoidCallback onHowToTap;

  const _DesktopSidebar({
    required this.activeItem,
    required this.onHomeTap,
    required this.onConnectorTap,
    required this.onSkinsTap,
    required this.onPartnersTap,
    required this.onLookupTap,
    required this.onTrackerTap,
    required this.onProfileTap,
    required this.onFeedbackTap,
    required this.onHelpTap,
    required this.onHowToTap,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      width: 200,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/logo.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _SidebarItem(
                    icon: FontAwesomeIcons.house,
                    label: l.home,
                    isActive: activeItem == 'home',
                    onTap: onHomeTap,
                  ),
                  _SidebarItem(
                    icon: FontAwesomeIcons.play,
                    label: 'Connector',
                    isActive: activeItem == 'connector',
                    onTap: onConnectorTap,
                  ),
                  _SidebarItem(
                    icon: FontAwesomeIcons.server,
                    label: AppFeature.partners.label(l),
                    isActive: activeItem == 'partners',
                    onTap: onPartnersTap,
                  ),
                  _SidebarItem(
                    icon: FontAwesomeIcons.satellite,
                    label: AppFeature.tracker.label(l),
                    isActive: activeItem == 'tracker',
                    onTap: onTrackerTap,
                  ),
                  _SidebarItem(
                    icon: FontAwesomeIcons.magnifyingGlass,
                    label: AppFeature.lookup.label(l),
                    isActive: activeItem == 'lookup',
                    onTap: onLookupTap,
                  ),
                  _SidebarItem(
                    icon: FontAwesomeIcons.shirt,
                    label: AppFeature.skins.label(l),
                    isActive: activeItem == 'skins',
                    onTap: onSkinsTap,
                  ),
                  _SidebarItem(
                    icon: FontAwesomeIcons.user,
                    label: l.navProfile,
                    isActive: activeItem == 'profile',
                    onTap: onProfileTap,
                  ),
                ],
              ),
            ),
          ),
          Divider(color: AppTheme.borderGray, height: 1),
          const SizedBox(height: 8),
          _SidebarItem(
            icon: FontAwesomeIcons.bug,
            label: l.reportBug,
            isActive: activeItem == 'feedback',
            onTap: onFeedbackTap,
          ),
          _SidebarItem(
            icon: FontAwesomeIcons.circleQuestion,
            label: l.support,
            isActive: false,
            onTap: onHelpTap,
          ),
          _SidebarItem(
            icon: FontAwesomeIcons.lightbulb,
            label: l.howToUseMenu,
            isActive: false,
            onTap: onHowToTap,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final FaIconData icon;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppTheme.brand : AppTheme.textMuted;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
        decoration: BoxDecoration(
          color: isActive
              ? AppTheme.brand.withValues(alpha: 0.13)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isActive
              ? Border.all(
                  color: AppTheme.brand.withValues(alpha: 0.25),
                  width: 0.8,
                )
              : null,
        ),
        child: Row(
          children: [
            FaIcon(icon, size: 14, color: color),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 13,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                  letterSpacing: -0.1,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
