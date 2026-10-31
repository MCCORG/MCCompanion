import 'package:flutter/material.dart';

import '../design/design.dart';
import '../l10n/app_localizations.dart';
import '../screens/support_screen.dart';
import '../widgets/dialogs/howto_dialogs.dart';
import 'desktop_guide.dart';

class DesktopSupportScreen extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback? onFeedback;

  const DesktopSupportScreen({
    super.key,
    required this.onBack,
    this.onFeedback,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final topics = supportTopics(l);
    return DesktopGuideScreen(
      title: l.support,
      narrow: (_) => SupportScreen(onBack: onBack, onFeedback: onFeedback),
      listFooter: onFeedback == null
          ? null
          : DsButton(
              label: l.feedbackTileTitle,
              icon: Icons.chat_bubble_outline_rounded,
              tone: DsButtonTone.neutral,
              expand: true,
              onPressed: onFeedback,
            ),
      topics: [
        for (final topic in topics)
          DesktopGuideTopic(
            id: topic.title,
            title: topic.title,
            subtitle: topic.subtitle,
            icon: topic.icon,
            rowIcon: topic.rowIcon,
            color: topic.color,
            content: (_) => StepContent(body: topic.body, color: topic.color),
          ),
      ],
    );
  }
}
