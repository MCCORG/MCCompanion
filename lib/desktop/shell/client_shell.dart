import 'package:flutter/material.dart';

import '../../design/design.dart';
import 'client_context_panel.dart';
import 'client_models.dart';
import 'client_rail.dart';

class ClientShell extends StatelessWidget {
  static const double narrowWidth = 900;

  final List<ClientSection> sections;
  final List<ClientSection> footer;
  final String? activeSectionId;
  final String? activeItemId;
  final Widget content;
  final Widget rightDock;
  final Widget statusBar;

  const ClientShell({
    super.key,
    required this.sections,
    required this.footer,
    required this.activeSectionId,
    required this.activeItemId,
    required this.content,
    required this.rightDock,
    required this.statusBar,
  });

  ClientSection? get _active {
    for (final section in [...sections, ...footer]) {
      if (section.id == activeSectionId) return section;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final active = _active;
    return ColoredBox(
      color: DsColor.bg,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final hasItems = active != null && active.items.isNotEmpty;
                  final narrow = constraints.maxWidth < narrowWidth;
                  return Row(
                    children: [
                      ClientRail(
                        sections: sections,
                        footer: footer,
                        activeSectionId: activeSectionId,
                      ),
                      if (hasItems && !narrow)
                        ClientContextPanel(
                          section: active,
                          activeItemId: activeItemId,
                        ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (hasItems && narrow)
                              ClientItemStrip(
                                section: active,
                                activeItemId: activeItemId,
                              ),
                            Expanded(child: content),
                          ],
                        ),
                      ),
                      rightDock,
                    ],
                  );
                },
              ),
            ),
            statusBar,
          ],
        ),
      ),
    );
  }
}
