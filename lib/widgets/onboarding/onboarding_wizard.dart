import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../services/home_customization_service.dart';
import '../../services/theme_service.dart';
import '../../theme/app_theme.dart';
import '../landing/landing_customize_sheet.dart';

class AppThemePreset {
  final String id;
  final String label;
  final AccentPreset accent;
  final BgPreset bg;
  final CardPreset card;
  const AppThemePreset({
    required this.id,
    required this.label,
    required this.accent,
    required this.bg,
    required this.card,
  });
}

const List<AppThemePreset> themePresets = [
  AppThemePreset(
    id: 'default',
    label: 'Minecraft',
    accent: AccentPreset(id: 'green', label: 'Green', color: Color(0xFF67E404)),
    bg: BgPreset(id: 'slate', label: 'Slate', base: Color(0xFF0E1117), tint: Color(0xFF334155)),
    card: CardPreset(id: 'neutral', label: 'Neutral', color: Color(0xFF1C2033)),
  ),
  AppThemePreset(
    id: 'ocean',
    label: 'Ocean',
    accent: AccentPreset(id: 'cyan', label: 'Cyan', color: Color(0xFF06B6D4)),
    bg: BgPreset(id: 'navy', label: 'Navy', base: Color(0xFF080D1A), tint: Color(0xFF1E3A5F)),
    card: CardPreset(id: 'navy', label: 'Navy', color: Color(0xFF0F2040)),
  ),
  AppThemePreset(
    id: 'forest',
    label: 'Forest',
    accent: AccentPreset(id: 'teal', label: 'Teal', color: Color(0xFF14B8A6)),
    bg: BgPreset(id: 'forest', label: 'Forest', base: Color(0xFF080F0D), tint: Color(0xFF14532D)),
    card: CardPreset(id: 'forest', label: 'Forest', color: Color(0xFF0F2D1F)),
  ),
  AppThemePreset(
    id: 'galaxy',
    label: 'Galaxy',
    accent: AccentPreset(id: 'purple', label: 'Purple', color: Color(0xFF8B5CF6)),
    bg: BgPreset(id: 'plum', label: 'Plum', base: Color(0xFF0E0812), tint: Color(0xFF4C1D95)),
    card: CardPreset(id: 'plum', label: 'Plum', color: Color(0xFF2D1548)),
  ),
  AppThemePreset(
    id: 'sunset',
    label: 'Sunset',
    accent: AccentPreset(id: 'orange', label: 'Orange', color: Color(0xFFF97316)),
    bg: BgPreset(id: 'coffee', label: 'Coffee', base: Color(0xFF100C08), tint: Color(0xFF78350F)),
    card: CardPreset(id: 'coffee', label: 'Coffee', color: Color(0xFF2D1E0F)),
  ),
  AppThemePreset(
    id: 'rose',
    label: 'Rose',
    accent: AccentPreset(id: 'pink', label: 'Pink', color: Color(0xFFEC4899)),
    bg: BgPreset(id: 'crimson', label: 'Crimson', base: Color(0xFF120808), tint: Color(0xFF7F1D1D)),
    card: CardPreset(id: 'crimson', label: 'Crimson', color: Color(0xFF3D1212)),
  ),
  AppThemePreset(
    id: 'midnight',
    label: 'Midnight',
    accent: AccentPreset(id: 'blue', label: 'Blue', color: Color(0xFF3B82F6)),
    bg: BgPreset(id: 'black', label: 'Dark', base: Color(0xFF080808), tint: Color(0xFF1F2937)),
    card: CardPreset(id: 'slate', label: 'Slate', color: Color(0xFF283548)),
  ),
  AppThemePreset(
    id: 'neon',
    label: 'Neon',
    accent: AccentPreset(id: 'lime', label: 'Lime', color: Color(0xFFA3E635)),
    bg: BgPreset(id: 'black', label: 'Dark', base: Color(0xFF080808), tint: Color(0xFF1F2937)),
    card: CardPreset(id: 'neutral', label: 'Neutral', color: Color(0xFF1C2033)),
  ),
];

class OnboardingWizard extends StatefulWidget {
  final VoidCallback onComplete;
  final VoidCallback onCustomize;
  const OnboardingWizard({
    super.key,
    required this.onComplete,
    required this.onCustomize,
  });

  @override
  State<OnboardingWizard> createState() => _OnboardingWizardState();
}

class _OnboardingWizardState extends State<OnboardingWizard> {
  int _step = 0;
  final int _totalSteps = 3;

  AppThemePreset _theme = themePresets[0];
  AppFeature? _navLeft = HomeCustomizationService.defaultNavLeft;
  AppFeature? _navRight = HomeCustomizationService.defaultNavRight;
  String _startPage = 'landing';

  @override
  void initState() {
    super.initState();
    _navLeft = HomeCustomizationService.instance.navLeft;
    _navRight = HomeCustomizationService.instance.navRight;
    WidgetsBinding.instance.addPostFrameCallback((_) => _applyThemeLive(themePresets[0]));
  }

  void _applyThemeLive(AppThemePreset t) {
    ThemeService.instance.setAccentLive(t.accent);
    ThemeService.instance.setBgLive(t.bg);
    ThemeService.instance.setCardLive(t.card);
  }

  void _next() {
    if (_step < _totalSteps - 1) {
      setState(() => _step++);
    } else {
      _finish();
    }
  }

  void _back() {
    if (_step > 0) setState(() => _step--);
  }

  Future<void> _finish({bool customize = false}) async {
    await ThemeService.instance.saveAll();
    await HomeCustomizationService.instance.saveNavLeft(_navLeft);
    await HomeCustomizationService.instance.saveNavRight(_navRight);
    final startFeature = _startPage == 'landing'
        ? null
        : AppFeature.values.firstWhere((f) => f.id == _startPage);
    await HomeCustomizationService.instance.completeOnboarding(
      startFeature ?? AppFeature.connector,
      useLanding: _startPage == 'landing',
    );
    if (mounted) Navigator.of(context).pop();
    if (customize) {
      widget.onCustomize();
    } else {
      widget.onComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppTheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _StepIndicator(current: _step, total: _totalSteps),
              const SizedBox(height: 28),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                transitionBuilder: (child, anim) => FadeTransition(
                  opacity: anim,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.04, 0),
                      end: Offset.zero,
                    ).animate(anim),
                    child: child,
                  ),
                ),
                child: KeyedSubtree(
                  key: ValueKey(_step),
                  child: _buildStep(context),
                ),
              ),
              const SizedBox(height: 28),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (_step) {
      0 => _ThemeStep(
          selected: _theme,
          onChanged: (t) {
            setState(() => _theme = t);
            _applyThemeLive(t);
          },
        ),
      1 => _NavStep(
          navLeft: _navLeft,
          navRight: _navRight,
          onLeftChanged: (f) => setState(() => _navLeft = f),
          onRightChanged: (f) => setState(() => _navRight = f),
          l: l,
        ),
      _ => _StartPageStep(
          selected: _startPage,
          onChanged: (v) => setState(() => _startPage = v),
          l: l,
        ),
    };
  }

  Widget _buildFooter(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final isLast = _step == _totalSteps - 1;
    return Column(
      children: [
        Row(
          children: [
            if (_step > 0)
              TextButton(
                onPressed: _back,
                child: Text(
                  l.back,
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 14),
                ),
              )
            else
              const SizedBox.shrink(),
            const Spacer(),
            GestureDetector(
              onTap: _next,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 13),
                decoration: BoxDecoration(
                  color: AppTheme.accent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  isLast ? l.done : l.next,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (isLast) ...[
          const SizedBox(height: 14),
          GestureDetector(
            onTap: () => _finish(customize: true),
            child: Text(
              l.onboardingCustomizeDetail,
              style: TextStyle(
                color: AppTheme.accent,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _StepIndicator extends StatelessWidget {
  final int current;
  final int total;
  const _StepIndicator({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (i) {
        final active = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: active ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: active ? AppTheme.accent : AppTheme.borderLight,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

class _ThemeStep extends StatelessWidget {
  final AppThemePreset selected;
  final ValueChanged<AppThemePreset> onChanged;
  const _ThemeStep({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.onboardingThemeTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          AppLocalizations.of(context)!.onboardingThemeSubtitle,
          style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 13, height: 1.5),
        ),
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: themePresets.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.7,
          ),
          itemBuilder: (_, i) {
            final t = themePresets[i];
            final isSelected = t.id == selected.id;
            final accent = t.accent.color;
            final bg = t.bg.base;
            final card = t.card.color;
            return GestureDetector(
              onTap: () => onChanged(t),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? accent : AppTheme.borderGray,
                    width: isSelected ? 2 : 1,
                  ),
                  boxShadow: isSelected
                      ? [BoxShadow(color: accent.withValues(alpha: 0.25), blurRadius: 10)]
                      : null,
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _MiniCard(bg: card, accent: accent),
                        const SizedBox(width: 6),
                        _MiniCard(bg: card, accent: accent, wide: true),
                        const Spacer(),
                        if (isSelected)
                          Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: accent,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check_rounded,
                              color: Colors.black,
                              size: 12,
                            ),
                          ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 28,
                      height: 4,
                      decoration: BoxDecoration(
                        color: accent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      t.label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _MiniCard extends StatelessWidget {
  final Color bg;
  final Color accent;
  final bool wide;
  const _MiniCard({required this.bg, required this.accent, this.wide = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: wide ? 36 : 18,
      height: 22,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(3),
      ),
      padding: const EdgeInsets.all(3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 2,
            width: wide ? 18 : 8,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          const SizedBox(height: 2),
          Container(
            height: 2,
            width: wide ? 26 : 12,
            color: Colors.white.withValues(alpha: 0.2),
          ),
        ],
      ),
    );
  }
}

class _NavStep extends StatelessWidget {
  final AppFeature? navLeft;
  final AppFeature? navRight;
  final ValueChanged<AppFeature?> onLeftChanged;
  final ValueChanged<AppFeature?> onRightChanged;
  final AppLocalizations l;
  const _NavStep({
    required this.navLeft,
    required this.navRight,
    required this.onLeftChanged,
    required this.onRightChanged,
    required this.l,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.onboardingNavTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          l.onboardingNavSubtitle,
          style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 13, height: 1.5),
        ),
        const SizedBox(height: 20),
        _NavPreview(left: navLeft, right: navRight, l: l),
        const SizedBox(height: 20),
        LandingNavEditor(
          label: l.onboardingNavLeftLabel,
          selected: navLeft,
          onChanged: onLeftChanged,
        ),
        const SizedBox(height: 12),
        LandingNavEditor(
          label: l.onboardingNavRightLabel,
          selected: navRight,
          onChanged: onRightChanged,
        ),
      ],
    );
  }
}

class _NavPreview extends StatelessWidget {
  final AppFeature? left;
  final AppFeature? right;
  final AppLocalizations l;
  const _NavPreview({required this.left, required this.right, required this.l});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderGray),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(icon: Icons.home_rounded, label: l.onboardingNavPreviewHome, active: false),
          if (left != null)
            _NavItem(
              icon: _iconFor(left!),
              label: left!.label(l),
              active: false,
              color: Color(left!.colorValue),
            )
          else
            _NavItem(icon: Icons.remove_rounded, label: l.onboardingNavPreviewEmpty, active: false),
          _NavItem(
            icon: Icons.electrical_services_rounded,
            label: l.onboardingNavPreviewConnector,
            active: true,
          ),
          if (right != null)
            _NavItem(
              icon: _iconFor(right!),
              label: right!.label(l),
              active: false,
              color: Color(right!.colorValue),
            )
          else
            _NavItem(icon: Icons.remove_rounded, label: l.onboardingNavPreviewEmpty, active: false),
          _NavItem(icon: Icons.person_rounded, label: l.onboardingNavPreviewProfile, active: false),
        ],
      ),
    );
  }

  IconData _iconFor(AppFeature f) => switch (f) {
    AppFeature.skins => Icons.face_rounded,
    AppFeature.wiki => Icons.menu_book_rounded,
    AppFeature.partners => Icons.dns_rounded,
    AppFeature.lookup => Icons.search_rounded,
    AppFeature.tracker => Icons.bar_chart_rounded,
    AppFeature.connector => Icons.electrical_services_rounded,
  };
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final Color? color;
  const _NavItem({
    required this.icon,
    required this.label,
    required this.active,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final c = active ? AppTheme.accent : (color ?? AppTheme.textMuted);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 22, color: c),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: c,
            fontSize: 10,
            fontWeight: active ? FontWeight.w700 : FontWeight.w400,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _StartPageStep extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;
  final AppLocalizations l;
  const _StartPageStep({
    required this.selected,
    required this.onChanged,
    required this.l,
  });

  @override
  Widget build(BuildContext context) {
    final options = [
      (id: 'landing', label: l.onboardingNavPreviewHome, icon: Icons.home_rounded, color: AppTheme.accent),
      ...AppFeature.values.map((f) => (
        id: f.id,
        label: f.label(l),
        icon: _iconFor(f),
        color: Color(f.colorValue),
      )),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.onboardingStartTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          l.onboardingStartSubtitle,
          style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 13, height: 1.5),
        ),
        const SizedBox(height: 20),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2.8,
          children: options.map((o) {
            final isSelected = o.id == selected;
            final color = o.color;
            return GestureDetector(
              onTap: () => onChanged(o.id),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? color.withValues(alpha: 0.15)
                      : AppTheme.surfaceRaised,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? color : AppTheme.borderGray,
                    width: isSelected ? 1.5 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(o.icon, size: 16, color: isSelected ? color : Colors.white.withValues(alpha: 0.5)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        o.label,
                        style: TextStyle(
                          color: isSelected ? color : Colors.white,
                          fontSize: 13,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isSelected)
                      Icon(Icons.check_circle_rounded, color: color, size: 15),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  IconData _iconFor(AppFeature f) => switch (f) {
    AppFeature.skins => Icons.face_rounded,
    AppFeature.wiki => Icons.menu_book_rounded,
    AppFeature.partners => Icons.dns_rounded,
    AppFeature.lookup => Icons.search_rounded,
    AppFeature.tracker => Icons.bar_chart_rounded,
    AppFeature.connector => Icons.electrical_services_rounded,
  };
}
