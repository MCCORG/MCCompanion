import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart'
    show SignInWithAppleButton, SignInWithAppleButtonStyle;
import '../theme/app_theme.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';
import '../services/message_service.dart';
import '../models/user_model.dart';
import '../widgets/components/app_toast.dart';
import 'register_screen.dart';
import 'xbox_link_screen.dart';
import 'java_link_screen.dart';
import 'public_profile_screen.dart';
import 'chat_screen.dart';
import 'conversations_screen.dart';

class ProfileScreen extends StatefulWidget {
  final VoidCallback? onGoToHome;
  final VoidCallback? onGoToConnector;
  final VoidCallback? onGoToSkins;
  final VoidCallback? onGoToWiki;
  const ProfileScreen({
    super.key,
    this.onGoToHome,
    this.onGoToConnector,
    this.onGoToSkins,
    this.onGoToWiki,
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
  UserModel? _me;
  List<FriendModel> _friends = [];
  List<FriendRequest> _requests = [];
  bool _loadingFriends = true;
  bool _loadingRequests = true;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 4, vsync: this);
    _authSubscription = AuthService.userStream.listen((_) => _checkAuth());
    _presenceSub = MessageService.presenceStream.listen(_onPresence);
    _checkAuth();
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    _presenceSub?.cancel();
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
      if (mounted) setState(() => _authState = _AuthState.notLoggedIn);
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

    setState(() {
      _me = me;
      _authState = _AuthState.loggedIn;
      _loadingFriends = true;
      _loadingRequests = true;
    });
    _checking = false;
    _fetchFriends();
    _fetchRequests();
  }

  Future<void> _fetchMe() async {
    final me = await UserService.getMe();
    if (mounted) setState(() => _me = me);
  }

  Future<void> _fetchFriends() async {
    final friends = await UserService.getFriends();
    if (mounted)
      setState(() {
        _friends = friends;
        _loadingFriends = false;
      });
  }

  Future<void> _fetchRequests() async {
    final requests = await UserService.getFriendRequests();
    if (mounted)
      setState(() {
        _requests = requests;
        _loadingRequests = false;
      });
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
      return const _NotLoggedInView();
    }

    if (_authState == _AuthState.notRegistered) {
      return _NotRegisteredView(onRegister: _openRegister);
    }

    return Column(
      children: [
        _Header(
          me: _me,
          onAddFriend: _showAddFriendDialog,
          onGoToHome: widget.onGoToHome,
          onGoToConnector: widget.onGoToConnector,
          onGoToSkins: widget.onGoToSkins,
          onGoToWiki: widget.onGoToWiki,
        ),
        Container(
          color: AppTheme.surface,
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
              Tab(text: AppLocalizations.of(context)!.tabProfile),
              Tab(text: AppLocalizations.of(context)!.tabFriends),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        AppLocalizations.of(context)!.tabRequests,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (_requests.isNotEmpty) ...[
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.accent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${_requests.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Tab(text: AppLocalizations.of(context)!.tabChats),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabs,
            children: [
              _ProfileTab(
                me: _me,
                onRefresh: () async => _fetchMe(),
                onSignOut: () async {
                  await AuthService.signOut();
                },
                onDeleteAccount: _deleteAccount,
              ),
              _FriendsTab(
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
              _RequestsTab(
                requests: _requests,
                loading: _loadingRequests,
                onRefresh: _fetchRequests,
                onAccept: _acceptRequest,
                onDecline: _declineRequest,
              ),
              const ConversationsScreen(),
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
          style: const TextStyle(color: AppTheme.textPrimary),
          decoration: InputDecoration(
            hintText: l.usernameHint,
            prefixIcon: const Icon(
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
          style: const TextStyle(color: AppTheme.textSecondary),
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
          style: const TextStyle(color: AppTheme.textSecondary),
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

class _NotLoggedInView extends StatefulWidget {
  const _NotLoggedInView();

  @override
  State<_NotLoggedInView> createState() => _NotLoggedInViewState();
}

class _NotLoggedInViewState extends State<_NotLoggedInView> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;
  bool _googleLoading = false;
  bool _appleLoading = false;
  String? _error;
  bool _isRegisterMode = false;

  bool get _supportsGoogle => !Platform.isWindows;
  bool get _supportsApple => Platform.isIOS || Platform.isMacOS;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _signInWithGoogle() async {
    setState(() {
      _googleLoading = true;
      _error = null;
    });
    try {
      await AuthService.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      final l = AppLocalizations.of(context)!;
      setState(
        () => _error = switch (e.code) {
          'account-exists-with-different-credential' => l.emailDifferentMethod,
          _ => l.googleSignInFailed,
        },
      );
    } catch (_) {
      if (mounted)
        setState(
          () => _error = AppLocalizations.of(context)!.googleSignInFailed,
        );
    } finally {
      if (mounted) setState(() => _googleLoading = false);
    }
  }

  Future<void> _signInWithApple() async {
    setState(() {
      _appleLoading = true;
      _error = null;
    });
    try {
      await AuthService.signInWithApple();
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      final l = AppLocalizations.of(context)!;
      setState(
        () => _error = switch (e.code) {
          'account-exists-with-different-credential' => l.emailDifferentMethod,
          _ => l.appleSignInFailed,
        },
      );
    } catch (e) {
      if (!mounted) return;
      final msg = e.toString();
      if (!msg.contains('AuthorizationErrorCode.canceled') &&
          !msg.contains('canceled') &&
          !msg.contains('cancelled')) {
        setState(
          () => _error = AppLocalizations.of(context)!.appleSignInFailed,
        );
      }
    } finally {
      if (mounted) setState(() => _appleLoading = false);
    }
  }

  Future<void> _forgotPassword() async {
    final emailCtrl = TextEditingController(text: _emailCtrl.text.trim());
    final email = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surfaceRaised,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppTheme.borderGray),
        ),
        title: Text(
          AppLocalizations.of(ctx)!.resetPasswordTitle,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(ctx)!.resetPasswordBody,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailCtrl,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              autofocus: true,
              style: const TextStyle(color: AppTheme.textPrimary),
              decoration: InputDecoration(
                hintText: AppLocalizations.of(ctx)!.emailAddressHint,
                prefixIcon: const Icon(
                  Icons.email_rounded,
                  size: 18,
                  color: AppTheme.textMuted,
                ),
              ),
              onSubmitted: (v) => Navigator.of(ctx).pop(v.trim()),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(null),
            child: Text(AppLocalizations.of(ctx)!.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(emailCtrl.text.trim()),
            child: Text(
              AppLocalizations.of(ctx)!.sendLink,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
    emailCtrl.dispose();

    if (email == null || email.isEmpty || !mounted) return;

    try {
      await AuthService.sendPasswordResetEmail(email);
      if (!mounted) return;
      AppToast.show(
        context,
        message: AppLocalizations.of(context)!.resetLinkSent(email),
        icon: Icons.mark_email_read_rounded,
        color: AppTheme.success,
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      final l = AppLocalizations.of(context)!;
      final msg = switch (e.code) {
        'user-not-found' => l.noAccountForEmail,
        'invalid-email' => l.invalidEmailError,
        _ => l.couldNotSendResetEmail,
      };
      AppToast.show(
        context,
        message: msg,
        icon: Icons.error_outline_rounded,
        color: AppTheme.error,
      );
    } catch (_) {
      if (!mounted) return;
      AppToast.show(
        context,
        message: AppLocalizations.of(context)!.couldNotSendResetEmail,
        icon: Icons.error_outline_rounded,
        color: AppTheme.error,
      );
    }
  }

  Future<void> _submit() async {
    final email = _emailCtrl.text.trim();
    final pass = _passCtrl.text;
    if (email.isEmpty || pass.isEmpty) {
      setState(
        () => _error = AppLocalizations.of(context)!.enterEmailAndPassword,
      );
      return;
    }
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      if (_isRegisterMode) {
        await AuthService.createAccountWithEmail(email, pass);
      } else {
        await AuthService.signInWithEmail(email, pass);
      }
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      final l = AppLocalizations.of(context)!;
      setState(() {
        _error = switch (e.code) {
          'user-not-found' ||
          'wrong-password' ||
          'invalid-credential' => l.incorrectEmailOrPassword,
          'email-already-in-use' => l.emailAlreadyInUse,
          'weak-password' => l.weakPassword,
          'invalid-email' => l.invalidEmailError,
          _ => l.somethingWentWrong,
        };
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = AppLocalizations.of(context)!.somethingWentWrong);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppTheme.accent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppTheme.accent.withOpacity(0.30)),
                ),
                child: Icon(
                  Icons.person_rounded,
                  color: AppTheme.accent,
                  size: 28,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _isRegisterMode
                    ? AppLocalizations.of(context)!.createAccount
                    : AppLocalizations.of(context)!.signIn,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                AppLocalizations.of(context)!.signInSubtitle,
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 28),
              TextField(
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: AppTheme.textPrimary),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.emailAddressHint,
                  prefixIcon: const Icon(
                    Icons.email_rounded,
                    size: 18,
                    color: AppTheme.textMuted,
                  ),
                ),
                onChanged: (_) {
                  if (_error != null) setState(() => _error = null);
                },
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _passCtrl,
                obscureText: true,
                textInputAction: TextInputAction.done,
                style: const TextStyle(color: AppTheme.textPrimary),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.passwordHint,
                  prefixIcon: const Icon(
                    Icons.lock_rounded,
                    size: 18,
                    color: AppTheme.textMuted,
                  ),
                ),
                onSubmitted: (_) => _submit(),
                onChanged: (_) {
                  if (_error != null) setState(() => _error = null);
                },
              ),
              if (!_isRegisterMode) ...[
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _forgotPassword,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 4,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.forgotPassword,
                      style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
              if (_error != null) ...[
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.error.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppTheme.error.withOpacity(0.30)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.error_outline_rounded,
                        color: AppTheme.error,
                        size: 16,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _error!,
                          style: const TextStyle(
                            color: AppTheme.error,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _loading ? null : _submit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _loading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        _isRegisterMode
                            ? AppLocalizations.of(context)!.createAccount
                            : AppLocalizations.of(context)!.signIn,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
              ),
              if (_supportsApple || _supportsGoogle) ...[
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Expanded(child: Divider(color: AppTheme.borderGray)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        AppLocalizations.of(context)!.orDivider,
                        style: const TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider(color: AppTheme.borderGray)),
                  ],
                ),
                const SizedBox(height: 16),
                if (_supportsApple) ...[
                  SignInWithAppleButton(
                    onPressed: (_loading || _googleLoading || _appleLoading)
                        ? () {}
                        : _signInWithApple,
                    style: SignInWithAppleButtonStyle.black,
                    height: 48,
                  ),
                  if (_supportsGoogle) const SizedBox(height: 12),
                ],
                if (_supportsGoogle)
                  OutlinedButton(
                    onPressed: (_loading || _googleLoading || _appleLoading)
                        ? null
                        : _signInWithGoogle,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: AppTheme.borderGray),
                      backgroundColor: AppTheme.surfaceRaised,
                    ),
                    child: _googleLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: AppTheme.textMuted,
                              strokeWidth: 2,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.google,
                                size: 16,
                                color: AppTheme.textPrimary,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                AppLocalizations.of(
                                  context,
                                )!.continueWithGoogle,
                                style: const TextStyle(
                                  color: AppTheme.textPrimary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                  ),
              ],
              const SizedBox(height: 14),
              TextButton(
                onPressed: () =>
                    setState(() => _isRegisterMode = !_isRegisterMode),
                child: Text(
                  _isRegisterMode
                      ? AppLocalizations.of(context)!.alreadyHaveAccount
                      : AppLocalizations.of(context)!.noAccountYet,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotRegisteredView extends StatelessWidget {
  final VoidCallback onRegister;
  const _NotRegisteredView({required this.onRegister});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppTheme.accent.withOpacity(0.12),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.accent.withOpacity(0.30)),
              ),
              child: Icon(
                Icons.person_add_rounded,
                color: AppTheme.accent,
                size: 28,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.profileNotSetUp,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.chooseUsernameSubtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRegister,
              icon: const Icon(Icons.arrow_forward_rounded, size: 16),
              label: Text(
                AppLocalizations.of(context)!.createProfile,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final UserModel? me;
  final VoidCallback onAddFriend;
  final VoidCallback? onGoToHome;
  final VoidCallback? onGoToConnector;
  final VoidCallback? onGoToSkins;
  final VoidCallback? onGoToWiki;

  const _Header({
    required this.me,
    required this.onAddFriend,
    this.onGoToHome,
    this.onGoToConnector,
    this.onGoToSkins,
    this.onGoToWiki,
  });

  void _openSearch(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => UserSearchScreen(
          onGoToHome: onGoToHome,
          onGoToConnector: onGoToConnector,
          onGoToSkins: onGoToSkins,
          onGoToWiki: onGoToWiki,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      color: AppTheme.surface,
      child: Row(
        children: [
          _Avatar(
            initials: me?.initials ?? '?',
            size: 52,
            avatarUrl: me?.avatarUrl,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  me?.displayLabel ?? '—',
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (me?.username != null)
                  Text(
                    '@${me!.username}',
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ),
          _IconBtn(
            icon: Icons.search_rounded,
            tooltip: AppLocalizations.of(context)!.findUser,
            onTap: () => _openSearch(context),
          ),
          const SizedBox(width: 8),
          _IconBtn(
            icon: Icons.person_add_rounded,
            tooltip: AppLocalizations.of(context)!.addFriend,
            onTap: onAddFriend,
          ),
        ],
      ),
    );
  }
}

class _ProfileTab extends StatefulWidget {
  final UserModel? me;
  final Future<void> Function() onRefresh;
  final Future<void> Function() onSignOut;
  final Future<void> Function() onDeleteAccount;
  const _ProfileTab({
    required this.me,
    required this.onRefresh,
    required this.onSignOut,
    required this.onDeleteAccount,
  });

  @override
  State<_ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<_ProfileTab> {
  bool? _appearOffline;

  bool get _effectiveAppearOffline =>
      _appearOffline ?? widget.me?.appearOffline ?? false;

  Future<void> _toggleAppearOffline(bool value) async {
    setState(() => _appearOffline = value);
    final updated = await UserService.updateMe(appearOffline: value);
    if (!mounted) return;
    if (updated == null) {
      setState(() => _appearOffline = !value);
      AppToast.show(
        context,
        message: AppLocalizations.of(context)!.couldNotUpdateVisibility,
        icon: Icons.error_outline_rounded,
        color: AppTheme.error,
        duration: const Duration(seconds: 2),
      );
    } else {
      await widget.onRefresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.me == null) return const _LoadingBody();
    return RefreshIndicator(
      color: AppTheme.accent,
      backgroundColor: AppTheme.surfaceRaised,
      onRefresh: widget.onRefresh,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _EditProfileCard(me: widget.me!, onUpdated: widget.onRefresh),
          const SizedBox(height: 12),
          _LinkedAccountsCard(me: widget.me!, onRefresh: widget.onRefresh),
          const SizedBox(height: 12),
          _SettingsCard(
            appearOffline: _effectiveAppearOffline,
            onToggleAppearOffline: _toggleAppearOffline,
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: widget.onSignOut,
            icon: const Icon(Icons.logout_rounded, size: 16),
            label: Text(AppLocalizations.of(context)!.signOut),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.error,
              side: BorderSide(color: AppTheme.error.withOpacity(0.40)),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: widget.onDeleteAccount,
            icon: const Icon(Icons.delete_forever_rounded, size: 16),
            label: Text(AppLocalizations.of(context)!.deleteAccountTitle),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.error,
              side: BorderSide(color: AppTheme.error.withOpacity(0.20)),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final bool appearOffline;
  final Future<void> Function(bool) onToggleAppearOffline;

  const _SettingsCard({
    required this.appearOffline,
    required this.onToggleAppearOffline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: appearOffline
                    ? AppTheme.textMuted.withOpacity(0.15)
                    : AppTheme.success.withOpacity(0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                appearOffline
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                size: 16,
                color: appearOffline ? AppTheme.textMuted : AppTheme.success,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.appearOfflineLabel,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    appearOffline
                        ? AppLocalizations.of(context)!.appearOfflineOn
                        : AppLocalizations.of(context)!.appearOfflineOff,
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: appearOffline,
              onChanged: onToggleAppearOffline,
              activeColor: AppTheme.accent,
            ),
          ],
        ),
      ),
    );
  }
}

class _LinkedAccountsCard extends StatefulWidget {
  final UserModel me;
  final Future<void> Function() onRefresh;
  const _LinkedAccountsCard({required this.me, required this.onRefresh});

  @override
  State<_LinkedAccountsCard> createState() => _LinkedAccountsCardState();
}

class _LinkedAccountsCardState extends State<_LinkedAccountsCard> {
  final Set<String> _unlinking = {};

  static const _xboxGreen = Color(0xFF107C10);
  static const _javaBlue = Color(0xFF1565C0);

  Future<void> _openXboxLink() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => XboxLinkScreen(
          onLinked: () {
            Navigator.of(context).pop();
            widget.onRefresh();
          },
        ),
      ),
    );
  }

  Future<void> _openJavaLink() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => JavaLinkScreen(
          onLinked: () {
            Navigator.of(context).pop();
            widget.onRefresh();
          },
        ),
      ),
    );
  }

  Future<void> _unlinkBedrock(BedrockAccount account) async {
    final label = account.xboxGamertag ?? account.xboxXuid;
    final l = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surfaceRaised,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppTheme.borderGray),
        ),
        title: Text(l.unlinkXboxTitle),
        content: Text(
          l.removeLabelConfirm(label),
          style: const TextStyle(color: AppTheme.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.error),
            child: Text(l.unlink),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    setState(() => _unlinking.add(account.xboxXuid));
    await UserService.unlinkBedrockAccount(account.xboxXuid);
    if (!mounted) return;
    setState(() => _unlinking.remove(account.xboxXuid));
    widget.onRefresh();
  }

  Future<void> _unlinkJava(JavaAccount account) async {
    final l = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surfaceRaised,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppTheme.borderGray),
        ),
        title: Text(l.unlinkJavaTitle),
        content: Text(
          l.removeJavaConfirm(account.javaUsername),
          style: const TextStyle(color: AppTheme.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.error),
            child: Text(l.unlink),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    setState(() => _unlinking.add(account.javaUuid));
    await UserService.unlinkJavaAccount(account.javaUuid);
    if (!mounted) return;
    setState(() => _unlinking.remove(account.javaUuid));
    widget.onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    final bedrock = widget.me.bedrockAccounts;
    final java = widget.me.javaAccounts;
    final hasAny = bedrock.isNotEmpty || java.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
            child: Text(
              AppLocalizations.of(context)!.linkedAccountsTitle,
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
          if (!hasAny)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
              child: Text(
                AppLocalizations.of(context)!.linkAccountsHint,
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
            ),
          if (hasAny) ...[
            const Divider(height: 1, color: AppTheme.borderGray),
            ...bedrock.map(
              (acc) => _AccountRow(
                icon: Icons.sports_esports_rounded,
                color: _xboxGreen,
                name: acc.xboxGamertag ?? acc.xboxXuid,
                subtitle: AppLocalizations.of(
                  context,
                )!.accountSubtitleXbox(acc.xboxXuid),
                unlinking: _unlinking.contains(acc.xboxXuid),
                onUnlink: () => _unlinkBedrock(acc),
              ),
            ),
            ...java.map(
              (acc) => _AccountRow(
                icon: Icons.videogame_asset_rounded,
                color: _javaBlue,
                name: acc.javaUsername,
                subtitle: AppLocalizations.of(
                  context,
                )!.accountSubtitleJava(acc.javaUuid),
                unlinking: _unlinking.contains(acc.javaUuid),
                onUnlink: () => _unlinkJava(acc),
              ),
            ),
          ],
          const Divider(height: 1, color: AppTheme.borderGray),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: _openXboxLink,
                    icon: const Icon(
                      Icons.sports_esports_rounded,
                      size: 14,
                      color: _xboxGreen,
                    ),
                    label: Text(
                      AppLocalizations.of(context)!.linkXbox,
                      style: const TextStyle(color: _xboxGreen, fontSize: 13),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: AppTheme.borderGray,
                ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: _openJavaLink,
                    icon: const Icon(
                      Icons.videogame_asset_rounded,
                      size: 14,
                      color: _javaBlue,
                    ),
                    label: Text(
                      AppLocalizations.of(context)!.linkJava,
                      style: const TextStyle(color: _javaBlue, fontSize: 13),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String name;
  final String subtitle;
  final bool unlinking;
  final VoidCallback onUnlink;

  const _AccountRow({
    required this.icon,
    required this.color,
    required this.name,
    required this.subtitle,
    required this.unlinking,
    required this.onUnlink,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 10,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: unlinking ? null : onUnlink,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppTheme.error.withOpacity(0.08),
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: AppTheme.error.withOpacity(0.25)),
              ),
              child: unlinking
                  ? const SizedBox(
                      width: 12,
                      height: 12,
                      child: CircularProgressIndicator(
                        color: AppTheme.error,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      AppLocalizations.of(context)!.unlink,
                      style: const TextStyle(
                        color: AppTheme.error,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EditProfileCard extends StatefulWidget {
  final UserModel me;
  final Future<void> Function() onUpdated;
  const _EditProfileCard({required this.me, required this.onUpdated});

  @override
  State<_EditProfileCard> createState() => _EditProfileCardState();
}

class _EditProfileCardState extends State<_EditProfileCard> {
  bool _editing = false;
  bool _saving = false;
  bool _obscureAvatar = true;
  late final TextEditingController _displayNameCtrl;
  late final TextEditingController _bioCtrl;
  late final TextEditingController _avatarUrlCtrl;

  @override
  void initState() {
    super.initState();
    _displayNameCtrl = TextEditingController(text: widget.me.displayName ?? '');
    _bioCtrl = TextEditingController(text: widget.me.bio ?? '');
    _avatarUrlCtrl = TextEditingController(text: widget.me.avatarUrl ?? '');
  }

  @override
  void dispose() {
    _displayNameCtrl.dispose();
    _bioCtrl.dispose();
    _avatarUrlCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    final avatarVal = _avatarUrlCtrl.text.trim();
    final updated = await UserService.updateMe(
      displayName: _displayNameCtrl.text.trim(),
      bio: _bioCtrl.text.trim(),
      avatarUrl: avatarVal.isNotEmpty ? avatarVal : null,
    );
    if (!mounted) return;
    setState(() {
      _saving = false;
      _editing = false;
    });
    if (updated != null) {
      await widget.onUpdated();
      if (mounted) {
        AppToast.show(
          context,
          message: AppLocalizations.of(context)!.profileUpdated,
          icon: Icons.check_circle_rounded,
          color: AppTheme.success,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(14),
        border: const Border.fromBorderSide(
          BorderSide(color: AppTheme.borderGray),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.profileCardTitle,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              if (!_editing)
                TextButton.icon(
                  onPressed: () => setState(() => _editing = true),
                  icon: const Icon(Icons.edit_rounded, size: 14),
                  label: Text(AppLocalizations.of(context)!.edit),
                  style: TextButton.styleFrom(
                    foregroundColor: AppTheme.accent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          if (_editing) ...[
            _FieldLabel(AppLocalizations.of(context)!.displayNameLabel),
            const SizedBox(height: 6),
            TextField(
              controller: _displayNameCtrl,
              style: const TextStyle(color: AppTheme.textPrimary),
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.yourNameHint,
              ),
            ),
            const SizedBox(height: 14),
            _FieldLabel(AppLocalizations.of(context)!.bioLabel),
            const SizedBox(height: 6),
            TextField(
              controller: _bioCtrl,
              style: const TextStyle(color: AppTheme.textPrimary),
              maxLines: 3,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.bioHint,
              ),
            ),
            const SizedBox(height: 14),
            _FieldLabel(AppLocalizations.of(context)!.avatarUrlLabel),
            const SizedBox(height: 6),
            TextField(
              controller: _avatarUrlCtrl,
              style: const TextStyle(color: AppTheme.textPrimary),
              keyboardType: TextInputType.url,
              autocorrect: false,
              obscureText: _obscureAvatar,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.avatarUrlHint,
                prefixIcon: const Icon(
                  Icons.image_rounded,
                  size: 18,
                  color: AppTheme.textMuted,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureAvatar
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    size: 18,
                    color: AppTheme.textMuted,
                  ),
                  onPressed: () =>
                      setState(() => _obscureAvatar = !_obscureAvatar),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _saving
                        ? null
                        : () => setState(() => _editing = false),
                    child: Text(AppLocalizations.of(context)!.cancel),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _saving ? null : _save,
                    child: _saving
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(AppLocalizations.of(context)!.save),
                  ),
                ),
              ],
            ),
          ] else ...[
            _ProfileRow(
              label: AppLocalizations.of(context)!.displayNameLabel,
              value: widget.me.displayName?.isNotEmpty == true
                  ? widget.me.displayName!
                  : '—',
            ),
            const SizedBox(height: 8),
            _ProfileRow(
              label: AppLocalizations.of(context)!.usernameDisplayLabel,
              value: '@${widget.me.username}',
            ),
            if (widget.me.bio?.isNotEmpty == true) ...[
              const SizedBox(height: 8),
              _ProfileRow(
                label: AppLocalizations.of(context)!.aboutMe,
                value: widget.me.bio!,
              ),
            ],
            if (widget.me.avatarUrl?.isNotEmpty == true) ...[
              const SizedBox(height: 8),
              _ProfileRow(
                label: AppLocalizations.of(context)!.avatarUrlLabel,
                value: '••••••••••••',
              ),
            ],
          ],
        ],
      ),
    );
  }
}

class _FriendsTab extends StatelessWidget {
  final List<FriendModel> friends;
  final bool loading;
  final Future<void> Function() onRefresh;
  final Future<void> Function(FriendModel) onRemove;
  final void Function(FriendModel) onChat;
  final VoidCallback? onGoToHome;
  final VoidCallback? onGoToConnector;
  final VoidCallback? onGoToSkins;
  final VoidCallback? onGoToWiki;
  const _FriendsTab({
    required this.friends,
    required this.loading,
    required this.onRefresh,
    required this.onRemove,
    required this.onChat,
    this.onGoToHome,
    this.onGoToConnector,
    this.onGoToSkins,
    this.onGoToWiki,
  });

  @override
  Widget build(BuildContext context) {
    if (loading) return const _LoadingBody();
    if (friends.isEmpty) {
      return _EmptyBody(
        icon: Icons.people_outline_rounded,
        message: AppLocalizations.of(context)!.noFriendsYet,
        sub: AppLocalizations.of(context)!.noFriendsSub,
      );
    }

    final online = friends.where((f) => f.online).toList();
    final offline = friends.where((f) => !f.online).toList();

    return RefreshIndicator(
      color: AppTheme.accent,
      backgroundColor: AppTheme.surfaceRaised,
      onRefresh: onRefresh,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          if (online.isNotEmpty) ...[
            _SectionLabel(
              AppLocalizations.of(context)!.onlineFriendsLabel(online.length),
            ),
            const SizedBox(height: 8),
            ...online.map(
              (f) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _FriendTile(
                  friend: f,
                  onRemove: () => onRemove(f),
                  onChat: () => onChat(f),
                  onGoToHome: onGoToHome,
                  onGoToConnector: onGoToConnector,
                  onGoToSkins: onGoToSkins,
                  onGoToWiki: onGoToWiki,
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
          if (offline.isNotEmpty) ...[
            _SectionLabel(
              AppLocalizations.of(context)!.offlineFriendsLabel(offline.length),
            ),
            const SizedBox(height: 8),
            ...offline.map(
              (f) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _FriendTile(
                  friend: f,
                  onRemove: () => onRemove(f),
                  onChat: () => onChat(f),
                  onGoToHome: onGoToHome,
                  onGoToConnector: onGoToConnector,
                  onGoToSkins: onGoToSkins,
                  onGoToWiki: onGoToWiki,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _FriendTile extends StatelessWidget {
  final FriendModel friend;
  final VoidCallback onRemove;
  final VoidCallback onChat;
  final VoidCallback? onGoToHome;
  final VoidCallback? onGoToConnector;
  final VoidCallback? onGoToSkins;
  final VoidCallback? onGoToWiki;
  const _FriendTile({
    required this.friend,
    required this.onRemove,
    required this.onChat,
    this.onGoToHome,
    this.onGoToConnector,
    this.onGoToSkins,
    this.onGoToWiki,
  });

  void _openProfile(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PublicProfileScreen(
          username: friend.username,
          onGoToHome: onGoToHome,
          onGoToConnector: onGoToConnector,
          onGoToSkins: onGoToSkins,
          onGoToWiki: onGoToWiki,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openProfile(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.surfaceRaised,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: friend.online
                ? AppTheme.success.withOpacity(0.25)
                : AppTheme.borderGray,
          ),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                _Avatar(
                  initials: friend.initials,
                  size: 42,
                  avatarUrl: friend.avatarUrl,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 11,
                    height: 11,
                    decoration: BoxDecoration(
                      color: friend.online
                          ? AppTheme.success
                          : AppTheme.textDisabled,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.surfaceRaised,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    friend.displayLabel,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    '@${friend.username}',
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 11,
                    ),
                  ),
                  if (friend.online && friend.session != null) ...[
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(
                          Icons.sports_esports_rounded,
                          size: 11,
                          color: AppTheme.success,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          friend.session!.serverIp,
                          style: const TextStyle(
                            color: AppTheme.success,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            GestureDetector(
              onTap: onChat,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.chat_bubble_rounded,
                  color: AppTheme.accent.withOpacity(0.70),
                  size: 18,
                ),
              ),
            ),
            GestureDetector(
              onTap: onRemove,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.person_remove_rounded,
                  color: AppTheme.textMuted,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RequestsTab extends StatelessWidget {
  final List<FriendRequest> requests;
  final bool loading;
  final Future<void> Function() onRefresh;
  final Future<void> Function(FriendRequest) onAccept;
  final Future<void> Function(FriendRequest) onDecline;
  const _RequestsTab({
    required this.requests,
    required this.loading,
    required this.onRefresh,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    if (loading) return const _LoadingBody();
    if (requests.isEmpty) {
      return _EmptyBody(
        icon: Icons.mark_email_read_rounded,
        message: AppLocalizations.of(context)!.noPendingRequests,
        sub: AppLocalizations.of(context)!.requestsAppearHere,
      );
    }
    return RefreshIndicator(
      color: AppTheme.accent,
      backgroundColor: AppTheme.surfaceRaised,
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: requests.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, i) => _RequestTile(
          request: requests[i],
          onAccept: () => onAccept(requests[i]),
          onDecline: () => onDecline(requests[i]),
        ),
      ),
    );
  }
}

class _RequestTile extends StatelessWidget {
  final FriendRequest request;
  final VoidCallback onAccept;
  final VoidCallback onDecline;
  const _RequestTile({
    required this.request,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.accent.withOpacity(0.20)),
      ),
      child: Row(
        children: [
          _Avatar(
            initials: request.initials,
            size: 42,
            avatarUrl: request.requesterAvatarUrl,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  request.displayLabel,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                Text(
                  '@${request.requesterUsername}',
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _SmallBtn(
                icon: Icons.close_rounded,
                color: AppTheme.error,
                onTap: onDecline,
              ),
              const SizedBox(width: 8),
              _SmallBtn(
                icon: Icons.check_rounded,
                color: AppTheme.success,
                onTap: onAccept,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String initials;
  final double size;
  final String? avatarUrl;
  const _Avatar({required this.initials, required this.size, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    final hasImage = avatarUrl != null && avatarUrl!.isNotEmpty;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppTheme.accent.withOpacity(0.15),
        shape: BoxShape.circle,
        border: Border.all(color: AppTheme.accent.withOpacity(0.30)),
      ),
      child: ClipOval(
        child: hasImage
            ? Image.network(
                avatarUrl!,
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Center(
                  child: Text(
                    initials,
                    style: TextStyle(
                      color: AppTheme.accent,
                      fontSize: size * 0.33,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            : Center(
                child: Text(
                  initials,
                  style: TextStyle(
                    color: AppTheme.accent,
                    fontSize: size * 0.33,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
      ),
    );
  }
}

class _SmallBtn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  const _SmallBtn({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.30)),
        ),
        child: Icon(icon, color: color, size: 16),
      ),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  const _IconBtn({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: AppTheme.accent.withOpacity(0.10),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.accent.withOpacity(0.25)),
          ),
          child: Icon(icon, color: AppTheme.accent, size: 18),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: const TextStyle(
      color: AppTheme.textMuted,
      fontSize: 10,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.4,
    ),
  );
}

class _ProfileRow extends StatelessWidget {
  final String label;
  final String value;
  const _ProfileRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(color: AppTheme.textPrimary, fontSize: 13),
          ),
        ),
      ],
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: const TextStyle(
      color: AppTheme.textSecondary,
      fontSize: 11,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.4,
    ),
  );
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(12),
        border: const Border.fromBorderSide(
          BorderSide(color: AppTheme.borderGray),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: AppTheme.textMuted),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context) => Center(
    child: CircularProgressIndicator(color: AppTheme.accent, strokeWidth: 2),
  );
}

class _EmptyBody extends StatelessWidget {
  final IconData icon;
  final String message;
  final String sub;
  const _EmptyBody({
    required this.icon,
    required this.message,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppTheme.textDisabled, size: 40),
          const SizedBox(height: 12),
          Text(
            message,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            sub,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
