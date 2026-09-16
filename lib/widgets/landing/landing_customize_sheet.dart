import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../theme/app_tokens.dart';
import '../../services/home_customization_service.dart';
import '../../services/theme_service.dart';
import '../../design/design.dart';

class LandingColorSwatch {
  final Color color;
  final Gradient? gradient;
  final bool isSelected;
  final VoidCallback onTap;
  const LandingColorSwatch({
    required this.color,
    this.gradient,
    required this.isSelected,
    required this.onTap,
  });
}

class LandingColorPickerSection extends StatelessWidget {
  final String label;
  final Color currentColor;
  final List<LandingColorSwatch> presets;
  final VoidCallback onPickCustom;

  const LandingColorPickerSection({
    super.key,
    required this.label,
    required this.currentColor,
    required this.presets,
    required this.onPickCustom,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onPickCustom,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: AppRadius.small,
                  border: Border.all(color: AppTheme.borderGray),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: currentColor,
                        border: Border.all(
                          color: AppTheme.borderLight,
                          width: 1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      AppLocalizations.of(context)!.colorSwatchCustom,
                      style: TextStyle(color: AppTheme.textMuted, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: presets.map((s) {
            return GestureDetector(
              onTap: s.onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: s.gradient == null ? s.color : null,
                  gradient: s.gradient,
                  border: Border.all(
                    color: s.isSelected ? Colors.white : AppTheme.borderGray,
                    width: s.isSelected ? 2.5 : 1.5,
                  ),
                  boxShadow: s.isSelected
                      ? [
                          BoxShadow(
                            color: s.color.withValues(alpha: 0.5),
                            blurRadius: 8,
                          ),
                        ]
                      : null,
                ),
                child: s.isSelected
                    ? const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 14,
                      )
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class LandingNavEditor extends StatelessWidget {
  final String label;
  final AppFeature? selected;
  final void Function(AppFeature?) onChanged;

  const LandingNavEditor({
    super.key,
    required this.label,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final options = AppFeature.values
        .where((f) => !HomeCustomizationService.navSlotBlacklist.contains(f))
        .toList();

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: AppRadius.medium,
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              GestureDetector(
                onTap: () => onChanged(null),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: selected == null
                        ? AppTheme.textMuted.withValues(alpha: 0.12)
                        : AppTheme.surfaceLight,
                    borderRadius: AppRadius.small,
                    border: Border.all(
                      color: selected == null
                          ? AppTheme.textMuted
                          : AppTheme.borderGray,
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.none,
                    style: TextStyle(
                      color: selected == null
                          ? AppTheme.textPrimary
                          : AppTheme.textMuted,
                      fontWeight: selected == null
                          ? FontWeight.w600
                          : FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              ...options.map((f) {
                final isSelected = f == selected;
                final color = Color(f.colorValue);
                return GestureDetector(
                  onTap: () => onChanged(f),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? color.withValues(alpha: 0.15)
                          : AppTheme.surfaceLight,
                      borderRadius: AppRadius.small,
                      border: Border.all(
                        color: isSelected ? color : AppTheme.borderGray,
                      ),
                    ),
                    child: Text(
                      f.label(l),
                      style: TextStyle(
                        color: isSelected ? color : AppTheme.textMuted,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class LandingCustomizeSheet extends StatefulWidget {
  final VoidCallback Function(AppFeature) callbackFor;
  final VoidCallback onClose;
  const LandingCustomizeSheet({
    super.key,
    required this.callbackFor,
    required this.onClose,
  });

  @override
  State<LandingCustomizeSheet> createState() => LandingCustomizeSheetState();
}

class LandingCustomizeSheetState extends State<LandingCustomizeSheet> {
  AppFeature? _navOuter;
  AppFeature? _navFar;
  AppFeature? _navLeft;
  AppFeature? _navRight;
  late AccentPreset _accent;
  late BgPreset _bg;
  late double _opacity;
  late CardPreset _card;
  late double _cardOpacity;
  Color? _customAccent;
  Color? _customBg;
  Color? _customCard;
  Color? _customText;

  Color get _effectiveAccent => _customAccent ?? _accent.color;
  Color get _effectiveBg => _customBg ?? _bg.base;
  Color get _effectiveCard => _customCard ?? _card.color;

  @override
  void initState() {
    super.initState();
    final svc = HomeCustomizationService.instance;
    _navOuter = svc.navOuter;
    _navFar = svc.navFar;
    _navLeft = svc.navLeft;
    _navRight = svc.navRight;
    _accent = ThemeService.instance.accent;
    _bg = ThemeService.instance.bg;
    _opacity = ThemeService.instance.opacity;
    _card = ThemeService.instance.card;
    _cardOpacity = ThemeService.instance.cardOpacity;
    _customAccent = ThemeService.instance.customAccent;
    _customBg = ThemeService.instance.customBg;
    _customCard = ThemeService.instance.customCard;
    _customText = ThemeService.instance.customText;
  }

  void _openColorPicker({
    required Color current,
    required String title,
    required void Function(Color) onPick,
  }) {
    final l = AppLocalizations.of(context)!;
    Color tmp = current;
    final hexController = TextEditingController(
      text: '#${tmp.toARGB32().toRadixString(16).substring(2).toUpperCase()}',
    );
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDlg) {
          void syncHex(Color c) {
            hexController.text =
                '#${c.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
          }

          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: 340,
              decoration: BoxDecoration(
                color: AppTheme.surfaceRaised,
                borderRadius: AppRadius.large,
                border: Border.all(color: AppTheme.borderGray),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 16, 0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: TextStyle(
                              color: AppTheme.textPrimary,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.close_rounded,
                            size: 18,
                            color: AppTheme.textMuted,
                          ),
                          onPressed: () => Navigator.of(ctx).pop(),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SlidePicker(
                      pickerColor: tmp,
                      onColorChanged: (c) {
                        tmp = c;
                        syncHex(c);
                        setDlg(() {});
                      },
                      colorModel: ColorModel.hsv,
                      enableAlpha: false,
                      showParams: false,
                      showIndicator: true,
                      indicatorBorderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      sliderSize: const Size(double.infinity, 24),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: tmp,
                            borderRadius: AppRadius.small,
                            border: Border.all(color: AppTheme.borderLight),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: hexController,
                            style: TextStyle(
                              color: AppTheme.textPrimary,
                              fontSize: 13,
                              fontFamily: 'monospace',
                            ),
                            decoration: InputDecoration(
                              labelText: l.colorPickerHex,
                              labelStyle: TextStyle(
                                color: AppTheme.textMuted,
                                fontSize: 11,
                              ),
                              filled: true,
                              fillColor: AppTheme.overlay,
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: AppRadius.small,
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: AppRadius.small,
                                borderSide: BorderSide(
                                  color: AppTheme.borderGray,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: AppRadius.small,
                                borderSide: BorderSide(
                                  color: AppTheme.accent,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            onSubmitted: (v) {
                              final hex = v.replaceAll('#', '').trim();
                              if (hex.length == 6) {
                                final parsed = Color(
                                  int.parse('FF$hex', radix: 16),
                                );
                                tmp = parsed;
                                syncHex(parsed);
                                setDlg(() {});
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppTheme.textMuted,
                              side: BorderSide(color: AppTheme.borderGray),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(l.cancel),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                              onPick(tmp);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.accent,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(l.colorPickerApply),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _save() async {
    final svc = HomeCustomizationService.instance;
    await Future.wait([
      svc.saveNavOuter(_navOuter),
      svc.saveNavFar(_navFar),
      svc.saveNavLeft(_navLeft),
      svc.saveNavRight(_navRight),
      svc.completeOnboarding(),
      ThemeService.instance.saveAll(),
    ]);
    if (mounted) widget.onClose();
  }

  Future<void> _reset() async {
    await HomeCustomizationService.instance.reset();
    await ThemeService.instance.reset();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DsHeader(
          title: l.customizeLabel,
          subtitle: l.customizeSubtitle,
          leading: DsIconButton(
            icon: Icons.arrow_back_rounded,
            size: 36,
            onPressed: widget.onClose,
          ),
          actions: [
            DsButton(
              label: l.resetLabel,
              tone: DsButtonTone.quiet,
              size: DsButtonSize.small,
              onPressed: _reset,
            ),
            DsButton(label: l.save, size: DsButtonSize.small, onPressed: _save),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              DsSpace.gutter,
              0,
              DsSpace.gutter,
              DsSpace.xxxl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.navigationSection,
                  style: TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l.navFixed,
                  style: const TextStyle(
                    color: AppTheme.textDisabled,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 12),
                LandingNavEditor(
                  label: l.outerSlot,
                  selected: _navOuter,
                  onChanged: (f) => setState(() => _navOuter = f),
                ),
                const SizedBox(height: 10),
                LandingNavEditor(
                  label: l.leftSlot,
                  selected: _navLeft,
                  onChanged: (f) => setState(() => _navLeft = f),
                ),
                const SizedBox(height: 10),
                LandingNavEditor(
                  label: l.rightSlot,
                  selected: _navRight,
                  onChanged: (f) => setState(() => _navRight = f),
                ),
                const SizedBox(height: 10),
                LandingNavEditor(
                  label: l.farSlot,
                  selected: _navFar,
                  onChanged: (f) => setState(() => _navFar = f),
                ),

                const SizedBox(height: 20),

                LandingColorPickerSection(
                  label: l.accentColorSection,
                  currentColor: _effectiveAccent.withValues(alpha: _opacity),
                  presets: accentPresets
                      .map(
                        (p) => LandingColorSwatch(
                          color: p.color.withValues(alpha: _opacity),
                          isSelected:
                              _customAccent == null && p.id == _accent.id,
                          onTap: () {
                            setState(() {
                              _accent = p;
                              _customAccent = null;
                            });
                            ThemeService.instance.setAccentLive(p);
                          },
                        ),
                      )
                      .toList(),
                  onPickCustom: () => _openColorPicker(
                    current: _effectiveAccent,
                    title: l.accentColorSection,
                    onPick: (c) {
                      setState(() => _customAccent = c);
                      ThemeService.instance.setCustomAccentLive(c);
                    },
                  ),
                ),

                const SizedBox(height: 14),

                Row(
                  children: [
                    Flexible(
                      child: Text(
                        l.opacityLabel,
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${(_opacity * 100).round()}%',
                      style: TextStyle(
                        color: _accent.color.withValues(alpha: _opacity),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 4,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 8,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 16,
                    ),
                    activeTrackColor: _accent.color.withValues(alpha: _opacity),
                    inactiveTrackColor: AppTheme.borderGray,
                    thumbColor: _accent.color.withValues(alpha: _opacity),
                    overlayColor: _accent.color.withValues(alpha: 0.15),
                  ),
                  child: Slider(
                    value: _opacity,
                    min: 0.3,
                    max: 1.0,
                    divisions: 14,
                    onChanged: (v) {
                      setState(() => _opacity = v);
                      ThemeService.instance.setOpacityLive(v);
                    },
                  ),
                ),

                const SizedBox(height: 24),

                LandingColorPickerSection(
                  label: l.backgroundSection,
                  currentColor: _effectiveBg,
                  presets: bgPresets
                      .map(
                        (p) => LandingColorSwatch(
                          color: p.tint,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [p.tint.withValues(alpha: 0.8), p.base],
                          ),
                          isSelected: _customBg == null && p.id == _bg.id,
                          onTap: () {
                            setState(() {
                              _bg = p;
                              _customBg = null;
                            });
                            ThemeService.instance.setBgLive(p);
                          },
                        ),
                      )
                      .toList(),
                  onPickCustom: () => _openColorPicker(
                    current: _effectiveBg,
                    title: l.backgroundSection,
                    onPick: (c) {
                      setState(() => _customBg = c);
                      ThemeService.instance.setCustomBgLive(c);
                    },
                  ),
                ),

                const SizedBox(height: 24),

                LandingColorPickerSection(
                  label: l.cardsSection,
                  currentColor: _effectiveCard.withValues(alpha: _cardOpacity),
                  presets: cardPresets
                      .map(
                        (p) => LandingColorSwatch(
                          color: p.color.withValues(alpha: _cardOpacity),
                          isSelected: _customCard == null && p.id == _card.id,
                          onTap: () {
                            setState(() {
                              _card = p;
                              _customCard = null;
                            });
                            ThemeService.instance.setCardLive(p);
                          },
                        ),
                      )
                      .toList(),
                  onPickCustom: () => _openColorPicker(
                    current: _effectiveCard,
                    title: l.cardsSection,
                    onPick: (c) {
                      setState(() => _customCard = c);
                      ThemeService.instance.setCustomCardLive(c);
                    },
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        l.opacityLabel,
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${(_cardOpacity * 100).round()}%',
                      style: TextStyle(
                        color: _card.color,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 4,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 8,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 16,
                    ),
                    activeTrackColor: _card.color.withValues(alpha: 0.7),
                    inactiveTrackColor: AppTheme.borderGray,
                    thumbColor: _card.color,
                    overlayColor: _card.color.withValues(alpha: 0.15),
                  ),
                  child: Slider(
                    value: _cardOpacity,
                    min: 0.1,
                    max: 1.0,
                    divisions: 18,
                    onChanged: (v) {
                      setState(() => _cardOpacity = v);
                      ThemeService.instance.setCardOpacityLive(v);
                    },
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  children: [
                    Text(
                      l.textColorSection,
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const Spacer(),
                    if (_customText != null)
                      GestureDetector(
                        onTap: () {
                          setState(() => _customText = null);
                          ThemeService.instance.setTextColorLive(null);
                        },
                        child: Text(
                          l.resetLabel,
                          style: TextStyle(
                            color: AppTheme.accent,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _openColorPicker(
                        current: _customText ?? const Color(0xFFFFFFFF),
                        title: l.textColorPickerTitle,
                        onPick: (c) {
                          setState(() => _customText = c);
                          ThemeService.instance.setTextColorLive(c);
                        },
                      ),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: _customText ?? const Color(0xFFFFFFFF),
                          border: Border.all(
                            color: AppTheme.borderLight,
                            width: 1.5,
                          ),
                        ),
                        child: const Icon(
                          Icons.colorize_rounded,
                          color: Colors.black45,
                          size: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l.textColorHint,
                            style: TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 12,
                            ),
                          ),
                          if (_customText != null) ...[
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  '${l.textColorPreviewPrimary}  ',
                                  style: TextStyle(
                                    color: _customText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '${l.textColorPreviewSecondary}  ',
                                  style: TextStyle(
                                    color: Color.lerp(
                                      _customText!,
                                      Colors.black,
                                      0.12,
                                    )!,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  l.textColorPreviewMuted,
                                  style: TextStyle(
                                    color: Color.lerp(
                                      _customText!,
                                      Colors.black,
                                      0.30,
                                    )!,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
