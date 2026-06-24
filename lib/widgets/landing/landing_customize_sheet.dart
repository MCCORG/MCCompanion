import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../services/home_customization_service.dart';
import '../../services/theme_service.dart';
import '../components/app_sheet.dart';

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
            Text(
              label,
              style: TextStyle(
                color: AppTheme.textMuted,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
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
                  borderRadius: BorderRadius.circular(8),
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
                        shape: BoxShape.circle,
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
                  shape: BoxShape.circle,
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

class LandingTileRow extends StatelessWidget {
  final AppFeature feature;
  final int index;
  final bool isHidden;
  final bool canHide;
  final VoidCallback onToggleHidden;
  final bool isWide;
  final VoidCallback? onToggleWide;

  const LandingTileRow({
    super.key,
    required this.feature,
    required this.index,
    this.isHidden = false,
    this.canHide = true,
    required this.onToggleHidden,
    this.isWide = false,
    this.onToggleWide,
  });

  @override
  Widget build(BuildContext context) {
    final color = Color(feature.colorValue);
    final l = AppLocalizations.of(context)!;
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isHidden ? 0.45 : 1.0,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppTheme.surfaceRaised,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: color.withValues(alpha: isHidden ? 0.06 : 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Image.asset(
                  feature.imagePath,
                  width: 18,
                  height: 18,
                  fit: BoxFit.contain,
                  color: isHidden ? AppTheme.textDisabled : null,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                feature.label(l),
                style: TextStyle(
                  color: isHidden
                      ? AppTheme.textDisabled
                      : AppTheme.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (!isHidden && onToggleWide != null)
              GestureDetector(
                onTap: onToggleWide,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Tooltip(
                    message: isWide
                        ? l.tileWideTooltipRemove
                        : l.tileWideTooltipAdd,
                    child: Icon(
                      isWide
                          ? Icons.view_agenda_rounded
                          : Icons.crop_landscape_rounded,
                      size: 18,
                      color: isWide ? color : AppTheme.textMuted,
                    ),
                  ),
                ),
              ),
            GestureDetector(
              onTap: canHide ? onToggleHidden : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Tooltip(
                  message: isHidden
                      ? l.tileVisibilityShow
                      : canHide
                      ? l.tileVisibilityHide
                      : l.tileVisibilityMin,
                  child: Icon(
                    isHidden
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    size: 18,
                    color: isHidden
                        ? AppTheme.textDisabled
                        : canHide
                        ? AppTheme.textMuted
                        : AppTheme.textDisabled,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            ReorderableDragStartListener(
              index: index - 1,
              child: Icon(
                Icons.drag_handle_rounded,
                color: AppTheme.textMuted,
                size: 20,
              ),
            ),
          ],
        ),
      ),
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
        borderRadius: BorderRadius.circular(12),
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
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                    color: selected == null ? AppTheme.textMuted.withValues(alpha: 0.12) : AppTheme.surfaceLight,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: selected == null ? AppTheme.textMuted : AppTheme.borderGray,
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.none,
                    style: TextStyle(
                      color: selected == null ? AppTheme.textPrimary : AppTheme.textMuted,
                      fontWeight: selected == null ? FontWeight.w600 : FontWeight.w400,
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
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      color: isSelected ? color.withValues(alpha: 0.15) : AppTheme.surfaceLight,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected ? color : AppTheme.borderGray,
                      ),
                    ),
                    child: Text(
                      f.label(l),
                      style: TextStyle(
                        color: isSelected ? color : AppTheme.textMuted,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
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
  const LandingCustomizeSheet({super.key, required this.callbackFor});

  @override
  State<LandingCustomizeSheet> createState() => LandingCustomizeSheetState();
}

class LandingCustomizeSheetState extends State<LandingCustomizeSheet> {
  late List<AppFeature> _order;
  AppFeature? _navLeft;
  AppFeature? _navRight;
  late Set<AppFeature> _hidden;
  late bool _useLanding;
  late AppFeature _startPage;
  AppFeature? _wideTile;
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

  int get _visibleCount => _order.where((f) => !_hidden.contains(f)).length;

  @override
  void initState() {
    super.initState();
    final svc = HomeCustomizationService.instance;
    _order = List.from(svc.tileOrder);
    _navLeft = svc.navLeft;
    _navRight = svc.navRight;
    _hidden = Set.from(svc.hiddenTiles);
    _useLanding = svc.useLandingAsStart;
    _startPage = svc.startPage;
    _wideTile = svc.wideTile;
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
            elevation: 0,
            child: Container(
              width: 340,
              decoration: BoxDecoration(
                color: AppTheme.surfaceRaised,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.borderGray),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 16, 0),
                    child: Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
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
                            borderRadius: BorderRadius.circular(8),
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
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppTheme.borderGray,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
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
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
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
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
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
      svc.saveTileOrder(_order),
      svc.saveNavLeft(_navLeft),
      svc.saveNavRight(_navRight),
      svc.saveHiddenTiles(_hidden),
      svc.saveWideTile(_wideTile),
      svc.completeOnboarding(_startPage, useLanding: _useLanding),
      ThemeService.instance.saveAll(),
    ]);
    if (mounted) Navigator.of(context).pop();
  }

  Future<void> _reset() async {
    await HomeCustomizationService.instance.reset();
    await ThemeService.instance.reset();
    if (mounted)
      setState(() {
        _hidden = {};
        _wideTile = null;
      });
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return AppSheet(
      onClose: () => Navigator.of(context).pop(),
      maxHeightFactor: 0.92,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l.customizeLabel,
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        l.customizeSubtitle,
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: _reset,
                  child: Text(
                    l.resetLabel,
                    style: TextStyle(color: AppTheme.textMuted, fontSize: 13),
                  ),
                ),
                FilledButton(
                  onPressed: _save,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppTheme.brand,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    l.save,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),

          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l.tilesSection,
                    style: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l.dragToReorder,
                    style: const TextStyle(
                      color: AppTheme.textDisabled,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ReorderableListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _order.length,
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) newIndex--;
                        final item = _order.removeAt(oldIndex);
                        _order.insert(newIndex, item);
                      });
                      HapticFeedback.selectionClick();
                    },
                    itemBuilder: (_, i) {
                      final f = _order[i];
                      final isHidden = _hidden.contains(f);
                      final canHide =
                          !HomeCustomizationService.alwaysVisible.contains(f) &&
                          (_visibleCount >
                                  HomeCustomizationService.minVisibleTiles ||
                              isHidden);
                      return LandingTileRow(
                        key: ValueKey(f),
                        feature: f,
                        index: i + 1,
                        isHidden: isHidden,
                        canHide: canHide,
                        onToggleHidden: () => setState(() {
                          if (isHidden) {
                            _hidden.remove(f);
                          } else {
                            _hidden.add(f);
                            if (_wideTile == f) _wideTile = null;
                          }
                        }),
                        isWide: _wideTile == f,
                        onToggleWide: isHidden
                            ? null
                            : () => setState(() {
                                _wideTile = _wideTile == f ? null : f;
                              }),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

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

                  const SizedBox(height: 20),

                  _StartPageEditor(
                    useLanding: _useLanding,
                    startPage: _startPage,
                    onUseLandingChanged: (v) => setState(() => _useLanding = v),
                    onStartPageChanged: (f) => setState(() => _startPage = f),
                  ),

                  const SizedBox(height: 24),

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
                      Text(
                        l.opacityLabel,
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
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
                      activeTrackColor: _accent.color.withValues(
                        alpha: _opacity,
                      ),
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
                    currentColor: _effectiveCard.withValues(
                      alpha: _cardOpacity,
                    ),
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
                      Text(
                        l.opacityLabel,
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
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
                            shape: BoxShape.circle,
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
      ),
    );
  }
}

class _StartPageEditor extends StatelessWidget {
  final bool useLanding;
  final AppFeature startPage;
  final ValueChanged<bool> onUseLandingChanged;
  final ValueChanged<AppFeature> onStartPageChanged;

  const _StartPageEditor({
    required this.useLanding,
    required this.startPage,
    required this.onUseLandingChanged,
    required this.onStartPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.startPageSectionLabel,
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          _StartOption(
            label: AppLocalizations.of(context)!.startPageHome,
            subtitle: AppLocalizations.of(context)!.startPageHomeSubtitle,
            selected: useLanding,
            onTap: () => onUseLandingChanged(true),
          ),
          const SizedBox(height: 8),
          _StartOption(
            label: AppLocalizations.of(context)!.startPageFeature,
            subtitle: AppLocalizations.of(context)!.startPageFeatureSubtitle,
            selected: !useLanding,
            onTap: () => onUseLandingChanged(false),
          ),
          if (!useLanding) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: AppFeature.values.map((f) {
                final isSelected = f == startPage;
                final color = Color(f.colorValue);
                return GestureDetector(
                  onTap: () => onStartPageChanged(f),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      color: isSelected ? color.withValues(alpha: 0.15) : AppTheme.surfaceLight,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected ? color : AppTheme.borderGray,
                      ),
                    ),
                    child: Text(
                      f.label(l),
                      style: TextStyle(
                        color: isSelected ? color : AppTheme.textMuted,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}

class _StartOption extends StatelessWidget {
  final String label;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  const _StartOption({
    required this.label,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppTheme.accent.withValues(alpha: 0.10) : AppTheme.surfaceLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? AppTheme.accent.withValues(alpha: 0.40) : AppTheme.borderGray,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: selected ? AppTheme.accent : AppTheme.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: AppTheme.textMuted, fontSize: 11),
                  ),
                ],
              ),
            ),
            if (selected)
              Icon(Icons.check_circle_rounded, color: AppTheme.accent, size: 16),
          ],
        ),
      ),
    );
  }
}
