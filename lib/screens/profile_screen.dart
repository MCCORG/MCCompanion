import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
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
      return const Center(
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
              const Tab(text: 'PROFILE'),
              const Tab(text: 'FRIENDS'),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'REQUESTS',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                      ),
                    ),
                    if (_requests.isNotEmpty) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
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
              const Tab(text: 'CHATS'),
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
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surfaceRaised,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppTheme.borderGray),
        ),
        title: const Text('Add friend'),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          autocorrect: false,
          style: const TextStyle(color: AppTheme.textPrimary),
          decoration: const InputDecoration(
            hintText: 'username',
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
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              _sendRequest(ctrl.text.trim());
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }

  Future<void> _sendRequest(String username) async {
    if (username.isEmpty) return;
    final error = await UserService.sendFriendRequest(username);
    if (!mounted) return;
    if (error == null) {
      AppToast.show(
        context,
        message: 'Friend request sent to @$username',
        icon: Icons.check_circle_rounded,
        color: AppTheme.success,
      );
    } else {
      final msg = switch (error) {
        'already_friends' => 'You are already friends with @$username.',
        'request_pending' =>
          'There is already a pending request with @$username.',
        'not_found' => 'User @$username not found.',
        'blocked' => 'You cannot send a request to @$username.',
        _ => 'Something went wrong. Please try again.',
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
        message: 'Friend request from @${req.requesterUsername} accepted',
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
        message: 'Request from @${req.requesterUsername} declined',
        icon: Icons.close_rounded,
        color: AppTheme.textMuted,
      );
      await _fetchRequests();
    }
  }

  Future<void> _deleteAccount() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surfaceRaised,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppTheme.borderGray),
        ),
        title: const Text('Delete account'),
        content: const Text(
          'This will permanently delete your account, messages, friends and all associated data. This action cannot be undone.',
          style: TextStyle(color: AppTheme.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.error),
            child: const Text('Delete permanently'),
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
        message: 'Could not delete account. Please try again.',
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
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surfaceRaised,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppTheme.borderGray),
        ),
        title: const Text('Remove friend'),
        content: Text(
          'Do you want to remove @${friend.username} as a friend?',
          style: const TextStyle(color: AppTheme.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.error),
            child: const Text('Remove'),
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
        message: '@${friend.username} removed from your friends',
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
      setState(() => _error = switch (e.code) {
            'account-exists-with-different-credential' =>
              'An account already exists with this email using a different sign-in method.',
            _ => 'Google sign-in failed. Please try again.',
          });
    } catch (_) {
      if (mounted) setState(() => _error = 'Google sign-in failed. Please try again.');
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
      setState(() => _error = switch (e.code) {
            'account-exists-with-different-credential' =>
              'An account already exists with this email using a different sign-in method.',
            _ => 'Apple sign-in failed. Please try again.',
          });
    } catch (e) {
      if (!mounted) return;
      final msg = e.toString();
      // User cancelled — no error message needed
      if (!msg.contains('AuthorizationErrorCode.canceled') &&
          !msg.contains('canceled') &&
          !msg.contains('cancelled')) {
        setState(() => _error = 'Apple sign-in failed. Please try again.');
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
        title: const Text(
          'Reset password',
          style: TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w700),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your email address and we\'ll send you a link to reset your password.',
              style: TextStyle(
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
              decoration: const InputDecoration(
                hintText: 'Email address',
                prefixIcon: Icon(
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
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(emailCtrl.text.trim()),
            child: const Text(
              'Send link',
              style: TextStyle(fontWeight: FontWeight.w700),
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
        message: 'Reset link sent to $email',
        icon: Icons.mark_email_read_rounded,
        color: AppTheme.success,
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      final msg = switch (e.code) {
        'user-not-found' => 'No account found for this email address.',
        'invalid-email' => 'Invalid email address.',
        _ => 'Could not send reset email. Please try again.',
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
        message: 'Could not send reset email. Please try again.',
        icon: Icons.error_outline_rounded,
        color: AppTheme.error,
      );
    }
  }

  Future<void> _submit() async {
    final email = _emailCtrl.text.trim();
    final pass = _passCtrl.text;
    if (email.isEmpty || pass.isEmpty) {
      setState(() => _error = 'Please enter your email and password.');
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
      setState(() {
        _error = switch (e.code) {
          'user-not-found' ||
          'wrong-password' ||
          'invalid-credential' => 'Incorrect email or password.',
          'email-already-in-use' => 'This email address is already in use.',
          'weak-password' => 'Password must be at least 6 characters.',
          'invalid-email' => 'Invalid email address.',
          _ => 'Something went wrong. Please try again.',
        };
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = 'Something went wrong. Please try again.');
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
                child: const Icon(
                  Icons.person_rounded,
                  color: AppTheme.accent,
                  size: 28,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _isRegisterMode ? 'Create account' : 'Sign in',
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Sign in to add friends and share your sessions.',
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
                decoration: const InputDecoration(
                  hintText: 'Email address',
                  prefixIcon: Icon(
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
                decoration: const InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(
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
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
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
                        _isRegisterMode ? 'Create account' : 'Sign in',
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
                        'or',
                        style: TextStyle(
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
                              const Text(
                                'Continue with Google',
                                style: TextStyle(
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
                      ? 'Already have an account? Sign in'
                      : 'No account yet? Register',
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
              child: const Icon(
                Icons.person_add_rounded,
                color: AppTheme.accent,
                size: 28,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Profile not set up yet',
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose a username to add friends and share your sessions.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRegister,
              icon: const Icon(Icons.arrow_forward_rounded, size: 16),
              label: const Text(
                'Create profile',
                style: TextStyle(fontWeight: FontWeight.w700),
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
          _Avatar(initials: me?.initials ?? '?', size: 52, avatarUrl: me?.avatarUrl),
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
            tooltip: 'Find user',
            onTap: () => _openSearch(context),
          ),
          const SizedBox(width: 8),
          _IconBtn(
            icon: Icons.person_add_rounded,
            tooltip: 'Add friend',
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
      // Revert on failure
      setState(() => _appearOffline = !value);
      AppToast.show(
        context,
        message: 'Could not update visibility. Try again.',
        icon: Icons.error_outline_rounded,
        color: AppTheme.error,
        duration: const Duration(seconds: 2),
      );
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
          if (widget.me!.bio?.isNotEmpty == true) ...[
            const SizedBox(height: 12),
            _InfoCard(
              icon: Icons.info_outline_rounded,
              label: 'About me',
              value: widget.me!.bio!,
            ),
          ],
          const SizedBox(height: 12),
          _XboxCard(me: widget.me!, onRefresh: widget.onRefresh),
          const SizedBox(height: 12),
          _JavaCard(me: widget.me!, onRefresh: widget.onRefresh),
          const SizedBox(height: 12),
          _SettingsCard(
            appearOffline: _effectiveAppearOffline,
            onToggleAppearOffline: _toggleAppearOffline,
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: widget.onSignOut,
            icon: const Icon(Icons.logout_rounded, size: 16),
            label: const Text('Sign out'),
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
            label: const Text('Delete account'),
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
                  const Text(
                    'Appear offline',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    appearOffline
                        ? 'Friends see you as offline'
                        : 'Friends can see when you\'re online',
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

class _XboxCard extends StatefulWidget {
  final UserModel me;
  final Future<void> Function() onRefresh;
  const _XboxCard({required this.me, required this.onRefresh});

  @override
  State<_XboxCard> createState() => _XboxCardState();
}

class _XboxCardState extends State<_XboxCard> {
  final Set<String> _unlinking = {};

  static const _xboxGreen = Color(0xFF107C10);

  Future<void> _openLinkScreen() async {
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

  Future<void> _unlink(BedrockAccount account) async {
    final label = account.xboxGamertag ?? account.xboxXuid;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surfaceRaised,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppTheme.borderGray),
        ),
        title: const Text('Unlink Xbox account'),
        content: Text(
          'Remove $label from your linked accounts?',
          style: const TextStyle(color: AppTheme.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.error),
            child: const Text('Unlink'),
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

  @override
  Widget build(BuildContext context) {
    final accounts = widget.me.bedrockAccounts;
    final hasAccounts = accounts.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: hasAccounts
              ? _xboxGreen.withOpacity(0.35)
              : AppTheme.borderGray,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: _xboxGreen.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.sports_esports_rounded,
                  color: _xboxGreen,
                  size: 17,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Xbox Accounts',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              if (hasAccounts)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: _xboxGreen.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${accounts.length}',
                    style: const TextStyle(
                      color: _xboxGreen,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          if (!hasAccounts) ...[
            const Text(
              'Link your Xbox account to show your gamertag on your profile.',
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 12,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
          ],
          if (hasAccounts) ...[
            ...accounts.map(
              (account) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _AccountTile(
                  primaryText: account.xboxGamertag ?? account.xboxXuid,
                  secondaryText: account.xboxXuid,
                  unlinking: _unlinking.contains(account.xboxXuid),
                  onUnlink: () => _unlink(account),
                  accentColor: _xboxGreen,
                ),
              ),
            ),
            const SizedBox(height: 4),
          ],
          ElevatedButton.icon(
            onPressed: _openLinkScreen,
            icon: const Icon(Icons.link_rounded, size: 16),
            label: Text(
              hasAccounts ? 'Link Another Xbox Account' : 'Link Xbox Account',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: _xboxGreen,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class _JavaCard extends StatefulWidget {
  final UserModel me;
  final Future<void> Function() onRefresh;
  const _JavaCard({required this.me, required this.onRefresh});

  @override
  State<_JavaCard> createState() => _JavaCardState();
}

class _JavaCardState extends State<_JavaCard> {
  final Set<String> _unlinking = {};
  static const _javaBlue = Color(0xFF1565C0);

  Future<void> _openLinkScreen() async {
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

  Future<void> _unlink(JavaAccount account) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surfaceRaised,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppTheme.borderGray),
        ),
        title: const Text('Unlink Java Edition'),
        content: Text(
          'Remove ${account.javaUsername} from your linked accounts?',
          style: const TextStyle(color: AppTheme.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.error),
            child: const Text('Unlink'),
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
    final accounts = widget.me.javaAccounts;
    final hasAccounts = accounts.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: hasAccounts
              ? _javaBlue.withOpacity(0.35)
              : AppTheme.borderGray,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: _javaBlue.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.videogame_asset_rounded,
                  color: _javaBlue,
                  size: 17,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Java Edition Accounts',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              if (hasAccounts)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: _javaBlue.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${accounts.length}',
                    style: const TextStyle(
                      color: _javaBlue,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          if (!hasAccounts) ...[
            const Text(
              'Link your Minecraft Java Edition account to show your username on your profile.',
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 12,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
          ],
          if (hasAccounts) ...[
            ...accounts.map(
              (account) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _AccountTile(
                  primaryText: account.javaUsername,
                  secondaryText: account.javaUuid,
                  unlinking: _unlinking.contains(account.javaUuid),
                  onUnlink: () => _unlink(account),
                  accentColor: _javaBlue,
                ),
              ),
            ),
            const SizedBox(height: 4),
          ],
          ElevatedButton.icon(
            onPressed: _openLinkScreen,
            icon: const Icon(Icons.link_rounded, size: 16),
            label: Text(
              hasAccounts ? 'Link Another Java Account' : 'Link Java Edition',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: _javaBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountTile extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final bool unlinking;
  final VoidCallback onUnlink;
  final Color accentColor;

  const _AccountTile({
    required this.primaryText,
    required this.secondaryText,
    required this.unlinking,
    required this.onUnlink,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: accentColor.withOpacity(0.18)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  primaryText,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  secondaryText,
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                  : const Text(
                      'Unlink',
                      style: TextStyle(
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
          message: 'Profile updated',
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
              const Text(
                'Profile',
                style: TextStyle(
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
                  label: const Text('Edit'),
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
            _FieldLabel('Display name'),
            const SizedBox(height: 6),
            TextField(
              controller: _displayNameCtrl,
              style: const TextStyle(color: AppTheme.textPrimary),
              decoration: const InputDecoration(hintText: 'Your name'),
            ),
            const SizedBox(height: 14),
            _FieldLabel('Bio'),
            const SizedBox(height: 6),
            TextField(
              controller: _bioCtrl,
              style: const TextStyle(color: AppTheme.textPrimary),
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Tell something about yourself',
              ),
            ),
            const SizedBox(height: 14),
            _FieldLabel('Avatar'),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Avatar(
                  initials: widget.me.initials,
                  size: 58,
                  avatarUrl: _avatarUrlCtrl.text.trim().isNotEmpty
                      ? _avatarUrlCtrl.text.trim()
                      : null,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (widget.me.javaAccounts.isNotEmpty ||
                          widget.me.bedrockAccounts.isNotEmpty) ...[
                        const Text(
                          'MINECRAFT SKIN',
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: [
                            for (final acc in widget.me.javaAccounts)
                              GestureDetector(
                                onTap: () => setState(() {
                                  _avatarUrlCtrl.text =
                                      'https://crafatar.com/avatars/${acc.javaUuid}?size=128&overlay=true';
                                }),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFF1565C0,
                                    ).withOpacity(0.10),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: const Color(
                                        0xFF1565C0,
                                      ).withOpacity(0.30),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.videogame_asset_rounded,
                                        size: 13,
                                        color: Color(0xFF1565C0),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        acc.javaUsername,
                                        style: const TextStyle(
                                          color: Color(0xFF1565C0),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            for (final acc in widget.me.bedrockAccounts)
                              GestureDetector(
                                onTap: () => setState(() {
                                  _avatarUrlCtrl.text =
                                      'https://api.geysermc.org/v2/skin/${acc.xboxXuid}/face';
                                }),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFF107C10,
                                    ).withOpacity(0.10),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: const Color(
                                        0xFF107C10,
                                      ).withOpacity(0.30),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.sports_esports_rounded,
                                        size: 13,
                                        color: Color(0xFF107C10),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        acc.xboxGamertag ?? acc.xboxXuid,
                                        style: const TextStyle(
                                          color: Color(0xFF107C10),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'OR CUSTOM URL',
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                      TextField(
                        controller: _avatarUrlCtrl,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 13,
                        ),
                        keyboardType: TextInputType.url,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: 'https://example.com/avatar.png',
                          prefixIcon: const Icon(
                            Icons.image_rounded,
                            size: 18,
                            color: AppTheme.textMuted,
                          ),
                          suffixIcon: _avatarUrlCtrl.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.clear_rounded,
                                    size: 16,
                                    color: AppTheme.textMuted,
                                  ),
                                  onPressed: () =>
                                      setState(() => _avatarUrlCtrl.clear()),
                                )
                              : null,
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _saving
                        ? null
                        : () => setState(() => _editing = false),
                    child: const Text('Cancel'),
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
                        : const Text('Save'),
                  ),
                ),
              ],
            ),
          ] else ...[
            _ProfileRow(
              label: 'Display name',
              value: widget.me.displayName?.isNotEmpty == true
                  ? widget.me.displayName!
                  : '—',
            ),
            const SizedBox(height: 8),
            _ProfileRow(label: 'Username', value: '@${widget.me.username}'),
            if (widget.me.avatarUrl?.isNotEmpty == true) ...[
              const SizedBox(height: 8),
              _ProfileRow(label: 'Avatar URL', value: widget.me.avatarUrl!),
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
      return const _EmptyBody(
        icon: Icons.people_outline_rounded,
        message: 'No friends yet',
        sub: 'Add someone using the button in the top right.',
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
            _SectionLabel('ONLINE — ${online.length}'),
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
            _SectionLabel('OFFLINE — ${offline.length}'),
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
                _Avatar(initials: friend.initials, size: 42, avatarUrl: friend.avatarUrl),
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
      return const _EmptyBody(
        icon: Icons.mark_email_read_rounded,
        message: 'No pending requests',
        sub: 'Friend requests will appear here.',
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
          _Avatar(initials: request.initials, size: 42, avatarUrl: request.requesterAvatarUrl),
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
  Widget build(BuildContext context) => const Center(
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
