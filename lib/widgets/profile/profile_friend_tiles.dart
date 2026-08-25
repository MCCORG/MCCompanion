import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/user_model.dart';
import '../../screens/public_profile_screen.dart';
import 'profile_common.dart';

class ProfileFriendTile extends StatelessWidget {
  final FriendModel friend;
  final VoidCallback onRemove;
  final VoidCallback? onGoToHome;
  final VoidCallback? onGoToConnector;
  final VoidCallback? onGoToSkins;
  final VoidCallback? onGoToWiki;
  const ProfileFriendTile({
    super.key,
    required this.friend,
    required this.onRemove,
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
                ? AppTheme.success.withValues(alpha: 0.25)
                : AppTheme.borderGray,
          ),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                ProfileAvatar(
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
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    '@${friend.username}',
                    style: TextStyle(
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
              onTap: onRemove,
              child: Padding(
                padding: const EdgeInsets.all(8),
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

class ProfileRequestTile extends StatelessWidget {
  final FriendRequest request;
  final VoidCallback onAccept;
  final VoidCallback onDecline;
  const ProfileRequestTile({
    super.key,
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
        border: Border.all(color: AppTheme.accent.withValues(alpha: 0.20)),
      ),
      child: Row(
        children: [
          ProfileAvatar(
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
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                Text(
                  '@${request.requesterUsername}',
                  style: TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              ProfileSmallBtn(
                icon: Icons.close_rounded,
                color: AppTheme.error,
                onTap: onDecline,
              ),
              const SizedBox(width: 8),
              ProfileSmallBtn(
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
