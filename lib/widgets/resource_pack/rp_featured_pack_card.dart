import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../l10n/app_localizations.dart';
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

  void _openDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _PackDetailSheet(
        pack: pack,
        isApplying: isApplying,
        onUse: onUse,
        formatSize: _formatSize,
      ),
    );
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
    final downloadCount = pack['downloadCount'] is int
        ? pack['downloadCount'] as int
        : int.tryParse(pack['downloadCount']?.toString() ?? '');

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
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: const Color(0xFF1a1f2a),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: thumbnailUrl != null
                    ? Image.network(
                        thumbnailUrl,
                        width: 72,
                        height: 72,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.none,
                        errorBuilder: (ctx, err, st) => Icon(
                          Icons.extension_rounded,
                          color: AppTheme.textMuted,
                          size: 28,
                        ),
                      )
                    : Icon(
                        Icons.extension_rounded,
                        color: AppTheme.textMuted,
                        size: 28,
                      ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
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
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                            vertical: 8,
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
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () => _openDetail(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceRaisedSolid,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppTheme.borderGray),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.rpPackInfo,
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
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

class _PackDetailSheet extends StatelessWidget {
  final Map<String, dynamic> pack;
  final bool isApplying;
  final VoidCallback onUse;
  final String Function(int) formatSize;

  const _PackDetailSheet({
    required this.pack,
    required this.isApplying,
    required this.onUse,
    required this.formatSize,
  });

  @override
  Widget build(BuildContext context) {
    final name = pack['name'] as String;
    final description = pack['description'] as String?;
    final longDescription = pack['longDescription'] as String?;
    final thumbnailUrl = pack['thumbnailUrl'] as String?;
    final tags = pack['tags'] is List
        ? (pack['tags'] as List).cast<String>()
        : <String>[];
    final category = pack['category'] as String?;
    final slug = pack['slug'] as String?;
    final creatorWebsite = pack['creatorWebsite'] as String?;
    final creatorDiscord = pack['creatorDiscord'] as String?;
    final downloadCount = pack['downloadCount'] is int
        ? pack['downloadCount'] as int
        : int.tryParse(pack['downloadCount']?.toString() ?? '');
    final sizeBytes = pack['sizeBytes'] is int
        ? pack['sizeBytes'] as int
        : int.tryParse(pack['sizeBytes']?.toString() ?? '');

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.92,
      builder: (ctx, scrollCtrl) => Container(
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppTheme.borderGray,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Expanded(
              child: ListView(
                controller: scrollCtrl,
                padding: EdgeInsets.fromLTRB(
                  20,
                  16,
                  20,
                  32 + MediaQuery.of(ctx).padding.bottom,
                ),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (thumbnailUrl != null)
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1a1f2a),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              thumbnailUrl,
                              width: 64,
                              height: 64,
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.none,
                            ),
                          ),
                        ),
                      if (thumbnailUrl != null) const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                color: AppTheme.textPrimary,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            if (category != null || tags.isNotEmpty) ...[
                              const SizedBox(height: 6),
                              Wrap(
                                spacing: 4,
                                runSpacing: 4,
                                children: [
                                  if (category != null)
                                    _chip(category, const Color(0xFF60a5fa)),
                                  ...tags.map((t) => _chip(t, AppTheme.accent)),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  if (longDescription != null &&
                      longDescription.isNotEmpty) ...[
                    Text(
                      longDescription,
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 13,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ] else if (description != null && description.isNotEmpty) ...[
                    Text(
                      description,
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 13,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  if (downloadCount != null ||
                      (sizeBytes != null && sizeBytes > 0)) ...[
                    Row(
                      children: [
                        if (downloadCount != null)
                          Text(
                            '↓ ${AppLocalizations.of(context)!.rpDownloads(downloadCount)}',
                            style: TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 12,
                            ),
                          ),
                        if (downloadCount != null &&
                            sizeBytes != null &&
                            sizeBytes > 0)
                          Text(
                            '  ·  ',
                            style: TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 12,
                            ),
                          ),
                        if (sizeBytes != null && sizeBytes > 0)
                          Text(
                            formatSize(sizeBytes),
                            style: TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],

                  if (creatorWebsite != null &&
                          creatorWebsite.startsWith('https://') ||
                      creatorDiscord != null &&
                          creatorDiscord.startsWith('https://')) ...[
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        if (creatorWebsite != null &&
                            creatorWebsite.startsWith('https://'))
                          _linkButton(
                            'Website',
                            creatorWebsite,
                            AppTheme.textSecondary,
                          ),
                        if (creatorDiscord != null &&
                            creatorDiscord.startsWith('https://'))
                          _linkButton(
                            'Discord',
                            creatorDiscord,
                            const Color(0xFF7289da),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],

                  if (slug != null)
                    GestureDetector(
                      onTap: () => launchUrl(
                        Uri.parse('https://mccompanion.net/packs?slug=$slug'),
                        mode: LaunchMode.externalApplication,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.rpViewOnWebsite,
                        style: TextStyle(
                          color: AppTheme.accent,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: isApplying
                        ? Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppTheme.accent,
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              onUse();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.accent,
                              foregroundColor: AppTheme.surfaceRaised,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.rpUseThisPack,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
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

  Widget _linkButton(String label, String url, Color color) => GestureDetector(
    onTap: () =>
        launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
