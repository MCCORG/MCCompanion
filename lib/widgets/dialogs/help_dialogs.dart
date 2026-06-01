import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import 'howto_dialogs.dart';

class HelpDialogs {
  static Future<void> showMCCompanionNotAppearing(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return _push(
      context,
      icon: FontAwesomeIcons.wifi,
      color: AppTheme.info,
      title: loc.helpMCCompanionTitle,
      subtitle: loc.helpMCCompanionSubtitle,
      body: loc.helpMCCompanionBody,
    );
  }

  static Future<void> showMultiplayerConnectionFailed(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return _push(
      context,
      icon: FontAwesomeIcons.triangleExclamation,
      color: AppTheme.warning,
      title: loc.helpMultiplayerFailedTitle,
      subtitle: loc.helpMultiplayerFailedSubtitle,
      body: loc.helpMultiplayerFailedBody,
    );
  }

  static Future<void> showNintendoDns(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return _push(
      context,
      icon: FontAwesomeIcons.gamepad,
      color: AppTheme.modeNintendo,
      title: loc.helpNintendoDnsTitle,
      subtitle: loc.helpNintendoDnsSubtitle,
      body: loc.helpNintendoDnsBody,
    );
  }

  static Future<void> showFriendsMode(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return _push(
      context,
      icon: FontAwesomeIcons.userGroup,
      color: AppTheme.modeFriends,
      title: loc.helpFriendsModeTitle,
      subtitle: loc.helpFriendsModeSubtitle,
      body: loc.helpFriendsModeBody,
    );
  }

  static Future<void> _push(
    BuildContext context, {
    required FaIconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required String body,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => InstructionPage(
          icon: icon,
          color: color,
          title: title,
          subtitle: subtitle,
          body: body,
        ),
      ),
    );
  }
}
