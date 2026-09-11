import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../design/design.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../util/howto_prefs.dart';
import '../widgets/components/swipe_back.dart';
import '../widgets/dialogs/howto_dialogs.dart';

enum HowToKind { xbox, nintendo, friends }

class HowToScreen extends StatelessWidget {
  final HowToKind kind;
  final VoidCallback onBack;
  final String? relayName;
  final String? relayIp;
  final String? userRegion;

  const HowToScreen({
    super.key,
    required this.kind,
    required this.onBack,
    this.relayName,
    this.relayIp,
    this.userRegion,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final color = switch (kind) {
      HowToKind.xbox => AppTheme.modeXbox,
      HowToKind.nintendo => AppTheme.modeNintendo,
      HowToKind.friends => AppTheme.modeFriends,
    };

    final icon = switch (kind) {
      HowToKind.xbox => FontAwesomeIcons.xbox,
      HowToKind.nintendo => FontAwesomeIcons.gamepad,
      HowToKind.friends => FontAwesomeIcons.userGroup,
    };

    final title = switch (kind) {
      HowToKind.xbox => loc.labelXbox,
      HowToKind.nintendo => loc.labelNintendo,
      HowToKind.friends => loc.labelFriends,
    };

    final subtitle = switch (kind) {
      HowToKind.xbox => loc.howToXboxSubtitle,
      HowToKind.nintendo => loc.howToNintendoSubtitle,
      HowToKind.friends => loc.howToFriendsSubtitle,
    };

    final body = switch (kind) {
      HowToKind.xbox => loc.howToXboxBody,
      HowToKind.nintendo => loc.playInstructionsSwitch(
        relayName ?? '-',
        relayIp ?? '-',
      ),
      HowToKind.friends => null,
    };

    final topic = switch (kind) {
      HowToKind.xbox => HowToTopic.xbox,
      HowToKind.nintendo => HowToTopic.nintendo,
      HowToKind.friends => HowToTopic.friends,
    };

    return SwipeBack(
      onBack: onBack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DsHeader(
            title: title,
            subtitle: subtitle,
            leading: DsIconButton(
              icon: Icons.arrow_back_rounded,
              size: 36,
              onPressed: onBack,
            ),
            actions: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.14),
                  borderRadius: DsRadius.controlR,
                ),
                child: FaIcon(icon, size: 15, color: color),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(
                DsSpace.gutter,
                0,
                DsSpace.gutter,
                DsSpace.xxxl,
              ),
              children: [
                if (body != null)
                  StepContent(body: body, color: color)
                else
                  FriendsHowToBody(color: color, userRegion: userRegion),
                const SizedBox(height: DsSpace.xl),
                AutoShowToggle(topic: topic, color: color),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
