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
    final tags = pack['tags'] is List ? (pack['tags'] as List).cast<String>() : <String>[];
    final category = pack['category'] as String?;
    final downloadCount = pack['downloadCount'] is int ? pack['downloadCount'] as int : int.tryParse(pack['downloadCount']?.toString() ?? '');
    final sizeBytes = pack['sizeBytes'] is int ? pack['sizeBytes'] as int : int.tryParse(pack['sizeBytes']?.toString() ?? '');

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: thumbnailUrl != null
                  ? Image.network(
                      thumbnailUrl,
                      width: 72, height: 72,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.none,
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
                  if (category != null || tags.isNotEmpty || downloadCount != null || (sizeBytes != null && sizeBytes > 0)) ...[
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        if (category != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color(0xFF60a5fa).withValues(alpha: 0.10),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: const Color(0xFF60a5fa).withValues(alpha: 0.30)),
                            ),
                            child: Text(category, style: const TextStyle(color: Color(0xFF60a5fa), fontSize: 10, fontWeight: FontWeight.w600)),
                          ),
                        ...tags.map((tag) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppTheme.accent.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppTheme.accent.withValues(alpha: 0.22)),
                          ),
                          child: Text(tag, style: TextStyle(color: AppTheme.accent, fontSize: 10, fontWeight: FontWeight.w600)),
                        )),
                        if (downloadCount != null)
                          Text(
                            '↓ $downloadCount',
                            style: TextStyle(color: AppTheme.textMuted, fontSize: 11),
                          ),
                        if (sizeBytes != null && sizeBytes > 0)
                          Text(
                            _formatSize(sizeBytes),
                            style: TextStyle(color: AppTheme.textMuted, fontSize: 11),
                          ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      final slug = pack['slug'] as String?;
                      final websiteUrl = slug != null
                          ? 'https://mccompanion.net/packs?slug=$slug'
                          : 'https://mccompanion.net/packs';
                      launchUrl(Uri.parse(websiteUrl), mode: LaunchMode.externalApplication);
                    },
                    child: Text(
                      'View on website →',
                      style: TextStyle(color: AppTheme.accent, fontSize: 11, fontWeight: FontWeight.w600, decoration: TextDecoration.underline, decorationColor: AppTheme.accent),
                    ),
                  ),
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
