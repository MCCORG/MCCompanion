import 'package:flutter/material.dart';

import '../design/design.dart';
import '../l10n/app_localizations.dart';
import '../widgets/console/console_widget.dart';

class DesktopStatusPanel extends StatelessWidget {
  final bool broadcasting;
  final String? serverName;
  final String? serverAddress;
  final String modeLabel;
  final String relayLabel;
  final ValueNotifier<List<String>> logsNotifier;
  final ScrollController logsScrollController;
  final ValueNotifier<bool> debugEnabledNotifier;
  final VoidCallback onToggleDebug;
  final VoidCallback onClearLogs;
  final VoidCallback onCopyLogs;

  const DesktopStatusPanel({
    super.key,
    required this.broadcasting,
    required this.serverName,
    required this.serverAddress,
    required this.modeLabel,
    required this.relayLabel,
    required this.logsNotifier,
    required this.logsScrollController,
    required this.debugEnabledNotifier,
    required this.onToggleDebug,
    required this.onClearLogs,
    required this.onCopyLogs,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Container(
      width: 340,
      decoration: BoxDecoration(
        color: DsColor.surfaceQuiet,
        border: Border(left: BorderSide(color: DsColor.line)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              DsSpace.lg,
              DsSpace.lg,
              DsSpace.lg,
              DsSpace.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(l.statusLabel, style: DsType.heading)),
                    DsBadge(
                      label: broadcasting ? l.statusOnline : l.rpDisabled,
                      color: broadcasting ? DsColor.success : DsColor.textFaint,
                      dot: true,
                    ),
                  ],
                ),
                const SizedBox(height: DsSpace.md),
                _row(l.serversSection, serverName ?? '—'),
                if (serverAddress != null) ...[
                  const SizedBox(height: DsSpace.sm - 2),
                  _row('', serverAddress!),
                ],
                const SizedBox(height: DsSpace.sm - 2),
                _row(l.modeLabel, modeLabel),
                const SizedBox(height: DsSpace.sm - 2),
                _row(l.relay, relayLabel),
              ],
            ),
          ),
          Container(height: 1, color: DsColor.line),
          Expanded(
            child: ValueListenableBuilder<bool>(
              valueListenable: debugEnabledNotifier,
              builder: (_, debugEnabled, _) => ConsoleWidget(
                logsNotifier: logsNotifier,
                scrollController: logsScrollController,
                debugEnabled: debugEnabled,
                onToggleDebug: onToggleDebug,
                onClearLogs: onClearLogs,
                onCopyLogs: onCopyLogs,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 78, child: Text(label, style: DsType.caption)),
        Expanded(
          child: Text(value, style: DsType.label.copyWith(color: DsColor.text)),
        ),
      ],
    );
  }
}
