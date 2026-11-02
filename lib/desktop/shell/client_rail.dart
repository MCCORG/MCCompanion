import 'package:flutter/material.dart';

import '../../design/design.dart';
import 'client_models.dart';
import 'client_shortcuts.dart';

class ClientRail extends StatelessWidget {
  static const double width = 64;

  final List<ClientSection> sections;
  final List<ClientSection> footer;
  final String? activeSectionId;

  const ClientRail({
    super.key,
    required this.sections,
    required this.footer,
    required this.activeSectionId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: DsColor.surfaceQuiet,
        border: Border(right: BorderSide(color: DsColor.line)),
      ),
      padding: const EdgeInsets.symmetric(vertical: DsSpace.md),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var i = 0; i < sections.length; i++)
                    _RailButton(
                      section: sections[i],
                      active: sections[i].id == activeSectionId,
                      hint: ClientShortcuts.sectionHint(i),
                    ),
                ],
              ),
            ),
          ),
          for (final section in footer)
            _RailButton(
              section: section,
              active: section.id == activeSectionId,
              hint: section.id == 'customize'
                  ? ClientShortcuts.settingsHint
                  : null,
            ),
        ],
      ),
    );
  }
}

class _RailButton extends StatelessWidget {
  final ClientSection section;
  final bool active;
  final String? hint;

  const _RailButton({required this.section, required this.active, this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DsSpace.xs),
      child: Tooltip(
        message: hint == null ? section.label : '${section.label}  ($hint)',
        waitDuration: const Duration(milliseconds: 400),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            AnimatedContainer(
              duration: DsDuration.fast,
              width: 3,
              height: active ? 22 : 0,
              decoration: BoxDecoration(
                color: DsColor.accent,
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(3),
                ),
              ),
            ),
            Center(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: section.onTap,
                  borderRadius: DsRadius.controlR,
                  child: AnimatedContainer(
                    duration: DsDuration.fast,
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: active
                          ? DsColor.accent.withValues(alpha: 0.14)
                          : Colors.transparent,
                      borderRadius: DsRadius.controlR,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          section.icon,
                          size: 22,
                          color: active ? DsColor.accent : DsColor.textFaint,
                        ),
                        if (section.badge > 0)
                          Positioned(
                            top: 6,
                            right: 6,
                            child: Container(
                              width: 9,
                              height: 9,
                              decoration: BoxDecoration(
                                color: DsColor.danger,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: DsColor.surfaceQuiet,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
