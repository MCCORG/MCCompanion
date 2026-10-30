import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../design/design.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../util/howto_prefs.dart';
import '../widgets/components/swipe_back.dart';
import '../widgets/dialogs/howto_dialogs.dart';
import '../layout/bar_inset.dart';

enum HowToKind { xbox, nintendo, friends }

extension HowToKindInfo on HowToKind {
  Color get color => switch (this) {
    HowToKind.xbox => AppTheme.modeXbox,
    HowToKind.nintendo => AppTheme.modeNintendo,
    HowToKind.friends => AppTheme.modeFriends,
  };

  IconData get rowIcon => switch (this) {
    HowToKind.xbox => Icons.sports_esports_rounded,
    HowToKind.nintendo => Icons.videogame_asset_rounded,
    HowToKind.friends => Icons.group_rounded,
  };

  FaIconData get icon => switch (this) {
    HowToKind.xbox => FontAwesomeIcons.xbox,
    HowToKind.nintendo => FontAwesomeIcons.gamepad,
    HowToKind.friends => FontAwesomeIcons.userGroup,
  };

  String title(AppLocalizations l) => switch (this) {
    HowToKind.xbox => l.labelXbox,
    HowToKind.nintendo => l.labelNintendo,
    HowToKind.friends => l.labelFriends,
  };

  String subtitle(AppLocalizations l) => switch (this) {
    HowToKind.xbox => l.howToXboxSubtitle,
    HowToKind.nintendo => l.howToNintendoSubtitle,
    HowToKind.friends => l.howToFriendsSubtitle,
  };

  HowToTopic get topic => switch (this) {
    HowToKind.xbox => HowToTopic.xbox,
    HowToKind.nintendo => HowToTopic.nintendo,
    HowToKind.friends => HowToTopic.friends,
  };

  String? body(AppLocalizations l, {String? relayName, String? relayIp}) =>
      switch (this) {
        HowToKind.xbox => l.howToXboxBody,
        HowToKind.nintendo => l.playInstructionsSwitch(
          relayName ?? '-',
          relayIp ?? '-',
        ),
        HowToKind.friends => null,
      };
}

class HowToScreen extends StatefulWidget {
  final HowToKind? kind;
  final VoidCallback onBack;
  final String? relayName;
  final String? relayIp;
  final String? userRegion;

  const HowToScreen({
    super.key,
    this.kind,
    required this.onBack,
    this.relayName,
    this.relayIp,
    this.userRegion,
  });

  @override
  State<HowToScreen> createState() => _HowToScreenState();
}

class _HowToScreenState extends State<HowToScreen> {
  HowToKind? _open;

  @override
  void initState() {
    super.initState();
    _open = widget.kind;
  }

  @override
  void didUpdateWidget(covariant HowToScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.kind != oldWidget.kind) _open = widget.kind;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final open = _open;

    return SwipeBack(
      onBack: open == null ? widget.onBack : () => setState(() => _open = null),
      child: open == null ? _list(l) : _article(l, open),
    );
  }

  Widget _list(AppLocalizations l) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DsHeader(
          title: l.howToUseMenu,
          leading: DsIconButton(
            icon: Icons.arrow_back_rounded,
            size: 36,
            onPressed: widget.onBack,
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.fromLTRB(
              DsSpace.gutter,
              0,
              DsSpace.gutter,
              DsSpace.xxxl + BarInset.of(context),
            ),
            children: [
              DsGroup(
                label: l.modeLabel,
                children: [
                  for (final kind in HowToKind.values)
                    DsRow(
                      title: kind.title(l),
                      subtitle: kind.subtitle(l),
                      icon: kind.rowIcon,
                      iconColor: kind.color,
                      onTap: () => setState(() => _open = kind),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _article(AppLocalizations l, HowToKind kind) {
    final color = kind.color;
    final body = kind.body(
      l,
      relayName: widget.relayName,
      relayIp: widget.relayIp,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DsHeader(
          title: kind.title(l),
          subtitle: kind.subtitle(l),
          leading: DsIconButton(
            icon: Icons.arrow_back_rounded,
            size: 36,
            onPressed: () => setState(() => _open = null),
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
              child: FaIcon(kind.icon, size: 15, color: color),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.fromLTRB(
              DsSpace.gutter,
              0,
              DsSpace.gutter,
              DsSpace.xxxl + BarInset.of(context),
            ),
            children: [
              if (body != null)
                StepContent(body: body, color: color)
              else
                FriendsHowToBody(color: color, userRegion: widget.userRegion),
              const SizedBox(height: DsSpace.lg),
              AutoShowToggle(topic: kind.topic, color: color),
            ],
          ),
        ),
      ],
    );
  }
}
