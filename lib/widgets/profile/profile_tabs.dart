import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../models/user_model.dart';
import '../../services/user_service.dart';
import '../../widgets/components/app_toast.dart';
import 'profile_common.dart';
import 'profile_header.dart';
import 'profile_cards.dart';
import 'profile_friend_tiles.dart';

class ProfileTab extends StatefulWidget {
  final UserModel? me;
  final Future<void> Function() onRefresh;
  final Future<void> Function() onSignOut;
  final Future<void> Function() onDeleteAccount;
  const ProfileTab({
    super.key,
    required this.me,
    required this.onRefresh,
    required this.onSignOut,
    required this.onDeleteAccount,
  });

  @override
  State<ProfileTab> createState() => ProfileTabState();
}

class ProfileTabState extends State<ProfileTab> {
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
    if (widget.me == null) return const ProfileLoadingBody();
    return RefreshIndicator(
      color: AppTheme.accent,
      backgroundColor: AppTheme.surfaceRaised,
      onRefresh: widget.onRefresh,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
        children: [
          ProfileHero(me: widget.me!, onUpdated: widget.onRefresh),
          const SizedBox(height: 20),
          ProfileSectionHeader(AppLocalizations.of(context)!.sectionMinecraftAccounts),
          const SizedBox(height: 8),
          ProfileLinkedAccountsCard(me: widget.me!, onRefresh: widget.onRefresh),
          const SizedBox(height: 20),
          ProfileSectionHeader(AppLocalizations.of(context)!.sectionSettings),
          const SizedBox(height: 8),
          ProfileSettingsCard(
            appearOffline: _effectiveAppearOffline,
            onToggleAppearOffline: _toggleAppearOffline,
          ),
          const SizedBox(height: 32),
          ProfileDangerZoneCard(
            onSignOut: widget.onSignOut,
            onDeleteAccount: widget.onDeleteAccount,
          ),
        ],
      ),
    );
  }
}

class ProfileFriendsTab extends StatelessWidget {
  final List<FriendModel> friends;
  final bool loading;
  final Future<void> Function() onRefresh;
  final Future<void> Function(FriendModel) onRemove;
  final void Function(FriendModel) onChat;
  final VoidCallback? onGoToHome;
  final VoidCallback? onGoToConnector;
  final VoidCallback? onGoToSkins;
  final VoidCallback? onGoToWiki;
  const ProfileFriendsTab({
    super.key,
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
    if (loading) return const ProfileLoadingBody();
    if (friends.isEmpty) {
      return ProfileEmptyBody(
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
            ProfileSectionLabel(
              AppLocalizations.of(context)!.onlineFriendsLabel(online.length),
            ),
            const SizedBox(height: 8),
            ...online.map(
              (f) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ProfileFriendTile(
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
            ProfileSectionLabel(
              AppLocalizations.of(context)!.offlineFriendsLabel(offline.length),
            ),
            const SizedBox(height: 8),
            ...offline.map(
              (f) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ProfileFriendTile(
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

class ProfileRequestsTab extends StatelessWidget {
  final List<FriendRequest> requests;
  final bool loading;
  final Future<void> Function() onRefresh;
  final Future<void> Function(FriendRequest) onAccept;
  final Future<void> Function(FriendRequest) onDecline;
  const ProfileRequestsTab({
    super.key,
    required this.requests,
    required this.loading,
    required this.onRefresh,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    if (loading) return const ProfileLoadingBody();
    if (requests.isEmpty) {
      return ProfileEmptyBody(
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
        separatorBuilder: (ctx, i) => const SizedBox(height: 8),
        itemBuilder: (_, i) => ProfileRequestTile(
          request: requests[i],
          onAccept: () => onAccept(requests[i]),
          onDecline: () => onDecline(requests[i]),
        ),
      ),
    );
  }
}
