import 'dart:async';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';
import '../services/message_service.dart';
import '../models/user_model.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/profile/profile_auth_views.dart';
import '../widgets/profile/profile_header.dart';
import '../widgets/profile/profile_tabs.dart';
import '../widgets/profile/profile_desktop_sidebar.dart';
import 'register_screen.dart';
import 'chat_screen.dart';
import 'conversations_screen.dart';

class ProfileScreen extends StatefulWidget {
  final VoidCallback? onGoToHome;
  final VoidCallback? onGoToConnector;
  final VoidCallback? onGoToSkins;
  final VoidCallback? onGoToWiki;
  final VoidCallback? onLoggedIn;
  const ProfileScreen({
    super.key,
    this.onGoToHome,
    this.onGoToConnector,
    this.onGoToSkins,
    this.onGoToWiki,
    this.onLoggedIn,
  });

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  StreamSubscription<AuthUser?>? _authSubscription;
  StreamSubscription<({String uid, bool online})>? _presenceSub;
  bool _checking = false;

  _AuthState _authState = _AuthState.loading;
  bool _wasNotLoggedIn = false;
  UserModel? _me;
  List<FriendModel> _friends = [];
  List<FriendRequest> _requests = [];
  bool _loadingFriends = true;
  bool _loadingRequests = true;
  int _totalUnread = 0;
  StreamSubscription<dynamic>? _incomingSub;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 4, vsync: this);
    _authSubscription = AuthService.userStream.listen((_) => _checkAuth());
    _presenceSub = MessageService.presenceStream.listen(_onPresence);
    _incomingSub = MessageService.incoming.listen((_) => _refreshUnread());
    _checkAuth();
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    _presenceSub?.cancel();
    _incomingSub?.cancel();
    _tabs.dispose();
    super.dispose();
  }

  void switchToTab(int index) {
    if (!mounted) return;
    _tabs.animateTo(index);
  }

  void _onPresence(({String uid, bool online}) event) {
    if (!mounted) return;
    final idx = _friends.indexWhere((f) => f.firebaseUid == event.uid);
    if (idx == -1) return;
    final f = _friends[idx];
    final updated = FriendModel(
      firebaseUid: f.firebaseUid,
      username: f.username,
      displayName: f.displayName,
      avatarUrl: f.avatarUrl,
      online: event.online,
      session: event.online ? f.session : null,
      lastSeenAt: f.lastSeenAt,
    );
    setState(() {
      _friends = List.of(_friends)..[idx] = updated;
    });
  }

  Future<void> _checkAuth() async {
    if (_checking) return;
    _checking = true;

    final user = AuthService.currentUser;
    if (user == null) {
      if (mounted) {
        _wasNotLoggedIn = true;
        setState(() => _authState = _AuthState.notLoggedIn);
      }
      _checking = false;
      return;
    }

    final me = await UserService.getMe();
    if (!mounted) {
      _checking = false;
      return;
    }

    if (me == null) {
      setState(() => _authState = _AuthState.notRegistered);
      _checking = false;
      return;
    }

    final justLoggedIn = _wasNotLoggedIn;
    _wasNotLoggedIn = false;
    setState(() {
      _me = me;
      _authState = _AuthState.loggedIn;
      _loadingFriends = true;
      _loadingRequests = true;
    });
    _checking = false;
    if (justLoggedIn) widget.onLoggedIn?.call();
    _fetchFriends();
    _fetchRequests();
    _refreshUnread();
  }

  Future<void> _fetchMe() async {
    final me = await UserService.getMe();
    if (mounted) setState(() => _me = me);
  }

  Future<void> _fetchFriends() async {
    final friends = await UserService.getFriends();
    if (mounted) {
      setState(() {
        _friends = friends;
        _loadingFriends = false;
      });
    }
  }

  Future<void> _fetchRequests() async {
    final requests = await UserService.getFriendRequests();
    if (mounted) {
      setState(() {
        _requests = requests;
        _loadingRequests = false;
      });
    }
  }

  Future<void> _refreshUnread() async {
    final convs = await MessageService.getConversations();
    if (!mounted) return;
    final total = convs.fold(0, (sum, c) => sum + c.unreadCount);
    if (total != _totalUnread) setState(() => _totalUnread = total);
  }

  void _openRegister() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => RegisterScreen(
          onRegistered: () {
            Navigator.of(context).pop();
            _checkAuth();
          },
        ),
      ),
    );
  }

  void _openChat(FriendModel friend) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => ChatScreen(friend: friend)));
  }

  @override
  Widget build(BuildContext context) {
    if (_authState == _AuthState.loading) {
      return Center(
        child: CircularProgressIndicator(
          color: AppTheme.accent,
          strokeWidth: 2,
        ),
      );
    }

    if (_authState == _AuthState.notLoggedIn) {
      return const ProfileNotLoggedInView();
    }

    if (_authState == _AuthState.notRegistered) {
      return ProfileNotRegisteredView(onRegister: _openRegister);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 700;
        return isDesktop
            ? _buildDesktopLayout(context)
            : _buildMobileLayout(context);
      },
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Container(
      color: AppTheme.surfaceRaised,
      child: TabBar(
        controller: _tabs,
        indicatorColor: AppTheme.accent,
        indicatorWeight: 2,
        labelColor: AppTheme.accent,
        unselectedLabelColor: AppTheme.textMuted,
        labelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
        tabs: [
          const Tab(icon: Icon(Icons.person_rounded, size: 22)),
          const Tab(icon: Icon(Icons.people_rounded, size: 22)),
          Tab(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.person_add_rounded, size: 22),
                if (_requests.isNotEmpty)
                  Positioned(
                    right: -6,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(color: AppTheme.accent, borderRadius: BorderRadius.circular(10)),
                      child: Text('${_requests.length}', style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700)),
                    ),
                  ),
              ],
            ),
          ),
          Tab(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.chat_bubble_rounded, size: 22),
                if (_totalUnread > 0)
                  Positioned(
                    right: -6,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(color: AppTheme.error, borderRadius: BorderRadius.circular(10)),
                      child: Text(_totalUnread > 99 ? '99+' : '$_totalUnread', style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700)),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return TabBarView(
      controller: _tabs,
      children: [
        ProfileTab(
          me: _me,
          onRefresh: () async => _fetchMe(),
          onSignOut: () async { await AuthService.signOut(); },
          onDeleteAccount: _deleteAccount,
        ),
        ProfileFriendsTab(
          friends: _friends,
          loading: _loadingFriends,
          onRefresh: _fetchFriends,
          onRemove: _removeFriend,
          onChat: _openChat,
          onGoToHome: widget.onGoToHome,
          onGoToConnector: widget.onGoToConnector,
          onGoToSkins: widget.onGoToSkins,
          onGoToWiki: widget.onGoToWiki,
        ),
        ProfileRequestsTab(
          requests: _requests,
          loading: _loadingRequests,
          onRefresh: _fetchRequests,
          onAccept: _acceptRequest,
          onDecline: _declineRequest,
        ),
        ConversationsScreen(),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        ProfileHeader(
          me: _me,
          onAddFriend: _showAddFriendDialog,
          onGoToHome: widget.onGoToHome,
          onGoToConnector: widget.onGoToConnector,
          onGoToSkins: widget.onGoToSkins,
          onGoToWiki: widget.onGoToWiki,
        ),
        _buildTabBar(context),
        Expanded(child: _buildTabContent()),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 280,
          child: ProfileDesktopSidebar(
            me: _me,
            onAddFriend: _showAddFriendDialog,
            onGoToHome: widget.onGoToHome,
            onGoToConnector: widget.onGoToConnector,
            onGoToSkins: widget.onGoToSkins,
            onGoToWiki: widget.onGoToWiki,
          ),
        ),
        VerticalDivider(width: 1, color: AppTheme.borderGray),
        Expanded(
          child: Column(
            children: [
              _buildTabBar(context),
              Expanded(child: _buildTabContent()),
            ],
          ),
        ),
      ],
    );
  }

  void _showAddFriendDialog() {
    final ctrl = TextEditingController();
    final l = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surfaceRaised,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppTheme.borderGray),
        ),
        title: Text(l.addFriend),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          autocorrect: false,
          style: TextStyle(color: AppTheme.textPrimary),
          decoration: InputDecoration(
            hintText: l.usernameHint,
            prefixIcon: Icon(
              Icons.alternate_email_rounded,
              size: 18,
              color: AppTheme.textMuted,
            ),
          ),
          onSubmitted: (_) {
            Navigator.of(ctx).pop();
            _sendRequest(ctrl.text.trim());
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(l.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              _sendRequest(ctrl.text.trim());
            },
            child: Text(l.send),
          ),
        ],
      ),
    );
  }

  Future<void> _sendRequest(String username) async {
    if (username.isEmpty) return;
    final error = await UserService.sendFriendRequest(username);
    if (!mounted) return;
    final l = AppLocalizations.of(context)!;
    if (error == null) {
      AppToast.show(
        context,
        message: l.friendRequestSentTo(username),
        icon: Icons.check_circle_rounded,
        color: AppTheme.success,
      );
    } else {
      final msg = switch (error) {
        'already_friends' => l.alreadyFriendsWith(username),
        'request_pending' => l.requestAlreadyPending(username),
        'not_found' => l.userNotFoundMsg(username),
        'blocked' => l.cannotSendRequest(username),
        _ => l.somethingWentWrong,
      };
      AppToast.show(
        context,
        message: msg,
        icon: Icons.error_outline_rounded,
        color: AppTheme.error,
      );
    }
  }

  Future<void> _acceptRequest(FriendRequest req) async {
    final ok = await UserService.acceptFriendRequest(req.requesterUsername);
    if (!mounted) return;
    if (ok) {
      AppToast.show(
        context,
        message: AppLocalizations.of(
          context,
        )!.friendRequestAccepted(req.requesterUsername),
        icon: Icons.check_circle_rounded,
        color: AppTheme.success,
      );
      await Future.wait([_fetchFriends(), _fetchRequests()]);
    }
  }

  Future<void> _declineRequest(FriendRequest req) async {
    final ok = await UserService.removeFriend(req.requesterUsername);
    if (!mounted) return;
    if (ok) {
      AppToast.show(
        context,
        message: AppLocalizations.of(
          context,
        )!.requestDeclined(req.requesterUsername),
        icon: Icons.close_rounded,
        color: AppTheme.textMuted,
      );
      await _fetchRequests();
    }
  }

  Future<void> _deleteAccount() async {
    final l = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surfaceRaised,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppTheme.borderGray),
        ),
        title: Text(l.deleteAccountTitle),
        content: Text(
          l.deleteAccountBody,
          style: TextStyle(color: AppTheme.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.error),
            child: Text(l.deletePermanently),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    final ok = await UserService.deleteAccount();
    if (!mounted) return;
    if (!ok) {
      AppToast.show(
        context,
        message: l.couldNotDeleteAccount,
        icon: Icons.error_outline_rounded,
        color: AppTheme.error,
      );
      return;
    }

    try {
      await AuthService.currentUser?.delete();
    } catch (_) {
      await AuthService.signOut();
    }
  }

  Future<void> _removeFriend(FriendModel friend) async {
    final l = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surfaceRaised,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppTheme.borderGray),
        ),
        title: Text(l.removeFriendTitle),
        content: Text(
          l.removeFriendConfirm(friend.username),
          style: TextStyle(color: AppTheme.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.error),
            child: Text(l.remove),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    final ok = await UserService.removeFriend(friend.username);
    if (!mounted) return;
    if (ok) {
      AppToast.show(
        context,
        message: l.friendRemoved(friend.username),
        icon: Icons.person_remove_rounded,
        color: AppTheme.textMuted,
      );
      await _fetchFriends();
    }
  }
}

enum _AuthState { loading, notLoggedIn, notRegistered, loggedIn }
