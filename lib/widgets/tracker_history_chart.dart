import 'package:flutter/material.dart';

import '../design/design.dart';
import '../l10n/app_localizations.dart';
import '../services/tracker_api_service.dart';

class TrackerHistoryChart extends StatelessWidget {
  final String serverId;

  const TrackerHistoryChart({super.key, required this.serverId});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return FutureBuilder<TrackerHistory?>(
      key: ValueKey(serverId),
      future: TrackerApiService.getHistory(serverId),
      builder: (context, snapshot) {
        final history = snapshot.data;
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox(
            height: 120,
            child: Center(
              child: SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 1.8),
              ),
            ),
          );
        }
        if (history == null || history.dailyPeaks.length < 2) {
          return const SizedBox.shrink();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l.serverStatPlayers, style: DsType.caption),
            const SizedBox(height: DsSpace.sm),
            SizedBox(
              height: 90,
              width: double.infinity,
              child: CustomPaint(
                painter: _LinePainter(
                  values: history.dailyPeaks,
                  line: DsColor.accent,
                  fill: DsColor.accent.withValues(alpha: 0.14),
                ),
              ),
            ),
            const SizedBox(height: DsSpace.md),
            Row(
              children: [
                _stat(l.serverStatPeak, '${history.peak}'),
                _stat(l.serverStatUptime, '${history.uptime}%'),
                _stat(l.serverStatPlayers, history.average.toStringAsFixed(1)),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _stat(String label, String value) => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: DsType.caption),
        Text(value, style: DsType.bodyStrong),
      ],
    ),
  );
}

class _LinePainter extends CustomPainter {
  final List<int> values;
  final Color line;
  final Color fill;

  _LinePainter({required this.values, required this.line, required this.fill});

  @override
  void paint(Canvas canvas, Size size) {
    if (values.length < 2) return;
    final max = values.reduce((a, b) => a > b ? a : b);
    final top = max <= 0 ? 1 : max;
    final step = size.width / (values.length - 1);
    Offset point(int i) => Offset(
      i * step,
      size.height - (values[i] / top) * (size.height - 6) - 3,
    );

    final path = Path()..moveTo(point(0).dx, point(0).dy);
    for (var i = 1; i < values.length; i++) {
      path.lineTo(point(i).dx, point(i).dy);
    }
    final area = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(area, Paint()..color = fill);
    canvas.drawPath(
      path,
      Paint()
        ..color = line
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeJoin = StrokeJoin.round,
    );
  }

  @override
  bool shouldRepaint(covariant _LinePainter old) =>
      old.values != values || old.line != line;
}
