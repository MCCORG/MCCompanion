import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../design/design.dart';
import '../../l10n/app_localizations.dart';

class ClientStatusBar extends StatelessWidget {
  static const double height = 48;

  final ValueListenable<bool> broadcasting;
  final ValueListenable<bool> consoleOpen;
  final String? serverName;
  final VoidCallback onToggleConsole;
  final VoidCallback onStop;

  const ClientStatusBar({
    super.key,
    required this.broadcasting,
    required this.consoleOpen,
    required this.serverName,
    required this.onToggleConsole,
    required this.onStop,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: DsSpace.lg),
      decoration: BoxDecoration(
        color: DsColor.surfaceQuiet,
        border: Border(top: BorderSide(color: DsColor.line)),
      ),
      child: ValueListenableBuilder<bool>(
        valueListenable: broadcasting,
        builder: (_, live, _) => Row(
          children: [
            DsBadge(
              label: live ? l.statusOnline : l.rpDisabled,
              color: live ? DsColor.success : DsColor.textFaint,
              dot: true,
            ),
            if (live && serverName != null && serverName!.isNotEmpty) ...[
              const SizedBox(width: DsSpace.md),
              Expanded(
                child: Text(
                  serverName!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: DsType.label.copyWith(color: DsColor.textSoft),
                ),
              ),
            ] else
              const Spacer(),
            ValueListenableBuilder<bool>(
              valueListenable: consoleOpen,
              builder: (_, open, _) => DsButton(
                label: l.console,
                icon: Icons.terminal_rounded,
                tone: open ? DsButtonTone.accent : DsButtonTone.quiet,
                size: DsButtonSize.small,
                onPressed: onToggleConsole,
              ),
            ),
            if (live) ...[
              const SizedBox(width: DsSpace.sm),
              DsButton(
                label: l.stopBroadcasting,
                icon: Icons.stop_rounded,
                tone: DsButtonTone.danger,
                size: DsButtonSize.small,
                onPressed: onStop,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
