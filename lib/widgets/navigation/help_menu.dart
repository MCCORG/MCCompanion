import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../components/app_sheet.dart';

class HelpSheetContent extends StatelessWidget {
  final AppLocalizations loc;
  final VoidCallback onClose;
  final VoidCallback? onMCCompanion;
  final VoidCallback? onMultiplayerFailed;
  final VoidCallback? onNintendoDns;
  final VoidCallback? onFriendsMode;

  const HelpSheetContent({
    super.key,
    required this.loc,
    required this.onClose,
    this.onMCCompanion,
    this.onMultiplayerFailed,
    this.onNintendoDns,
    this.onFriendsMode,
  });

  @override
  Widget build(BuildContext context) {
    return AppSheet(
      onClose: onClose,
      maxHeightFactor: 0.80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: AppTheme.error.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(11),
                      border:
                          Border.all(color: AppTheme.error.withValues(alpha: 0.25)),
                    ),
                    child: const Center(
                      child: FaIcon(FontAwesomeIcons.lifeRing,
                          color: AppTheme.error, size: 15),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    loc.support,
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: Column(
                  children: [
                    _tile(
                      icon: FontAwesomeIcons.wifi,
                      color: AppTheme.info,
                      title: loc.helpMCCompanionTitle,
                      subtitle: loc.helpMCCompanionSubtitle,
                      onTap: onMCCompanion ?? () {},
                    ),
                    const SizedBox(height: 8),
                    _tile(
                      icon: FontAwesomeIcons.triangleExclamation,
                      color: AppTheme.warning,
                      title: loc.helpMultiplayerFailedTitle,
                      subtitle: loc.helpMultiplayerFailedSubtitle,
                      onTap: onMultiplayerFailed ?? () {},
                    ),
                    const SizedBox(height: 8),
                    _tile(
                      icon: FontAwesomeIcons.gamepad,
                      color: AppTheme.modeNintendo,
                      title: loc.helpNintendoDnsTitle,
                      subtitle: loc.helpNintendoDnsSubtitle,
                      onTap: onNintendoDns ?? () {},
                    ),
                    const SizedBox(height: 8),
                    _tile(
                      icon: FontAwesomeIcons.userGroup,
                      color: AppTheme.modeFriends,
                      title: loc.helpFriendsModeTitle,
                      subtitle: loc.helpFriendsModeSubtitle,
                      onTap: onFriendsMode ?? () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }

  Widget _tile({
    required FaIconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(13),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: color.withValues(alpha: 0.22)),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Center(child: FaIcon(icon, color: color, size: 19)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        )),
                    const SizedBox(height: 3),
                    Text(subtitle,
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded,
                  color: color.withValues(alpha: 0.4), size: 13),
            ],
          ),
        ),
      ),
    );
  }
}