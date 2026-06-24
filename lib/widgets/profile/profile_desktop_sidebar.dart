import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../models/user_model.dart';
import '../../screens/public_profile_screen.dart';
import 'profile_common.dart';

class ProfileDesktopSidebar extends StatelessWidget {
  final UserModel? me;
  final VoidCallback onAddFriend;
  final VoidCallback? onGoToHome;
  final VoidCallback? onGoToConnector;
  final VoidCallback? onGoToSkins;
  final VoidCallback? onGoToWiki;

  const ProfileDesktopSidebar({
    super.key,
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
    final l = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 2, color: AppTheme.accent.withValues(alpha: 0.60)),
          const SizedBox(height: 24),
          ProfileAvatar(
            initials: me?.initials ?? '?',
            size: 90,
            avatarUrl: me?.avatarUrl,
          ),
          const SizedBox(height: 16),
          Text(
            me?.displayLabel ?? '—',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (me?.username != null) ...[
            const SizedBox(height: 4),
            Text(
              '@${me!.username}',
              style: TextStyle(color: AppTheme.textMuted, fontSize: 13),
            ),
          ],
          if (me?.bio?.isNotEmpty == true) ...[
            const SizedBox(height: 10),
            Text(
              me!.bio!,
              textAlign: TextAlign.center,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 12,
                height: 1.5,
              ),
            ),
          ],
          const SizedBox(height: 20),
          Divider(color: AppTheme.borderGray),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _openSearch(context),
              icon: const Icon(Icons.search_rounded, size: 16),
              label: Text(l.findUser),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.textSecondary,
                side: BorderSide(color: AppTheme.borderGray),
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: onAddFriend,
              icon: const Icon(Icons.person_add_rounded, size: 16),
              label: Text(l.addFriend),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.accent,
                side: BorderSide(color: AppTheme.accent.withValues(alpha: 0.5)),
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
