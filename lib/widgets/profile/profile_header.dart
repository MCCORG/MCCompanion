import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../design/design.dart';
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
    final loc = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        DsSpace.gutter,
        DsSpace.sm,
        DsSpace.gutter,
        DsSpace.sm,
      ),
      child: Row(
        children: [
          Expanded(child: Text(loc.navProfile, style: DsType.title)),
          DsIconButton(
            icon: Icons.search_rounded,
            size: 36,
            tooltip: loc.findUser,
            onPressed: () => _openSearch(context),
          ),
          const SizedBox(width: DsSpace.sm - 2),
          DsIconButton(
            icon: Icons.person_add_rounded,
            size: 36,
            tooltip: loc.addFriend,
            onPressed: onAddFriend,
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
    final isDesktop =
        Platform.isMacOS || Platform.isWindows || Platform.isLinux;
    if (isDesktop) {
      Clipboard.setData(ClipboardData(text: url));
      AppToast.show(
        context,
        message: AppLocalizations.of(context)!.profileLinkCopied,
        icon: Icons.link_rounded,
        color: AppTheme.success,
      );
    } else {
      Share.share(url);
    }
  }

  Future<void> _pickAndUploadAvatar() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result == null || result.files.single.path == null) return;
    final file = File(result.files.single.path!);
    setState(() => _uploadingAvatar = true);
    try {
      final (:user, :error) = await UserService.uploadAvatar(file);
      if (!mounted) return;
      if (user != null) {
        await widget.onUpdated();
        if (mounted) {
          AppToast.show(
            context,
            message: AppLocalizations.of(context)!.avatarUpdated,
            icon: Icons.check_circle_rounded,
            color: AppTheme.success,
          );
        }
      } else {
        AppToast.show(
          context,
          message: AppLocalizations.of(context)!.uploadFailed,
          icon: Icons.error_rounded,
          color: AppTheme.error,
        );
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
    final me = widget.me;
    final displayName = me.displayName?.isNotEmpty == true
        ? me.displayName!
        : me.username;
    return Container(
      decoration: BoxDecoration(
        color: DsColor.surface,
        borderRadius: DsRadius.cardR,
        border: Border.all(color: DsColor.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(DsSpace.lg),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _uploadingAvatar ? null : _pickAndUploadAvatar,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ProfileAvatar(
                        initials: me.initials,
                        size: 56,
                        avatarUrl: me.avatarUrl,
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: DsColor.surface,
                          shape: BoxShape.circle,
                          border: Border.all(color: DsColor.line),
                        ),
                        child: _uploadingAvatar
                            ? const Padding(
                                padding: EdgeInsets.all(4),
                                child: CircularProgressIndicator(
                                  strokeWidth: 1.6,
                                ),
                              )
                            : Icon(
                                Icons.camera_alt_rounded,
                                size: 11,
                                color: DsColor.textSoft,
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: DsSpace.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        displayName,
                        style: DsType.title.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: DsSpace.xxs),
                      Text('@${me.username}', style: DsType.caption),
                      if (me.bio?.isNotEmpty == true) ...[
                        const SizedBox(height: DsSpace.sm - 2),
                        Text(me.bio!, style: DsType.label),
                      ],
                      const SizedBox(height: DsSpace.md),
                      Row(
                        children: [
                          ProfileHeroActionBtn(
                            icon: Icons.edit_rounded,
                            label: AppLocalizations.of(context)!.edit,
                            onTap: _editing
                                ? null
                                : () => setState(() {
                                    _displayNameCtrl.text =
                                        me.displayName ?? '';
                                    _bioCtrl.text = me.bio ?? '';
                                    _editing = true;
                                  }),
                          ),
                          const SizedBox(width: DsSpace.sm),
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
                            ProfileFieldLabel(
                              AppLocalizations.of(context)!.displayNameLabel,
                            ),
                            const SizedBox(height: 6),
                            TextField(
                              controller: _displayNameCtrl,
                              style: TextStyle(color: AppTheme.textPrimary),
                              decoration: InputDecoration(
                                hintText: AppLocalizations.of(
                                  context,
                                )!.yourNameHint,
                              ),
                            ),
                            const SizedBox(height: 14),
                            ProfileFieldLabel(
                              AppLocalizations.of(context)!.bioLabel,
                            ),
                            const SizedBox(height: 6),
                            TextField(
                              controller: _bioCtrl,
                              maxLines: 3,
                              style: TextStyle(color: AppTheme.textPrimary),
                              decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)!.bioHint,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: _saving
                                        ? null
                                        : () =>
                                              setState(() => _editing = false),
                                    child: Text(
                                      AppLocalizations.of(context)!.cancel,
                                    ),
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
                                        : Text(
                                            AppLocalizations.of(context)!.save,
                                          ),
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
  const ProfileHeroActionBtn({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DsButton(
      label: label,
      icon: icon,
      tone: DsButtonTone.neutral,
      size: DsButtonSize.small,
      onPressed: onTap,
    );
  }
}
