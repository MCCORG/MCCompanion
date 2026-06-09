import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../services/theme_service.dart';

enum _LogLevel { error, warn, info, debug, plain }

_LogLevel _levelOf(String log) {
  if (log.contains('[ERROR]')) return _LogLevel.error;
  if (log.contains('[WARN]'))  return _LogLevel.warn;
  if (log.contains('[INFO]'))  return _LogLevel.info;
  if (log.contains('[DEBUG]')) return _LogLevel.debug;
  return _LogLevel.plain;
}

Color _levelColor(_LogLevel level) => switch (level) {
  _LogLevel.error => AppTheme.error,
  _LogLevel.warn  => AppTheme.warning,
  _LogLevel.info  => AppTheme.info,
  _LogLevel.debug => AppTheme.success,
  _LogLevel.plain => const Color(0xFF8B9099),
};

String? _levelTag(_LogLevel level) => switch (level) {
  _LogLevel.error => 'ERR',
  _LogLevel.warn  => 'WRN',
  _LogLevel.info  => 'INF',
  _LogLevel.debug => 'DBG',
  _LogLevel.plain => null,
};

class _LogRow extends StatelessWidget {
  final String log;
  const _LogRow({required this.log});

  @override
  Widget build(BuildContext context) {
    final level = _levelOf(log);
    final color = _levelColor(level);
    final tag   = _levelTag(level);
    final text  = ThemeService.instance.textPrimary;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (tag != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: color.withValues(alpha: 0.25)),
              ),
              child: Text(
                tag,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  color: color,
                  letterSpacing: 0.5,
                  fontFamily: 'monospace',
                ),
              ),
            ),
            const SizedBox(width: 8),
          ] else ...[
            Padding(
              padding: const EdgeInsets.only(top: 7, right: 8),
              child: Container(
                width: 3,
                height: 3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withValues(alpha: 0.4),
                ),
              ),
            ),
          ],
          Expanded(
            child: Text(
              log,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 11.5,
                color: tag != null
                    ? text.withValues(alpha: 0.85)
                    : text.withValues(alpha: 0.45),
                height: 1.55,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyConsole extends StatelessWidget {
  final AppLocalizations loc;
  const _EmptyConsole({required this.loc});

  @override
  Widget build(BuildContext context) {
    final text = ThemeService.instance.textPrimary;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.terminal_rounded, size: 32,
              color: text.withValues(alpha: 0.08)),
          const SizedBox(height: 10),
          Text(loc.noLogsYet,
              style: TextStyle(
                  color: text.withValues(alpha: 0.20), fontSize: 13)),
          const SizedBox(height: 4),
          Text(loc.startBroadcastingToSeeOutput,
              style: TextStyle(
                  color: text.withValues(alpha: 0.10), fontSize: 11)),
        ],
      ),
    );
  }
}

class ConsoleWidget extends StatefulWidget {
  final ValueNotifier<List<String>> logsNotifier;
  final ScrollController scrollController;
  final bool debugEnabled;
  final VoidCallback onToggleDebug;
  final VoidCallback onClearLogs;
  final VoidCallback onCopyLogs;

  const ConsoleWidget({
    super.key,
    required this.logsNotifier,
    required this.scrollController,
    required this.debugEnabled,
    required this.onToggleDebug,
    required this.onClearLogs,
    required this.onCopyLogs,
  });

  @override
  State<ConsoleWidget> createState() => _ConsoleWidgetState();
}

class _ConsoleWidgetState extends State<ConsoleWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final loc  = AppLocalizations.of(context)!;
    final bg   = ThemeService.instance.background;
    final text = ThemeService.instance.textPrimary;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: _expanded ? 380 : 52,
          decoration: BoxDecoration(
            color: Color.lerp(bg, Colors.black, 0.25)!.withValues(alpha: 0.85),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: text.withValues(alpha: 0.07)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(loc, text),
                if (_expanded) Expanded(child: _buildLogList(loc)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations loc, Color text) {
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          border: _expanded
              ? Border(bottom: BorderSide(color: text.withValues(alpha: 0.07)))
              : null,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppTheme.primaryAccent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: AppTheme.primaryAccent.withValues(alpha: 0.2)),
              ),
              child: Icon(Icons.terminal_rounded,
                  color: AppTheme.primaryAccent, size: 14),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                loc.consoleOutput,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: text.withValues(alpha: 0.9)),
              ),
            ),

            if (_expanded)
              ValueListenableBuilder<List<String>>(
                valueListenable: widget.logsNotifier,
                builder: (_, logs, __) {
                  if (logs.isEmpty) return const SizedBox.shrink();
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(
                      color: text.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: text.withValues(alpha: 0.08)),
                    ),
                    child: Text(
                      '${logs.length}',
                      style: TextStyle(
                          fontSize: 10,
                          color: text.withValues(alpha: 0.35),
                          fontWeight: FontWeight.w600),
                    ),
                  );
                },
              ),

            if (_expanded) ...[
              _iconBtn(
                icon: widget.debugEnabled
                    ? Icons.bug_report_rounded
                    : Icons.bug_report_outlined,
                color: widget.debugEnabled
                    ? AppTheme.success
                    : text.withValues(alpha: 0.3),
                tooltip: loc.toggleDebug,
                onTap: widget.onToggleDebug,
              ),
              _iconBtn(
                icon: Icons.copy_outlined,
                color: text.withValues(alpha: 0.3),
                tooltip: loc.copyLogs,
                onTap: widget.onCopyLogs,
              ),
              _iconBtn(
                icon: Icons.delete_outline_rounded,
                color: text.withValues(alpha: 0.3),
                tooltip: loc.clear,
                onTap: widget.onClearLogs,
              ),
            ],

            const SizedBox(width: 4),
            AnimatedRotation(
              turns: _expanded ? 0.5 : 0,
              duration: const Duration(milliseconds: 300),
              child: Icon(Icons.keyboard_arrow_down_rounded,
                  color: text.withValues(alpha: 0.3), size: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogList(AppLocalizations loc) {
    return ValueListenableBuilder<List<String>>(
      valueListenable: widget.logsNotifier,
      builder: (_, logs, __) {
        if (logs.isEmpty) return _EmptyConsole(loc: loc);
        return ListView.builder(
          controller: widget.scrollController,
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
          itemCount: logs.length,
          itemBuilder: (_, i) => _LogRow(log: logs[i]),
        );
      },
    );
  }

  Widget _iconBtn({
    required IconData icon,
    required Color color,
    required String tooltip,
    required VoidCallback onTap,
  }) =>
      Tooltip(
        message: tooltip,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Icon(icon, size: 15, color: color),
          ),
        ),
      );
}

class ConsoleDialog extends StatelessWidget {
  final ValueNotifier<List<String>> logsNotifier;
  final ScrollController scrollController;
  final bool debugEnabled;
  final VoidCallback onToggleDebug;
  final VoidCallback onClearLogs;
  final VoidCallback onCopyLogs;

  const ConsoleDialog({
    super.key,
    required this.logsNotifier,
    required this.scrollController,
    required this.debugEnabled,
    required this.onToggleDebug,
    required this.onClearLogs,
    required this.onCopyLogs,
  });

  @override
  Widget build(BuildContext context) {
    final loc  = AppLocalizations.of(context)!;
    final bg   = ThemeService.instance.background;
    final text = ThemeService.instance.textPrimary;
    final darkBg = Color.lerp(bg, Colors.black, 0.35)!;

    return Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: Container(
        color: darkBg,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: text.withValues(alpha: 0.04),
                  border: Border(
                    bottom: BorderSide(color: text.withValues(alpha: 0.07)),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryAccent.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: AppTheme.primaryAccent.withValues(alpha: 0.2)),
                      ),
                      child: Icon(Icons.terminal_rounded,
                          color: AppTheme.primaryAccent, size: 14),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        loc.consoleOutput,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: text.withValues(alpha: 0.9)),
                      ),
                    ),
                    _iconBtn(
                      icon: debugEnabled
                          ? Icons.bug_report_rounded
                          : Icons.bug_report_outlined,
                      color: debugEnabled
                          ? AppTheme.success
                          : text.withValues(alpha: 0.3),
                      tooltip: loc.toggleDebug,
                      onTap: onToggleDebug,
                    ),
                    _iconBtn(
                      icon: Icons.copy_outlined,
                      color: text.withValues(alpha: 0.3),
                      tooltip: loc.copyLogs,
                      onTap: onCopyLogs,
                    ),
                    _iconBtn(
                      icon: Icons.delete_outline_rounded,
                      color: text.withValues(alpha: 0.3),
                      tooltip: loc.clear,
                      onTap: onClearLogs,
                    ),
                    _iconBtn(
                      icon: Icons.close_rounded,
                      color: text.withValues(alpha: 0.5),
                      tooltip: loc.close,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: ValueListenableBuilder<List<String>>(
                  valueListenable: logsNotifier,
                  builder: (_, logs, __) {
                    if (logs.isEmpty) return _EmptyConsole(loc: loc);
                    return ListView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                      itemCount: logs.length,
                      itemBuilder: (_, i) => _LogRow(log: logs[i]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconBtn({
    required IconData icon,
    required Color color,
    required String tooltip,
    required VoidCallback onTap,
  }) =>
      Tooltip(
        message: tooltip,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(icon, size: 16, color: color),
          ),
        ),
      );
}
