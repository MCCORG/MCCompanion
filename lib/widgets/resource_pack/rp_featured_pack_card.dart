import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class RpFeaturedPackCard extends StatelessWidget {
  final Map<String, dynamic> pack;
  final bool isApplying;
  final VoidCallback onUse;

  const RpFeaturedPackCard({
    super.key,
    required this.pack,
    required this.isApplying,
    required this.onUse,
  });

  @override
  Widget build(BuildContext context) {
    final name = pack['name'] as String;
    final description = pack['description'] as String?;
    final thumbnailUrl = pack['thumbnailUrl'] as String?;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: thumbnailUrl != null
                  ? Image.network(
                      thumbnailUrl,
                      width: 72, height: 72,
                      fit: BoxFit.cover,
                      errorBuilder: (ctx, err, st) => _placeholder(),
                    )
                  : _placeholder(),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(color: AppTheme.textPrimary, fontSize: 13, fontWeight: FontWeight.w700),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (description != null && description.isNotEmpty) ...[
                    const SizedBox(height: 3),
                    Text(
                      description,
                      style: TextStyle(color: AppTheme.textMuted, fontSize: 12, height: 1.4),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 10),
            isApplying
                ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: AppTheme.accent))
                : GestureDetector(
                    onTap: onUse,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppTheme.accent.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppTheme.accent.withValues(alpha: 0.30)),
                      ),
                      child: Text('Use', style: TextStyle(color: AppTheme.accent, fontSize: 13, fontWeight: FontWeight.w600)),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _placeholder() => Container(
    width: 72, height: 72,
    color: AppTheme.surfaceRaisedSolid,
    child: Icon(Icons.extension_rounded, color: AppTheme.textMuted, size: 28),
  );
}
