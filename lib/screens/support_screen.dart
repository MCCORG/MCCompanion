import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../design/design.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../widgets/components/swipe_back.dart';
import '../widgets/dialogs/howto_dialogs.dart';

class _SupportTopic {
  final FaIconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String body;

  const _SupportTopic({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.body,
  });
}

class SupportScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback? onFeedback;

  const SupportScreen({super.key, required this.onBack, this.onFeedback});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  _SupportTopic? _open;

  List<_SupportTopic> _topics(AppLocalizations l) => [
    _SupportTopic(
      icon: FontAwesomeIcons.wifi,
      color: AppTheme.info,
      title: l.helpMCCompanionTitle,
      subtitle: l.helpMCCompanionSubtitle,
      body: l.helpMCCompanionBody,
    ),
    _SupportTopic(
      icon: FontAwesomeIcons.triangleExclamation,
      color: AppTheme.warning,
      title: l.helpMultiplayerFailedTitle,
      subtitle: l.helpMultiplayerFailedSubtitle,
      body: l.helpMultiplayerFailedBody,
    ),
    _SupportTopic(
      icon: FontAwesomeIcons.gamepad,
      color: AppTheme.modeNintendo,
      title: l.helpNintendoDnsTitle,
      subtitle: l.helpNintendoDnsSubtitle,
      body: l.helpNintendoDnsBody,
    ),
    _SupportTopic(
      icon: FontAwesomeIcons.userGroup,
      color: AppTheme.modeFriends,
      title: l.helpFriendsModeTitle,
      subtitle: l.helpFriendsModeSubtitle,
      body: l.helpFriendsModeBody,
    ),
  ];

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
          title: l.support,
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
              for (final topic in _topics(l)) ...[
                DsTile(
                  title: topic.title,
                  subtitle: topic.subtitle,
                  icon: Icons.help_outline_rounded,
                  iconColor: topic.color,
                  onTap: () => setState(() => _open = topic),
                ),
                const SizedBox(height: DsSpace.sm),
              ],
              const SizedBox(height: DsSpace.lg),
              if (widget.onFeedback != null)
                DsButton(
                  label: l.feedbackTileTitle,
                  icon: Icons.chat_bubble_outline_rounded,
                  tone: DsButtonTone.neutral,
                  expand: true,
                  onPressed: widget.onFeedback,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _article(AppLocalizations l, _SupportTopic topic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DsHeader(
          title: topic.title,
          subtitle: topic.subtitle,
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
                color: topic.color.withValues(alpha: 0.14),
                borderRadius: DsRadius.controlR,
              ),
              child: FaIcon(topic.icon, size: 15, color: topic.color),
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
            children: [StepContent(body: topic.body, color: topic.color)],
          ),
        ),
      ],
    );
  }
}
