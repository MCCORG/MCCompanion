import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme/app_theme.dart';
import '../../models/saved_skin.dart';
import 'skin_painters.dart';
import '../../theme/app_tokens.dart';

class SavedSkinCard extends StatelessWidget {
  final SavedSkin skin;
  final VoidCallback onTap;
  const SavedSkinCard({super.key, required this.skin, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: AppRadius.medium,
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  LayoutBuilder(
                    builder: (_, constraints) => Center(
                      child: LocalSkinBodyImage(
                        filePath: skin.filePath,
                        height: constraints.maxHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: AppTheme.accent.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.mobileScreen,
                        size: 7,
                        color: AppTheme.accent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Text(
              skin.name,
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            FaIcon(
              FontAwesomeIcons.ellipsis,
              size: 10,
              color: AppTheme.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}
