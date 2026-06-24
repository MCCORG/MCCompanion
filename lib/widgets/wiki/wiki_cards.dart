import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../screens/wiki_screen.dart';

class WikiSectionCard extends StatefulWidget {
  final WikiSection section;
  final VoidCallback onTap;

  const WikiSectionCard({super.key, required this.section, required this.onTap});

  @override
  State<WikiSectionCard> createState() => WikiSectionCardState();
}

class WikiSectionCardState extends State<WikiSectionCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.section.color;
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        decoration: BoxDecoration(
          color: _pressed
              ? AppTheme.surfaceRaised.withValues(alpha: 0.75)
              : AppTheme.surface.withValues(alpha: 0.60),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                widget.section.imagePath,
                width: 52,
                height: 52,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      widget.section.emoji,
                      style: const TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    wikiL10n(
                      AppLocalizations.of(context)!,
                      widget.section.label,
                    ),
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    AppLocalizations.of(
                      context,
                    )!.wikiCategories(widget.section.subs.length),
                    style: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 11,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 11,
              color: color.withValues(alpha: 0.60),
            ),
          ],
        ),
      ),
    );
  }
}

class WikiSubCard extends StatelessWidget {
  final WikiSub sub;
  final Color color;
  final VoidCallback onTap;
  const WikiSubCard({super.key, required this.sub, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        decoration: BoxDecoration(
          color: AppTheme.surface.withValues(alpha: 0.60),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (sub.imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  sub.imagePath!,
                  width: 52,
                  height: 52,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        sub.emoji,
                        style: const TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                ),
              )
            else
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(sub.emoji, style: const TextStyle(fontSize: 26)),
                ),
              ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                wikiL10n(AppLocalizations.of(context)!, sub.label),
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 11,
              color: color.withValues(alpha: 0.60),
            ),
          ],
        ),
      ),
    );
  }
}

class WikiPageCard extends StatelessWidget {
  final WikiResult result;
  final VoidCallback onTap;
  const WikiPageCard({super.key, required this.result, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppTheme.borderGray),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: result.thumbnailUrl != null
                    ? Image.network(
                        result.thumbnailUrl!,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _placeholder(),
                      )
                    : _placeholder(),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  result.title,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppTheme.textMuted,
                size: 13,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _placeholder() => Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(
      color: AppTheme.accent.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Center(child: Text('⛏️', style: TextStyle(fontSize: 20))),
  );
}
