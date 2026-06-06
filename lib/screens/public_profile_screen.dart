import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';
import '../widgets/skin_3d_viewer.dart';
import '../widgets/navigation/bottom_nav_bar.dart';
import '../widgets/components/app_toast.dart';

class PublicProfileScreen extends StatefulWidget {
  final String username;
  final VoidCallback? onGoToHome;
  final VoidCallback? onGoToConnector;
  final VoidCallback? onGoToSkins;
  final VoidCallback? onGoToWiki;

  const PublicProfileScreen({
    super.key,
    required this.username,
    this.onGoToHome,
    this.onGoToConnector,
    this.onGoToSkins,
    this.onGoToWiki,
  });

  @override
  State<PublicProfileScreen> createState() => _PublicProfileScreenState();
}

class _PublicProfileScreenState extends State<PublicProfileScreen> {
  UserModel? _user;
  bool _loading = true;
  String? _friendStatus;
  bool _actionLoading = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final results = await Future.wait([
      UserService.getProfile(widget.username),
      UserService.getFriendshipStatus(widget.username),
    ]);
    if (!mounted) return;
    setState(() {
      _user = results[0] as UserModel?;
      _friendStatus = results[1] as String;
      _loading = false;
    });
  }

  Future<void> _sendRequest() async {
    setState(() => _actionLoading = true);
    final error = await UserService.sendFriendRequest(widget.username);
    if (!mounted) return;
    setState(() => _actionLoading = false);
    final l = AppLocalizations.of(context)!;
    if (error == null) {
      setState(() => _friendStatus = 'pending_sent');
      _showToast(
        l.friendRequestSent,
        AppTheme.success,
        Icons.check_circle_rounded,
      );
    } else {
      final msg = switch (error) {
        'already_friends' => l.alreadyFriendsMsg,
        'request_pending' => l.requestAlreadyPendingMsg,
        'not_found' => l.userNotFoundMsg2,
        'blocked' => l.cannotSendRequestMsg,
        _ => l.somethingWentWrong,
      };
      _showToast(msg, AppTheme.error, Icons.error_outline_rounded);
    }
  }

  Future<void> _acceptRequest() async {
    setState(() => _actionLoading = true);
    final ok = await UserService.acceptFriendRequest(widget.username);
    if (!mounted) return;
    setState(() {
      _actionLoading = false;
      if (ok) _friendStatus = 'friends';
    });
    if (ok)
      _showToast(
        AppLocalizations.of(context)!.nowFriendsWith(widget.username),
        AppTheme.success,
        Icons.check_circle_rounded,
      );
  }

  Future<void> _removeFriend() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        final l = AppLocalizations.of(ctx)!;
        return AlertDialog(
          backgroundColor: AppTheme.surfaceRaised,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppTheme.borderGray),
          ),
          title: Text(l.removeFriendDialogTitle),
          content: Text(
            l.removeFriendDialogBody(widget.username),
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
        );
      },
    );
    if (confirmed != true || !mounted) return;
    setState(() => _actionLoading = true);
    final ok = await UserService.removeFriend(widget.username);
    if (!mounted) return;
    setState(() {
      _actionLoading = false;
      if (ok) _friendStatus = 'none';
    });
  }

  void _showToast(String msg, Color color, IconData icon) {
    AppToast.show(context, message: msg, icon: icon, color: color);
  }

  void _navTo(VoidCallback? callback) {
    Navigator.of(context).popUntil((r) => r.isFirst);
    callback?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.surface,
        title: Text(
          _user != null ? '@${_user!.username}' : 'Profile',
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: const IconThemeData(color: AppTheme.textPrimary),
        elevation: 0,
      ),
      bottomNavigationBar: BottomGlassSimpleNavBar(
        navigationController: null,
        activeItem: 'profile',
        onHomeTap: () => _navTo(widget.onGoToHome),
        onConnectorTap: () => _navTo(widget.onGoToConnector),
        onProfileTap: () => Navigator.of(context).popUntil((r) => r.isFirst),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                color: AppTheme.accent,
                strokeWidth: 2,
              ),
            )
          : _user == null
          ? _buildNotFound()
          : _buildProfile(),
    );
  }

  Widget _buildNotFound() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.person_off_rounded,
            color: AppTheme.textDisabled,
            size: 48,
          ),
          const SizedBox(height: 12),
          Text(
            AppLocalizations.of(context)!.userNotFound,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    final u = _user!;
    final xboxGreen = AppTheme.xboxGreen;

    return RefreshIndicator(
      color: AppTheme.accent,
      backgroundColor: AppTheme.surfaceRaised,
      onRefresh: _load,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                _Avatar(initials: u.initials, size: 72, avatarUrl: u.avatarUrl),
                const SizedBox(height: 14),
                Text(
                  u.displayLabel,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '@${u.username}',
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          _buildFriendButton(),
          const SizedBox(height: 16),

          Builder(builder: (ctx) {
            final l = AppLocalizations.of(ctx)!;
            return _InfoCard(
              icon: Icons.person_rounded,
              label: l.profileSectionLabel,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ProfileRow(
                    label: l.displayNameRowLabel,
                    value: u.displayName?.isNotEmpty == true
                        ? u.displayName!
                        : '—',
                  ),
                  const SizedBox(height: 8),
                  _ProfileRow(label: l.usernameRowLabel, value: '@${u.username}'),
                  if (u.lastSeenAt != null && !u.appearOffline) ...[
                    const SizedBox(height: 8),
                    _ProfileRow(
                      label: l.lastSeenLabel,
                      value: _formatDate(u.lastSeenAt!),
                    ),
                  ],
                ],
              ),
            );
          }),

          if (u.bio?.isNotEmpty == true) ...[
            const SizedBox(height: 12),
            Builder(builder: (ctx) => _InfoCard(
              icon: Icons.info_outline_rounded,
              label: AppLocalizations.of(ctx)!.aboutSectionLabel,
              child: Text(
                u.bio!,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            )),
          ],

          if (u.xboxGamertag != null) ...[
            const SizedBox(height: 12),
            Builder(builder: (ctx) => _InfoCard(
              icon: Icons.sports_esports_rounded,
              iconColor: xboxGreen,
              label: AppLocalizations.of(ctx)!.xboxBedrockLabel,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    u.xboxGamertag!,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (u.xboxXuid != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      u.xboxXuid!,
                      style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ],
              ),
            )),
          ],

          if (u.javaUsername != null) ...[
            const SizedBox(height: 12),
            Builder(builder: (ctx) => _InfoCard(
              icon: Icons.videogame_asset_rounded,
              iconColor: AppTheme.javaBlue,
              label: AppLocalizations.of(ctx)!.playerLookupJavaEdition,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    u.javaUsername!,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (u.javaUuid != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      u.javaUuid!,
                      style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ],
              ),
            )),
          ],

          if (u.javaAccounts.isNotEmpty || u.bedrockAccounts.isNotEmpty) ...[
            const SizedBox(height: 12),
            _PublicSkinsSection(user: u),
          ],
        ],
      ),
    );
  }

  Widget _buildFriendButton() {
    if (_actionLoading) {
      return Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: AppTheme.accent,
            strokeWidth: 2,
          ),
        ),
      );
    }

    final l = AppLocalizations.of(context)!;
    return switch (_friendStatus) {
      'friends' => OutlinedButton.icon(
        onPressed: _removeFriend,
        icon: const Icon(Icons.person_remove_rounded, size: 16),
        label: Text(l.removeFriendButton),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppTheme.error,
          side: BorderSide(color: AppTheme.error.withValues(alpha: 0.40)),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
      'pending_sent' => OutlinedButton.icon(
        onPressed: null,
        icon: const Icon(Icons.hourglass_top_rounded, size: 16),
        label: Text(l.requestSentButton),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppTheme.textMuted,
          side: const BorderSide(color: AppTheme.borderGray),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
      'pending_received' => ElevatedButton.icon(
        onPressed: _acceptRequest,
        icon: const Icon(Icons.check_rounded, size: 16),
        label: Text(
          l.acceptRequestButton,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.success,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
      _ => ElevatedButton.icon(
        onPressed: _sendRequest,
        icon: const Icon(Icons.person_add_rounded, size: 16),
        label: Text(
          l.addFriendButton,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    };
  }
}

class UserSearchScreen extends StatefulWidget {
  final VoidCallback? onGoToHome;
  final VoidCallback? onGoToConnector;
  final VoidCallback? onGoToSkins;
  final VoidCallback? onGoToWiki;

  const UserSearchScreen({
    super.key,
    this.onGoToHome,
    this.onGoToConnector,
    this.onGoToSkins,
    this.onGoToWiki,
  });

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  final _ctrl = TextEditingController();
  List<UserModel> _results = [];
  bool _loading = false;
  bool _searched = false;
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _ctrl.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    final q = value.trim();
    if (q.isEmpty) {
      setState(() {
        _results = [];
        _searched = false;
        _loading = false;
      });
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 400), () => _search(q));
  }

  Future<void> _search([String? query]) async {
    final q = query ?? _ctrl.text.trim();
    if (q.isEmpty) return;
    if (!mounted) return;
    setState(() {
      _loading = true;
      _searched = true;
    });
    final results = await UserService.searchUsers(q);
    if (!mounted) return;
    setState(() {
      _results = results;
      _loading = false;
    });
  }

  void _openProfile(String username) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PublicProfileScreen(
          username: username,
          onGoToHome: widget.onGoToHome,
          onGoToConnector: widget.onGoToConnector,
          onGoToSkins: widget.onGoToSkins,
          onGoToWiki: widget.onGoToWiki,
        ),
      ),
    );
  }

  void _navTo(VoidCallback? callback) {
    Navigator.of(context).pop();
    callback?.call();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.surface,
        title: Text(
          l.findUser,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: const IconThemeData(color: AppTheme.textPrimary),
        elevation: 0,
      ),
      bottomNavigationBar: BottomGlassSimpleNavBar(
        navigationController: null,
        activeItem: 'profile',
        onHomeTap: () => _navTo(widget.onGoToHome),
        onConnectorTap: () => _navTo(widget.onGoToConnector),
        onProfileTap: () => Navigator.of(context).pop(),
      ),
      body: Column(
        children: [
          Container(
            color: AppTheme.surface,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: TextField(
              controller: _ctrl,
              autofocus: true,
              autocorrect: false,
              style: const TextStyle(color: AppTheme.textPrimary),
              decoration: InputDecoration(
                hintText: l.userSearchHint,
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  size: 18,
                  color: AppTheme.textMuted,
                ),
                suffixIcon: _loading
                    ? Padding(
                        padding: EdgeInsets.all(12),
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: AppTheme.accent,
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : null,
              ),
              onChanged: _onChanged,
              onSubmitted: (_) => _search(),
            ),
          ),
          Expanded(child: _buildResults(l)),
        ],
      ),
    );
  }

  Widget _buildResults(AppLocalizations l) {
    if (_loading) {
      return Center(
        child: CircularProgressIndicator(
          color: AppTheme.accent,
          strokeWidth: 2,
        ),
      );
    }
    if (!_searched) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.manage_search_rounded,
              color: AppTheme.textDisabled,
              size: 48,
            ),
            const SizedBox(height: 12),
            Text(
              l.userSearchSub,
              style: const TextStyle(color: AppTheme.textMuted, fontSize: 13),
            ),
          ],
        ),
      );
    }
    if (_results.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.person_off_rounded,
              color: AppTheme.textDisabled,
              size: 48,
            ),
            SizedBox(height: 12),
            Text(
              'No users found',
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _results.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        final u = _results[i];
        return GestureDetector(
          onTap: () => _openProfile(u.username),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: AppTheme.surfaceRaised,
              borderRadius: BorderRadius.circular(12),
              border: const Border.fromBorderSide(
                BorderSide(color: AppTheme.borderGray),
              ),
            ),
            child: Row(
              children: [
                _Avatar(initials: u.initials, size: 42, avatarUrl: u.avatarUrl),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        u.displayLabel,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        '@${u.username}',
                        style: const TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 11,
                        ),
                      ),
                      if (u.xboxGamertag != null) ...[
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(
                              Icons.sports_esports_rounded,
                              size: 11,
                              color: AppTheme.xboxGreen,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              u.xboxGamertag!,
                              style: const TextStyle(
                                color: AppTheme.xboxGreen,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (u.javaUsername != null) ...[
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(
                              Icons.videogame_asset_rounded,
                              size: 11,
                              color: AppTheme.javaBlue,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              u.javaUsername!,
                              style: const TextStyle(
                                color: AppTheme.javaBlue,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppTheme.textMuted,
                  size: 18,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _PublicSkinsSection extends StatelessWidget {
  final UserModel user;
  const _PublicSkinsSection({required this.user});

  @override
  Widget build(BuildContext context) {
    final javaCards = user.javaAccounts
        .map(
          (a) =>
              _JavaPublicSkin(username: a.javaUsername, javaUuid: a.javaUuid),
        )
        .toList();
    final bedrockCards = user.bedrockAccounts
        .map(
          (a) => _BedrockPublicSkin(
            gamertag: a.xboxGamertag ?? a.xboxXuid,
            xuid: a.xboxXuid,
          ),
        )
        .toList();
    final all = [...javaCards, ...bedrockCards];
    if (all.isEmpty) return const SizedBox.shrink();

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
              const Icon(
                Icons.checkroom_rounded,
                size: 14,
                color: AppTheme.textMuted,
              ),
              const SizedBox(width: 6),
              Text(
                all.length == 1 ? 'SKIN' : 'SKINS',
                style: const TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (all.length == 1)
            Center(child: SizedBox(width: 160, child: all[0]))
          else
            LayoutBuilder(
              builder: (_, constraints) {
                final w = (constraints.maxWidth - 12) / 2;
                return Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: all
                      .map((c) => SizedBox(width: w, child: c))
                      .toList(),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _JavaPublicSkin extends StatefulWidget {
  final String username;
  final String javaUuid;
  const _JavaPublicSkin({required this.username, required this.javaUuid});

  @override
  State<_JavaPublicSkin> createState() => _JavaPublicSkinState();
}

class _JavaPublicSkinState extends State<_JavaPublicSkin> {
  String? _textureUrl;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    try {
      final resp = await http
          .get(
            Uri.parse(
              'https://sessionserver.mojang.com/session/minecraft/profile/${widget.javaUuid}',
            ),
            headers: {'User-Agent': 'MCCompanionApp/1.0'},
          )
          .timeout(const Duration(seconds: 8));
      if (!mounted || resp.statusCode != 200) {
        if (mounted) setState(() => _loading = false);
        return;
      }
      final url = _extractTextureUrl(resp.body);
      if (mounted)
        setState(() {
          _textureUrl = url;
          _loading = false;
        });
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  String? _extractTextureUrl(String body) {
    try {
      final props = (jsonDecode(body)['properties'] as List?) ?? [];
      for (final p in props) {
        if (p['name'] == 'textures') {
          final decoded = jsonDecode(
            utf8.decode(base64.decode(p['value'] as String)),
          );
          return decoded['textures']?['SKIN']?['url'] as String?;
        }
      }
    } catch (_) {}
    return null;
  }

  Future<void> _download() async {
    final url =
        _textureUrl ?? 'https://visage.surgeplay.com/skin/${widget.javaUuid}';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: AppTheme.javaBlue.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'Java',
              style: TextStyle(
                color: AppTheme.javaBlue,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 140,
          child: Center(
            child: _loading
                ? CircularProgressIndicator(
                    color: AppTheme.accent,
                    strokeWidth: 2,
                  )
                : _textureUrl != null
                ? SkinBodyFromUrl(textureUrl: _textureUrl!, height: 136)
                : const Icon(
                    Icons.person_rounded,
                    color: AppTheme.textMuted,
                    size: 36,
                  ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.username,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: _download,
            icon: const Icon(Icons.download_rounded, size: 13),
            label: const Text('Download'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.javaBlue,
              side: const BorderSide(color: AppTheme.javaBlue, width: 0.8),
              padding: const EdgeInsets.symmetric(vertical: 8),
              textStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BedrockPublicSkin extends StatefulWidget {
  final String gamertag;
  final String xuid;
  const _BedrockPublicSkin({required this.gamertag, required this.xuid});

  @override
  State<_BedrockPublicSkin> createState() => _BedrockPublicSkinState();
}

class _BedrockPublicSkinState extends State<_BedrockPublicSkin> {
  String? _textureUrl;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    try {
      final resp = await http
          .get(
            Uri.parse('https://api.geysermc.org/v2/skin/${widget.xuid}'),
            headers: {'User-Agent': 'MCCompanionApp/1.0'},
          )
          .timeout(const Duration(seconds: 8));
      if (!mounted) return;
      if (resp.statusCode == 200) {
        final id = jsonDecode(resp.body)['texture_id'] as String?;
        if (id != null && mounted) {
          setState(() {
            _textureUrl = 'https://textures.minecraft.net/texture/$id';
            _loading = false;
          });
          return;
        }
      }
    } catch (_) {}
    if (mounted) setState(() => _loading = false);
  }

  Future<void> _download() async {
    if (_textureUrl == null) return;
    final uri = Uri.parse(_textureUrl!);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'Bedrock',
              style: TextStyle(
                color: Color(0xFF4CAF50),
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 140,
          child: Center(
            child: _loading
                ? CircularProgressIndicator(
                    color: AppTheme.accent,
                    strokeWidth: 2,
                  )
                : _textureUrl != null
                ? SkinBodyFromUrl(textureUrl: _textureUrl!, height: 136)
                : const Icon(
                    Icons.person_rounded,
                    color: AppTheme.textMuted,
                    size: 36,
                  ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.gamertag,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: _textureUrl != null ? _download : null,
            icon: const Icon(Icons.download_rounded, size: 13),
            label: const Text('Download'),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF4CAF50),
              side: const BorderSide(color: Color(0xFF4CAF50), width: 0.8),
              padding: const EdgeInsets.symmetric(vertical: 8),
              textStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String _formatDate(String iso) {
  try {
    final dt = DateTime.parse(iso).toLocal();
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inMinutes < 2) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${dt.day}/${dt.month}/${dt.year}';
  } catch (_) {
    return '—';
  }
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
          width: 110,
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
        color: AppTheme.accent.withValues(alpha: 0.15),
        shape: BoxShape.circle,
        border: Border.all(color: AppTheme.accent.withValues(alpha: 0.30)),
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

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String label;
  final Widget child;
  const _InfoCard({
    required this.icon,
    this.iconColor,
    required this.label,
    required this.child,
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
              Icon(icon, size: 14, color: iconColor ?? AppTheme.textMuted),
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
          child,
        ],
      ),
    );
  }
}
