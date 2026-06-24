import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class RpTabInfoBox extends StatelessWidget {
  final String text;
  const RpTabInfoBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline_rounded, size: 15, color: AppTheme.textMuted),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: AppTheme.textSecondary, fontSize: 12, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
