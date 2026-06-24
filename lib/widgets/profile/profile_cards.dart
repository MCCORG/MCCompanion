import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../models/user_model.dart';
import '../../services/user_service.dart';
import '../../screens/xbox_link_screen.dart';
import '../../screens/java_link_screen.dart';

class ProfileSettingsCard extends StatelessWidget {
  final bool appearOffline;
  final Future<void> Function(bool) onToggleAppearOffline;

  const ProfileSettingsCard({
    super.key,
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
                    ? AppTheme.textMuted.withValues(alpha: 0.15)
                    : AppTheme.success.withValues(alpha: 0.12),
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
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    appearOffline
                        ? AppLocalizations.of(context)!.appearOfflineOn
                        : AppLocalizations.of(context)!.appearOfflineOff,
                    style: TextStyle(
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
              activeThumbColor: AppTheme.accent,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileLinkedAccountsCard extends StatefulWidget {
  final UserModel me;
  final Future<void> Function() onRefresh;
  const ProfileLinkedAccountsCard({super.key, required this.me, required this.onRefresh});

  @override
  State<ProfileLinkedAccountsCard> createState() => ProfileLinkedAccountsCardState();
}

class ProfileLinkedAccountsCardState extends State<ProfileLinkedAccountsCard> {
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
              (acc) => ProfileAccountRow(
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
              (acc) => ProfileAccountRow(
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
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
            child: Row(
              children: [
                Expanded(
                  child: ProfileLinkAccountBtn(
                    icon: Icons.sports_esports_rounded,
                    label: AppLocalizations.of(context)!.linkXbox,
                    color: _xboxGreen,
                    onTap: _openXboxLink,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ProfileLinkAccountBtn(
                    icon: Icons.videogame_asset_rounded,
                    label: AppLocalizations.of(context)!.linkJava,
                    color: _javaBlue,
                    onTap: _openJavaLink,
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

class ProfileAccountRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String name;
  final String subtitle;
  final bool unlinking;
  final VoidCallback onUnlink;

  const ProfileAccountRow({
    super.key,
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
              color: color.withValues(alpha: 0.12),
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
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
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
                color: AppTheme.error.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: AppTheme.error.withValues(alpha: 0.25)),
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

class ProfileDangerZoneCard extends StatelessWidget {
  final Future<void> Function() onSignOut;
  final Future<void> Function() onDeleteAccount;

  const ProfileDangerZoneCard({
    super.key,
    required this.onSignOut,
    required this.onDeleteAccount,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.error.withValues(alpha: 0.20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
            child: Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  size: 14,
                  color: AppTheme.error.withValues(alpha: 0.60),
                ),
                const SizedBox(width: 6),
                Text(
                  l.accountActions,
                  style: TextStyle(
                    color: AppTheme.error.withValues(alpha: 0.70),
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppTheme.borderDim),
          ProfileDangerRow(
            icon: Icons.logout_rounded,
            label: l.signOut,
            onTap: onSignOut,
            strong: false,
          ),
          const Divider(height: 1, color: AppTheme.borderDim),
          ProfileDangerRow(
            icon: Icons.delete_forever_rounded,
            label: l.deleteAccountTitle,
            onTap: onDeleteAccount,
            strong: true,
          ),
        ],
      ),
    );
  }
}

class ProfileDangerRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Future<void> Function() onTap;
  final bool strong;

  const ProfileDangerRow({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.strong,
  });

  @override
  Widget build(BuildContext context) {
    final color = strong
        ? AppTheme.error
        : AppTheme.error.withValues(alpha: 0.70);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 17, color: color),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: strong ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              size: 18,
              color: color.withValues(alpha: 0.50),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileLinkAccountBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const ProfileLinkAccountBtn({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.28)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 15, color: color),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
