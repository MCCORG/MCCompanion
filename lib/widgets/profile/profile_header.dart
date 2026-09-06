import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../models/user_model.dart';
import '../../services/user_service.dart';
import '../../screens/public_profile_screen.dart';
import '../../widgets/components/app_toast.dart';
import 'profile_common.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel? me;
  final VoidCallback onAddFriend;
  final VoidCallback? onGoToHome;
  final VoidCallback? onGoToConnector;
  final VoidCallback? onGoToSkins;

  const ProfileHeader({
    super.key,
    required this.me,
    required this.onAddFriend,
    this.onGoToHome,
    this.onGoToConnector,
    this.onGoToSkins,
  });

  void _openSearch(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => UserSearchScreen(
          onGoToHome: onGoToHome,
          onGoToConnector: onGoToConnector,
          onGoToSkins: onGoToSkins,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasBio = me?.bio?.isNotEmpty == true;
    return Container(
      color: AppTheme.surfaceRaised,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 2, color: AppTheme.accent.withValues(alpha: 0.60)),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileAvatar(
                  initials: me?.initials ?? '?',
                  size: 60,
                  avatarUrl: me?.avatarUrl,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        me?.displayLabel ?? '—',
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (me?.username != null) ...[
                        const SizedBox(height: 1),
                        Text(
                          '@${me!.username}',
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                      if (UserService.isAdmin) ...[
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppTheme.accent.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: AppTheme.accent.withValues(alpha: 0.35)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.shield_rounded, size: 11, color: AppTheme.accent),
                              const SizedBox(width: 4),
                              Text('MCCompanion Admin', style: TextStyle(color: AppTheme.accent, fontSize: 11, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ],
                      if (hasBio) ...[
                        const SizedBox(height: 5),
                        Text(
                          me!.bio!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 12,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    ProfileIconBtn(
                      icon: Icons.search_rounded,
                      tooltip: AppLocalizations.of(context)!.findUser,
                      onTap: () => _openSearch(context),
                    ),
                    const SizedBox(height: 8),
                    ProfileIconBtn(
                      icon: Icons.person_add_rounded,
                      tooltip: AppLocalizations.of(context)!.addFriend,
                      onTap: onAddFriend,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileHero extends StatefulWidget {
  final UserModel me;
  final Future<void> Function() onUpdated;
  const ProfileHero({super.key, required this.me, required this.onUpdated});

  @override
  State<ProfileHero> createState() => ProfileHeroState();
}

class ProfileHeroState extends State<ProfileHero> {
  bool _editing = false;
  bool _saving = false;
  bool _uploadingAvatar = false;
  late final TextEditingController _displayNameCtrl;
  late final TextEditingController _bioCtrl;

  @override
  void initState() {
    super.initState();
    _displayNameCtrl = TextEditingController(text: widget.me.displayName ?? '');
    _bioCtrl = TextEditingController(text: widget.me.bio ?? '');
  }

  @override
  void dispose() {
    _displayNameCtrl.dispose();
    _bioCtrl.dispose();
    super.dispose();
  }

  void _shareProfile(BuildContext context, String username) {
    final url = 'https://mccompanion.net/u?name=$username';
    final isDesktop = Platform.isMacOS || Platform.isWindows || Platform.isLinux;
    if (isDesktop) {
      Clipboard.setData(ClipboardData(text: url));
      AppToast.show(context, message: AppLocalizations.of(context)!.profileLinkCopied, icon: Icons.link_rounded, color: AppTheme.success);
    } else {
      Share.share(url);
    }
  }

  Future<void> _pickAndUploadAvatar() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
    if (result == null || result.files.single.path == null) return;
    final file = File(result.files.single.path!);
    setState(() => _uploadingAvatar = true);
    try {
      final (:user, :error) = await UserService.uploadAvatar(file);
      if (!mounted) return;
      if (user != null) {
        await widget.onUpdated();
        if (mounted) AppToast.show(context, message: AppLocalizations.of(context)!.avatarUpdated, icon: Icons.check_circle_rounded, color: AppTheme.success);
      } else {
        AppToast.show(context, message: AppLocalizations.of(context)!.uploadFailed, icon: Icons.error_rounded, color: AppTheme.error);
      }
    } finally {
      if (mounted) setState(() => _uploadingAvatar = false);
    }
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    final updated = await UserService.updateMe(
      displayName: _displayNameCtrl.text.trim(),
      bio: _bioCtrl.text.trim(),
    );
    if (!mounted) return;
    setState(() { _saving = false; _editing = false; });
    if (updated != null) {
      await widget.onUpdated();
      if (mounted) AppToast.show(context, message: AppLocalizations.of(context)!.profileUpdated, icon: Icons.check_circle_rounded, color: AppTheme.success);
    }
  }

  @override
  Widget build(BuildContext context) {
    final me = widget.me;
    final displayName = me.displayName?.isNotEmpty == true ? me.displayName! : me.username;
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
            child: Column(
              children: [
                GestureDetector(
                  onTap: _uploadingAvatar ? null : _pickAndUploadAvatar,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ProfileAvatar(initials: me.initials, size: 84, avatarUrl: me.avatarUrl),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppTheme.accent,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppTheme.surfaceRaised, width: 2.5),
                        ),
                        child: _uploadingAvatar
                            ? const Padding(
                                padding: EdgeInsets.all(6),
                                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
                              )
                            : const Icon(Icons.camera_alt_rounded, size: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  displayName,
                  style: TextStyle(color: AppTheme.textPrimary, fontSize: 20, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 2),
                Text(
                  '@${me.username}',
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                if (me.bio?.isNotEmpty == true) ...[
                  const SizedBox(height: 8),
                  Text(
                    me.bio!,
                    style: TextStyle(color: AppTheme.textSecondary, fontSize: 13, height: 1.4),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileHeroActionBtn(
                      icon: Icons.edit_rounded,
                      label: AppLocalizations.of(context)!.edit,
                      onTap: _editing ? null : () => setState(() {
                        _displayNameCtrl.text = me.displayName ?? '';
                        _bioCtrl.text = me.bio ?? '';
                        _editing = true;
                      }),
                    ),
                    const SizedBox(width: 10),
                    ProfileHeroActionBtn(
                      icon: Icons.share_rounded,
                      label: AppLocalizations.of(context)!.shareLabel,
                      onTap: () => _shareProfile(context, me.username),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeInOut,
            child: _editing
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Divider(height: 1, color: AppTheme.borderGray),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ProfileFieldLabel(AppLocalizations.of(context)!.displayNameLabel),
                            const SizedBox(height: 6),
                            TextField(
                              controller: _displayNameCtrl,
                              style: TextStyle(color: AppTheme.textPrimary),
                              decoration: InputDecoration(hintText: AppLocalizations.of(context)!.yourNameHint),
                            ),
                            const SizedBox(height: 14),
                            ProfileFieldLabel(AppLocalizations.of(context)!.bioLabel),
                            const SizedBox(height: 6),
                            TextField(
                              controller: _bioCtrl,
                              style: TextStyle(color: AppTheme.textPrimary),
                              maxLines: 3,
                              decoration: InputDecoration(hintText: AppLocalizations.of(context)!.bioHint),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: _saving ? null : () => setState(() => _editing = false),
                                    child: Text(AppLocalizations.of(context)!.cancel),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: _saving ? null : _save,
                                    child: _saving
                                        ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                                        : Text(AppLocalizations.of(context)!.save),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class ProfileHeroActionBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  const ProfileHeroActionBtn({super.key, required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        decoration: BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 15, color: AppTheme.textSecondary),
            const SizedBox(width: 7),
            Text(label, style: TextStyle(color: AppTheme.textSecondary, fontSize: 13, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
