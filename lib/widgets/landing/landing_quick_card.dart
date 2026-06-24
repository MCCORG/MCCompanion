import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../services/home_customization_service.dart';

class LandingQuickCard extends StatefulWidget {
  final AppFeature feature;
  final VoidCallback onTap;
  final Duration animationDelay;

  const LandingQuickCard({
    super.key,
    required this.feature,
    required this.onTap,
    this.animationDelay = Duration.zero,
  });

  @override
  State<LandingQuickCard> createState() => LandingQuickCardState();
}

class LandingQuickCardState extends State<LandingQuickCard>
    with SingleTickerProviderStateMixin {
  bool _pressed = false;
  late final AnimationController _entranceCtrl;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _entranceCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    );
    _fadeAnim = CurvedAnimation(parent: _entranceCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.12), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _entranceCtrl, curve: Curves.easeOutCubic),
        );

    Future.delayed(widget.animationDelay, () {
      if (mounted) _entranceCtrl.forward();
    });
  }

  @override
  void dispose() {
    _entranceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Color(widget.feature.colorValue);
    final l = AppLocalizations.of(context)!;
    final isDesktop =
        Theme.of(context).platform == TargetPlatform.macOS ||
        Theme.of(context).platform == TargetPlatform.windows ||
        Theme.of(context).platform == TargetPlatform.linux;
    final imgSize = isDesktop ? 42.0 : 64.0;
    final glowExtra = isDesktop ? 12.0 : 18.0;
    final vPad = isDesktop ? 8.0 : 10.0;
    final gap1 = isDesktop ? 6.0 : 8.0;
    final gap2 = isDesktop ? 2.0 : 3.0;

    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: GestureDetector(
          onTapDown: (_) => setState(() => _pressed = true),
          onTapUp: (_) => setState(() => _pressed = false),
          onTapCancel: () => setState(() => _pressed = false),
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: _pressed ? 0.96 : 1.0,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: vPad),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: color.withValues(alpha: 0.20)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppTheme.surfaceRaised,
                    Color.lerp(AppTheme.surfaceRaised, color, 0.07)!,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: imgSize + glowExtra,
                    height: imgSize + glowExtra,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.withValues(alpha: 0.10),
                    ),
                    child: Center(
                      child: Image.asset(
                        widget.feature.imagePath,
                        width: imgSize,
                        height: imgSize,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: gap1),
                  Text(
                    widget.feature.label(l),
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: gap2),
                  Text(
                    widget.feature.subtitle(l),
                    style: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 10,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LandingFeedbackTile extends StatefulWidget {
  final VoidCallback? onTap;
  const LandingFeedbackTile({super.key, this.onTap});

  @override
  State<LandingFeedbackTile> createState() => LandingFeedbackTileState();
}

class LandingFeedbackTileState extends State<LandingFeedbackTile> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFFF87171);
    const colorAccent = Color(0xFF67E404);

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withValues(alpha: 0.20)),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.lerp(AppTheme.surfaceRaised, color, 0.06)!,
                Color.lerp(AppTheme.surfaceRaised, colorAccent, 0.04)!,
              ],
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withValues(alpha: 0.12),
                ),
                child: const Center(
                  child: FaIcon(FontAwesomeIcons.bug, size: 15, color: color),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.feedbackTileTitle,
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      AppLocalizations.of(context)!.feedbackTileSubtitle,
                      style: TextStyle(color: AppTheme.textMuted, fontSize: 11),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.surfaceRaised,
                  border: Border.all(color: AppTheme.borderGray),
                ),
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 16,
                  color: AppTheme.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LandingQuickNavChip extends StatefulWidget {
  final Widget iconWidget;
  final String label;
  final VoidCallback? onTap;

  const LandingQuickNavChip({
    super.key,
    required this.iconWidget,
    required this.label,
    this.onTap,
  });

  @override
  State<LandingQuickNavChip> createState() => LandingQuickNavChipState();
}

class LandingQuickNavChipState extends State<LandingQuickNavChip> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Tooltip(
        message: widget.label,
        preferBelow: true,
        child: GestureDetector(
          onTapDown: (_) => setState(() => _pressed = true),
          onTapUp: (_) => setState(() => _pressed = false),
          onTapCancel: () => setState(() => _pressed = false),
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            padding: const EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              color: _pressed ? AppTheme.borderLight : AppTheme.surfaceRaised,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.borderGray),
            ),
            child: Center(child: widget.iconWidget),
          ),
        ),
      ),
    );
  }
}
