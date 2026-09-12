import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../design/design.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../util/howto_prefs.dart';
import '../widgets/components/swipe_back.dart';
import '../widgets/dialogs/howto_dialogs.dart';

enum HowToKind { xbox, nintendo, friends }

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

  Color _color(HowToKind kind) => switch (kind) {
    HowToKind.xbox => AppTheme.modeXbox,
    HowToKind.nintendo => AppTheme.modeNintendo,
    HowToKind.friends => AppTheme.modeFriends,
  };

  IconData _rowIcon(HowToKind kind) => switch (kind) {
    HowToKind.xbox => Icons.sports_esports_rounded,
    HowToKind.nintendo => Icons.videogame_asset_rounded,
    HowToKind.friends => Icons.group_rounded,
  };

  FaIconData _icon(HowToKind kind) => switch (kind) {
    HowToKind.xbox => FontAwesomeIcons.xbox,
    HowToKind.nintendo => FontAwesomeIcons.gamepad,
    HowToKind.friends => FontAwesomeIcons.userGroup,
  };

  String _title(HowToKind kind, AppLocalizations l) => switch (kind) {
    HowToKind.xbox => l.labelXbox,
    HowToKind.nintendo => l.labelNintendo,
    HowToKind.friends => l.labelFriends,
  };

  String _subtitle(HowToKind kind, AppLocalizations l) => switch (kind) {
    HowToKind.xbox => l.howToXboxSubtitle,
    HowToKind.nintendo => l.howToNintendoSubtitle,
    HowToKind.friends => l.howToFriendsSubtitle,
  };

  HowToTopic _topic(HowToKind kind) => switch (kind) {
    HowToKind.xbox => HowToTopic.xbox,
    HowToKind.nintendo => HowToTopic.nintendo,
    HowToKind.friends => HowToTopic.friends,
  };

  String? _body(HowToKind kind, AppLocalizations l) => switch (kind) {
    HowToKind.xbox => l.howToXboxBody,
    HowToKind.nintendo => l.playInstructionsSwitch(
      widget.relayName ?? '-',
      widget.relayIp ?? '-',
    ),
    HowToKind.friends => null,
  };

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
            padding: const EdgeInsets.fromLTRB(
              DsSpace.gutter,
              0,
              DsSpace.gutter,
              DsSpace.xxxl,
            ),
            children: [
              DsGroup(
                label: l.modeLabel,
                children: [
                  for (final kind in HowToKind.values)
                    DsRow(
                      title: _title(kind, l),
                      subtitle: _subtitle(kind, l),
                      icon: _rowIcon(kind),
                      iconColor: _color(kind),
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
    final color = _color(kind);
    final body = _body(kind, l);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DsHeader(
          title: _title(kind, l),
          subtitle: _subtitle(kind, l),
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
              child: FaIcon(_icon(kind), size: 15, color: color),
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
                FriendsHowToBody(color: color, userRegion: widget.userRegion),
              const SizedBox(height: DsSpace.lg),
              AutoShowToggle(topic: _topic(kind), color: color),
            ],
          ),
        ),
      ],
    );
  }
}
