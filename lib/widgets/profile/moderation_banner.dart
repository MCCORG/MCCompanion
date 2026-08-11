import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/moderation_status.dart';
import '../../theme/app_theme.dart';

class ModerationBanner extends StatelessWidget {
  const ModerationBanner({super.key, required this.status});

  final ModerationStatus? status;

  @override
  Widget build(BuildContext context) {
    final s = status;
    if (s == null || !s.isActive) return const SizedBox.shrink();

    final tone = s.isBan ? AppTheme.error : AppTheme.warning;
    final body = s.message ?? s.reason;
    final until = s.until;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: tone.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: tone.withValues(alpha: 0.45)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            s.isBan ? Icons.gavel_rounded : Icons.timer_off_rounded,
            color: tone,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (body != null && body.trim().isNotEmpty)
                  Text(
                    body,
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 13,
                      height: 1.45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                if (until != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    DateFormat.yMMMd().add_Hm().format(until.toLocal()),
                    style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
