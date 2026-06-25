import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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

  String _formatSize(int n) {
    if (n < 1024) return '$n B';
    if (n < 1024 * 1024) return '${(n / 1024).toStringAsFixed(1)} KB';
    return '${(n / 1024 / 1024).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    final name = pack['name'] as String;
    final description = pack['description'] as String?;
    final thumbnailUrl = pack['thumbnailUrl'] as String?;
    final tags = pack['tags'] is List
        ? (pack['tags'] as List).cast<String>()
        : <String>[];
    final category = pack['category'] as String?;
    final slug = pack['slug'] as String?;
    final downloadCount = pack['downloadCount'] is int
        ? pack['downloadCount'] as int
        : int.tryParse(pack['downloadCount']?.toString() ?? '');
    final sizeBytes = pack['sizeBytes'] is int
        ? pack['sizeBytes'] as int
        : int.tryParse(pack['sizeBytes']?.toString() ?? '');

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF1a1f2a),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: thumbnailUrl != null
                    ? Image.network(
                        thumbnailUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.none,
                        errorBuilder: (ctx, err, st) => Icon(
                          Icons.extension_rounded,
                          color: AppTheme.textMuted,
                          size: 30,
                        ),
                      )
                    : Icon(
                        Icons.extension_rounded,
                        color: AppTheme.textMuted,
                        size: 30,
                      ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 10),
                      isApplying
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppTheme.accent,
                              ),
                            )
                          : GestureDetector(
                              onTap: onUse,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 7,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.accent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'Use',
                                  style: TextStyle(
                                    color: AppTheme.surfaceRaised,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                  if (description != null && description.isNotEmpty) ...[
                    const SizedBox(height: 3),
                    Text(
                      description,
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: 7),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      if (category != null)
                        _chip(category, const Color(0xFF60a5fa)),
                      ...tags.map((t) => _chip(t, AppTheme.accent)),
                      if (downloadCount != null)
                        Text(
                          '↓ $downloadCount',
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 11,
                          ),
                        ),
                      if (sizeBytes != null && sizeBytes > 0)
                        Text(
                          _formatSize(sizeBytes),
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 11,
                          ),
                        ),
                      GestureDetector(
                        onTap: () => launchUrl(
                          Uri.parse(
                            slug != null
                                ? 'https://mccompanion.net/packs?slug=$slug'
                                : 'https://mccompanion.net/packs',
                          ),
                          mode: LaunchMode.externalApplication,
                        ),
                        child: Text(
                          'Website →',
                          style: TextStyle(
                            color: AppTheme.accent,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String label, Color color) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.10),
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: color.withValues(alpha: 0.28)),
    ),
    child: Text(
      label,
      style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w600),
    ),
  );
}
