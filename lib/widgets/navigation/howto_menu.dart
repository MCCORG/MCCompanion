import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';

class HowToSheetContent extends StatelessWidget {
  final AppLocalizations loc;
  final VoidCallback onClose;
  final VoidCallback? onXbox;
  final VoidCallback? onNintendo;
  final VoidCallback? onFriends;
  final VoidCallback? onJava;

  const HowToSheetContent({
    super.key,
    required this.loc,
    required this.onClose,
    this.onXbox,
    this.onNintendo,
    this.onFriends,
    this.onJava,
  });

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.80;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0E1117),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          border: Border(top: BorderSide(color: AppTheme.borderGray)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onClose,
              behavior: HitTestBehavior.opaque,
              child: Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: AppTheme.borderLight,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: AppTheme.accent.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                          color: AppTheme.accent.withOpacity(0.25)),
                    ),
                    child: Center(
                      child: FaIcon(FontAwesomeIcons.circleQuestion,
                          color: AppTheme.accent, size: 15),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    loc.howToUseMenu,
                    style: const TextStyle(
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
                      icon: FontAwesomeIcons.xbox,
                      color: AppTheme.modeXbox,
                      title: loc.howToXboxTitle,
                      subtitle: loc.howToXboxSubtitle,
                      onTap: onXbox ?? () {},
                    ),
                    const SizedBox(height: 8),
                    _tile(
                      icon: FontAwesomeIcons.gamepad,
                      color: AppTheme.modeNintendo,
                      title: loc.howToNintendoTitle,
                      subtitle: loc.howToNintendoSubtitle,
                      onTap: onNintendo ?? () {},
                    ),
                    const SizedBox(height: 8),
                    _tile(
                      icon: FontAwesomeIcons.userGroup,
                      color: AppTheme.modeFriends,
                      title: loc.howToFriendsTitle,
                      subtitle: loc.howToFriendsSubtitle,
                      onTap: onFriends ?? () {},
                    ),
                    const SizedBox(height: 8),
                    _tile(
                      icon: FontAwesomeIcons.java,
                      color: AppTheme.modeJava,
                      title: loc.javaInfoTitle,
                      subtitle: loc.howToJavaSubtitle,
                      onTap: onJava ?? () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
            color: color.withOpacity(0.05),
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: color.withOpacity(0.22)),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.14),
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
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded,
                  color: color.withOpacity(0.4), size: 13),
            ],
          ),
        ),
      ),
    );
  }
}