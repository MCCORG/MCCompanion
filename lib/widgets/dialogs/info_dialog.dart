import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../buttons/themed_button.dart';

class InfoDialog {
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String content,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) {
    final loc = AppLocalizations.of(context)!;

    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withValues(alpha: 0.65),
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: _InfoContent(
          title: title,
          content: content,
          actions:
              actions ??
              [
                ThemedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  variant: ThemedButtonVariant.primary,
                  child: Text(
                    loc.ok,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
        ),
      ),
    );
  }
}

class _InfoContent extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  const _InfoContent({
    required this.title,
    required this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 520,
        maxHeight: MediaQuery.of(context).size.height * 0.82,
      ),
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.borderGray),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.45),
            blurRadius: 36,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 20, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceLight,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.borderGray),
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      color: AppTheme.textSecondary,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: AppTheme.borderDim),

          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 8),
              child: Text(
                content,
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 14,
                  height: 1.7,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions
                  .map(
                    (w) => Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: w,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
