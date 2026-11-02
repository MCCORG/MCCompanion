import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../screens/how_to_screen.dart';
import '../widgets/dialogs/howto_dialogs.dart';
import 'desktop_guide.dart';

class DesktopHowToScreen extends StatelessWidget {
  final HowToKind? kind;
  final VoidCallback onBack;
  final String? relayName;
  final String? relayIp;
  final String? userRegion;

  const DesktopHowToScreen({
    super.key,
    this.kind,
    required this.onBack,
    this.relayName,
    this.relayIp,
    this.userRegion,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return DesktopGuideScreen(
      title: l.howToUseMenu,
      selectedId: kind?.name,
      narrow: (_) => HowToScreen(
        kind: kind,
        onBack: onBack,
        relayName: relayName,
        relayIp: relayIp,
        userRegion: userRegion,
      ),
      topics: [
        for (final item in HowToKind.values)
          DesktopGuideTopic(
            id: item.name,
            title: item.title(l),
            subtitle: item.subtitle(l),
            icon: item.icon,
            rowIcon: item.rowIcon,
            color: item.color,
            content: (_) {
              final body = item.body(l, relayName: relayName, relayIp: relayIp);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (body != null)
                    StepContent(body: body, color: item.color)
                  else
                    FriendsHowToBody(color: item.color, userRegion: userRegion),
                  const SizedBox(height: 16),
                  AutoShowToggle(topic: item.topic, color: item.color),
                ],
              );
            },
          ),
      ],
    );
  }
}
