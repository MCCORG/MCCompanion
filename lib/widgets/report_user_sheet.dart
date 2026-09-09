import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/report_service.dart';
import '../l10n/app_localizations.dart';
import 'components/app_toast.dart';

Future<void> showReportUserSheet(BuildContext context, String username) {
  final l = AppLocalizations.of(context)!;
  final infoCtrl = TextEditingController();
  String? selectedReason;

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setSheet) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.background,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            border: const Border(top: BorderSide(color: AppTheme.borderGray)),
          ),
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppTheme.borderLight,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Text(
                l.reportUserWithName(username),
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                l.reportDisclaimer,
                style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
              ),
              const SizedBox(height: 16),
              for (final entry in [
                ('spam', l.reportReasonSpam),
                ('harassment', l.reportReasonHarassment),
                ('inappropriate', l.reportReasonInappropriate),
                ('other', l.reportReasonOther),
              ])
                _ReasonTile(
                  label: entry.$2,
                  selected: selectedReason == entry.$1,
                  onTap: () => setSheet(() => selectedReason = entry.$1),
                ),
              const SizedBox(height: 12),
              TextField(
                controller: infoCtrl,
                maxLines: 2,
                style: TextStyle(color: AppTheme.textPrimary, fontSize: 13),
                decoration: InputDecoration(
                  hintText: l.reportAdditionalDetails,
                  hintStyle: TextStyle(color: AppTheme.textMuted, fontSize: 13),
                  filled: true,
                  fillColor: AppTheme.surfaceRaised,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppTheme.borderGray),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppTheme.borderGray),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppTheme.accent, width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedReason == null
                      ? null
                      : () async {
                          final messenger = context;
                          Navigator.of(ctx).pop();
                          final ok = await ReportService.submitReport(
                            reportedUsername: username,
                            reason: selectedReason!,
                            additionalInfo: infoCtrl.text.trim(),
                          );
                          if (!messenger.mounted) return;
                          AppToast.show(
                            messenger,
                            message: ok ? l.reportSuccess : l.reportFailed,
                            icon: ok
                                ? Icons.check_circle_rounded
                                : Icons.error_outline_rounded,
                            color: ok ? AppTheme.success : AppTheme.error,
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.error,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    l.reportSubmit,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ).whenComplete(infoCtrl.dispose);
}

class _ReasonTile extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _ReasonTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? AppTheme.error.withValues(alpha: 0.10)
              : AppTheme.surfaceRaised,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            color: selected
                ? AppTheme.error.withValues(alpha: 0.50)
                : AppTheme.borderGray,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: selected ? AppTheme.error : AppTheme.textPrimary,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            if (selected)
              Icon(Icons.check_circle_rounded, color: AppTheme.error, size: 18),
          ],
        ),
      ),
    );
  }
}
