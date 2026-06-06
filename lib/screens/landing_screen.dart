import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/notification_service.dart';
import '../services/home_customization_service.dart';
import '../services/theme_service.dart';
import '../services/server_status_service.dart';
import '../util/partners_servers.dart';
import '../widgets/components/global_notice_banner.dart';

class LandingScreen extends StatefulWidget {
  final VoidCallback onGoToConnector;
  final VoidCallback onGoToSkins;
  final VoidCallback onGoToWiki;
  final VoidCallback onGoToPartners;
  final VoidCallback onGoToPlayerLookup;
  final VoidCallback? onGoToServerTracker;
  final VoidCallback? onWebsiteTap;
  final VoidCallback? onDiscordTap;
  final VoidCallback? onLanguageTap;
  final VoidCallback? onInfoTap;
  final Future<List<FeaturedServer>>? partnerServersFuture;
  final void Function(String ip, int port)? onPlayServer;

  const LandingScreen({
    super.key,
    required this.onGoToConnector,
    required this.onGoToSkins,
    required this.onGoToWiki,
    required this.onGoToPartners,
    required this.onGoToPlayerLookup,
    this.onGoToServerTracker,
    this.onWebsiteTap,
    this.onDiscordTap,
    this.onLanguageTap,
    this.onInfoTap,
    this.partnerServersFuture,
    this.onPlayServer,
  });

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  Map<String, String>? _notice;
  Timer? _noticeTimer;

  @override
  void initState() {
    super.initState();
    _fetchNotice();
    HomeCustomizationService.instance.addListener(_onCustomizationChanged);
  }

  @override
  void dispose() {
    _noticeTimer?.cancel();
    HomeCustomizationService.instance.removeListener(_onCustomizationChanged);
    super.dispose();
  }

  void _onCustomizationChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _fetchNotice() async {
    final notice = await NotificationService.fetchNotice();
    if (!mounted || notice == null) return;
    setState(() => _notice = notice);
    _noticeTimer = Timer(const Duration(seconds: 20), () {
      if (mounted) setState(() => _notice = null);
    });
  }

  VoidCallback _callbackFor(AppFeature feature) => switch (feature) {
    AppFeature.connector => widget.onGoToConnector,
    AppFeature.skins => widget.onGoToSkins,
    AppFeature.wiki => widget.onGoToWiki,
    AppFeature.partners => widget.onGoToPartners,
    AppFeature.lookup => widget.onGoToPlayerLookup,
    AppFeature.tracker => widget.onGoToServerTracker ?? widget.onGoToConnector,
  };

  void _openCustomize() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _CustomizeSheet(callbackFor: _callbackFor),
    );
  }

  @override
  Widget build(BuildContext context) {
    final svc = HomeCustomizationService.instance;
    final tiles = svc.tileOrder;
    final l = AppLocalizations.of(context)!;

    return Stack(
      children: [
        const Positioned.fill(child: _AuroraBackground()),

        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.partnerServersFuture != null) ...[
              const SizedBox(height: 6),
              _PartnerBanner(
                future: widget.partnerServersFuture!,
                onTap: widget.onGoToPartners,
                onPlay: widget.onPlayServer,
              ),
              const SizedBox(height: 12),
            ] else
              const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  _QuickNavChip(
                    iconWidget: const Icon(Icons.language_rounded, size: 16, color: AppTheme.textMuted),
                    label: l.website,
                    onTap: widget.onWebsiteTap,
                  ),
                  const SizedBox(width: 8),
                  _QuickNavChip(
                    iconWidget: const FaIcon(FontAwesomeIcons.discord, size: 15, color: AppTheme.textMuted),
                    label: 'Discord',
                    onTap: widget.onDiscordTap,
                  ),
                  const SizedBox(width: 8),
                  _QuickNavChip(
                    iconWidget: const Icon(Icons.translate_rounded, size: 16, color: AppTheme.textMuted),
                    label: l.changeLanguage,
                    onTap: widget.onLanguageTap,
                  ),
                  const SizedBox(width: 8),
                  _QuickNavChip(
                    iconWidget: const Icon(Icons.tune_rounded, size: 16, color: AppTheme.textMuted),
                    label: l.customizeLabel,
                    onTap: _openCustomize,
                  ),
                  const SizedBox(width: 8),
                  _QuickNavChip(
                    iconWidget: const Icon(Icons.info_outline_rounded, size: 16, color: AppTheme.textMuted),
                    label: l.info,
                    onTap: widget.onInfoTap,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 6),

            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 0, 14, 8),
                      child: Center(
                        child: _buildGrid(tiles),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (_notice != null)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GlobalNoticeBanner(
              message: _notice!['message']!,
              type: _notice!['type'] ?? 'info',
              onDismiss: () {
                _noticeTimer?.cancel();
                setState(() => _notice = null);
              },
            ),
          ),
      ],
    );
  }

  Widget _buildGrid(List<AppFeature> tiles) {
    final isDesktop = Theme.of(context).platform == TargetPlatform.macOS ||
        Theme.of(context).platform == TargetPlatform.windows ||
        Theme.of(context).platform == TargetPlatform.linux;
    final tileHeight = isDesktop ? 136.0 : 168.0;
    final rows = <Widget>[];
    for (var i = 0; i < tiles.length; i += 2) {
      if (i > 0) rows.add(const SizedBox(height: 10));
      final a = tiles[i];
      final b = i + 1 < tiles.length ? tiles[i + 1] : null;
      final rowIndex = i ~/ 2;
      rows.add(
        SizedBox(
          height: tileHeight,
          child: Row(
            children: [
              Expanded(
                child: _QuickCard(
                  feature: a,
                  onTap: _callbackFor(a),
                  animationDelay: Duration(milliseconds: rowIndex * 80),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: b != null
                    ? _QuickCard(
                        feature: b,
                        onTap: _callbackFor(b),
                        animationDelay: Duration(milliseconds: rowIndex * 80 + 50),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      );
    }
    return Column(mainAxisSize: MainAxisSize.min, children: rows);
  }
}

class _PartnerBanner extends StatefulWidget {
  final Future<List<FeaturedServer>> future;
  final VoidCallback onTap;
  final void Function(String ip, int port)? onPlay;
  const _PartnerBanner({
    required this.future,
    required this.onTap,
    this.onPlay,
  });

  @override
  State<_PartnerBanner> createState() => _PartnerBannerState();
}

class _PartnerBannerState extends State<_PartnerBanner> {
  List<FeaturedServer> _servers = [];
  final Map<String, bool?> _statusCache = {};
  int _index = 0;
  Timer? _rotateTimer;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    widget.future.then((all) {
      final featured = all.where((s) => s.featured).toList();
      if (!mounted) return;
      setState(() {
        _servers = featured;
        _loaded = true;
      });
      if (featured.isEmpty) return;
      for (var i = 0; i < featured.length; i++) {
        Future.delayed(Duration(milliseconds: i * 200), () {
          if (mounted) _fetchStatus(featured[i]);
        });
      }
      _startRotation();
    });
  }

  @override
  void dispose() {
    _rotateTimer?.cancel();
    super.dispose();
  }

  void _startRotation() {
    _rotateTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted || _servers.isEmpty) return;
      setState(() => _index = (_index + 1) % _servers.length);
    });
  }

  Future<void> _fetchStatus(FeaturedServer s) async {
    final result = await ServerStatusService.getStatus(s.address, s.port);
    if (mounted) setState(() => _statusCache[s.address] = result.isOnline);
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) return const _PartnerBannerSkeleton();
    if (_servers.isEmpty) return const SizedBox();
    final s = _servers[_index];
    final online = _statusCache[s.address];
    final dotColor = online == null
        ? AppTheme.textDisabled
        : online
        ? AppTheme.success
        : AppTheme.error;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(14, 6, 14, 0),
        constraints: const BoxConstraints(minHeight: 90),
        decoration: BoxDecoration(
          color: AppTheme.surfaceRaised,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Container(width: 3, color: AppTheme.accent),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.circle, color: dotColor, size: 8),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        transitionBuilder: (child, anim) => FadeTransition(
                          opacity: anim,
                          child: SlideTransition(
                            position: Tween(
                              begin: const Offset(0, 0.3),
                              end: Offset.zero,
                            ).animate(anim),
                            child: child,
                          ),
                        ),
                        child: Column(
                          key: ValueKey(_index),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              s.name,
                              style: const TextStyle(
                                color: AppTheme.textPrimary,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              s.description,
                              style: const TextStyle(
                                color: AppTheme.textMuted,
                                fontSize: 11,
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: List.generate(
                                _servers.length,
                                (i) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.only(right: 4),
                                  width: i == _index ? 12 : 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: i == _index
                                        ? AppTheme.accent
                                        : AppTheme.borderLight,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (widget.onPlay != null)
                      GestureDetector(
                        onTap: () => widget.onPlay!(s.address, s.port),
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: AppTheme.accent.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppTheme.accent.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: AppTheme.accent,
                            size: 22,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PartnerBannerSkeleton extends StatefulWidget {
  const _PartnerBannerSkeleton();
  @override
  State<_PartnerBannerSkeleton> createState() => _PartnerBannerSkeletonState();
}

class _PartnerBannerSkeletonState extends State<_PartnerBannerSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) {
        final shimmer = Color.lerp(
          AppTheme.surfaceRaised,
          AppTheme.borderLight,
          _anim.value,
        )!;
        return Container(
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: shimmer,
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }
}

class _QuickNavChip extends StatefulWidget {
  final Widget iconWidget;
  final String label;
  final VoidCallback? onTap;

  const _QuickNavChip({
    required this.iconWidget,
    required this.label,
    this.onTap,
  });

  @override
  State<_QuickNavChip> createState() => _QuickNavChipState();
}

class _QuickNavChipState extends State<_QuickNavChip> {
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

class _QuickCard extends StatefulWidget {
  final AppFeature feature;
  final VoidCallback onTap;
  final Duration animationDelay;

  const _QuickCard({
    required this.feature,
    required this.onTap,
    this.animationDelay = Duration.zero,
  });

  @override
  State<_QuickCard> createState() => _QuickCardState();
}

class _QuickCardState extends State<_QuickCard>
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
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _entranceCtrl, curve: Curves.easeOutCubic));

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
    final isDesktop = Theme.of(context).platform == TargetPlatform.macOS ||
        Theme.of(context).platform == TargetPlatform.windows ||
        Theme.of(context).platform == TargetPlatform.linux;
    final imgSize   = isDesktop ? 42.0 : 64.0;
    final glowExtra = isDesktop ? 12.0 : 18.0;
    final vPad      = isDesktop ? 8.0  : 10.0;
    final gap1      = isDesktop ? 6.0  : 8.0;
    final gap2      = isDesktop ? 2.0  : 3.0;

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
                    style: const TextStyle(
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
                    style: const TextStyle(
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

class _CustomizeSheet extends StatefulWidget {
  final VoidCallback Function(AppFeature) callbackFor;
  const _CustomizeSheet({required this.callbackFor});

  @override
  State<_CustomizeSheet> createState() => _CustomizeSheetState();
}

class _CustomizeSheetState extends State<_CustomizeSheet> {
  late List<AppFeature> _order;
  late AppFeature _navLeft;
  late AppFeature _navRight;
  late AccentPreset _accent;
  late BgPreset _bg;
  late double _opacity;
  late CardPreset _card;
  late double _cardOpacity;

  @override
  void initState() {
    super.initState();
    final svc = HomeCustomizationService.instance;
    _order = List.from(svc.tileOrder);
    _navLeft = svc.navLeft;
    _navRight = svc.navRight;
    _accent = ThemeService.instance.accent;
    _bg = ThemeService.instance.bg;
    _opacity = ThemeService.instance.opacity;
    _card = ThemeService.instance.card;
    _cardOpacity = ThemeService.instance.cardOpacity;
  }

  Future<void> _save() async {
    final svc = HomeCustomizationService.instance;
    await Future.wait([
      svc.saveTileOrder(_order),
      svc.saveNavLeft(_navLeft),
      svc.saveNavRight(_navRight),
      ThemeService.instance.saveAll(),
    ]);
    if (mounted) Navigator.of(context).pop();
  }

  Future<void> _reset() async {
    await HomeCustomizationService.instance.reset();
    await ThemeService.instance.reset();
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final maxH = MediaQuery.of(context).size.height * 0.92;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxH),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          border: Border(top: BorderSide(color: AppTheme.borderGray)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: AppTheme.borderLight,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
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
                          style: const TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          l.customizeSubtitle,
                          style: const TextStyle(
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
                      style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 13,
                      ),
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
                      style: const TextStyle(
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
                        return _TileRow(
                          key: ValueKey(f),
                          feature: f,
                          index: i + 1,
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    Text(
                      l.navigationSection,
                      style: const TextStyle(
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
                    _NavEditor(
                      label: l.leftSlot,
                      selected: _navLeft,
                      onChanged: (f) => setState(() => _navLeft = f),
                    ),
                    const SizedBox(height: 10),
                    _NavEditor(
                      label: l.rightSlot,
                      selected: _navRight,
                      onChanged: (f) => setState(() => _navRight = f),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      children: [
                        Text(
                          l.accentColorSection,
                          style: const TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: _accent.color.withValues(alpha: _opacity),
                            shape: BoxShape.circle,
                            border: Border.all(color: AppTheme.borderLight),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 7,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: accentPresets.map((p) {
                        final isSelected = p.id == _accent.id;
                        return GestureDetector(
                          onTap: () {
                            setState(() => _accent = p);
                            ThemeService.instance.setAccentLive(p);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            decoration: BoxDecoration(
                              color: p.color.withValues(alpha: _opacity),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.transparent,
                                width: 2.5,
                              ),
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: p.color.withValues(alpha: 0.4),
                                        blurRadius: 8,
                                        spreadRadius: 0,
                                      ),
                                    ]
                                  : null,
                            ),
                            child: isSelected
                                ? const Icon(
                                    Icons.check_rounded,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                : null,
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Text(
                          l.opacityLabel,
                          style: const TextStyle(
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

                    Row(
                      children: [
                        Text(
                          l.backgroundSection,
                          style: const TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: _bg.tint,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppTheme.borderLight),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 7,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: bgPresets.map((p) {
                        final isSelected = p.id == _bg.id;
                        return GestureDetector(
                          onTap: () {
                            setState(() => _bg = p);
                            ThemeService.instance.setBgLive(p);
                          },
                          child: Tooltip(
                            message: p.label,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [p.tint.withValues(alpha: 0.7), p.base],
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.white
                                      : AppTheme.borderGray,
                                  width: isSelected ? 2.5 : 1.5,
                                ),
                                boxShadow: isSelected
                                    ? [
                                        const BoxShadow(
                                          color: Colors.white24,
                                          blurRadius: 8,
                                        ),
                                      ]
                                    : null,
                              ),
                              child: isSelected
                                  ? const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  : null,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      children: [
                        Text(
                          l.cardsSection,
                          style: const TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: _card.color.withValues(alpha: _cardOpacity),
                            shape: BoxShape.circle,
                            border: Border.all(color: AppTheme.borderLight),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 7,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: cardPresets.map((p) {
                        final isSelected = p.id == _card.id;
                        return GestureDetector(
                          onTap: () {
                            setState(() => _card = p);
                            ThemeService.instance.setCardLive(p);
                          },
                          child: Tooltip(
                            message: p.label,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              decoration: BoxDecoration(
                                color: p.color.withValues(alpha: _cardOpacity),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.white
                                      : AppTheme.borderGray,
                                  width: isSelected ? 2.5 : 1.5,
                                ),
                                boxShadow: isSelected
                                    ? [
                                        const BoxShadow(
                                          color: Colors.white24,
                                          blurRadius: 8,
                                        ),
                                      ]
                                    : null,
                              ),
                              child: isSelected
                                  ? const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  : null,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Text(
                          l.opacityLabel,
                          style: const TextStyle(
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TileRow extends StatelessWidget {
  final AppFeature feature;
  final int index;
  const _TileRow({super.key, required this.feature, required this.index});

  @override
  Widget build(BuildContext context) {
    final color = Color(feature.colorValue);
    final l = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                feature.imagePath,
                width: 18,
                height: 18,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              feature.label(l),
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ReorderableDragStartListener(
            index: index - 1,
            child: const Icon(
              Icons.drag_handle_rounded,
              color: AppTheme.textMuted,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavEditor extends StatelessWidget {
  final String label;
  final AppFeature selected;
  final void Function(AppFeature) onChanged;

  const _NavEditor({
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
            style: const TextStyle(
              color: AppTheme.textMuted,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: options.map((f) {
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
                    borderRadius: BorderRadius.circular(8),
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
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _AuroraBackground extends StatefulWidget {
  const _AuroraBackground();

  @override
  State<_AuroraBackground> createState() => _AuroraBackgroundState();
}

class _AuroraBackgroundState extends State<_AuroraBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accent = AppTheme.accent;
    final hsl = HSLColor.fromColor(accent);
    final colorA = accent;
    final colorB = hsl.withHue((hsl.hue + 40) % 360).toColor();
    final colorC = hsl
        .withHue((hsl.hue + 200) % 360)
        .withSaturation(0.6)
        .toColor();

    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) => RepaintBoundary(
        child: CustomPaint(
          painter: _AuroraPainter(
            t: _ctrl.value,
            colorA: colorA,
            colorB: colorB,
            colorC: colorC,
          ),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class _AuroraPainter extends CustomPainter {
  final double t;
  final Color colorA;
  final Color colorB;
  final Color colorC;

  const _AuroraPainter({
    required this.t,
    required this.colorA,
    required this.colorB,
    required this.colorC,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    const pi2 = math.pi * 2;

    final blobs = [
      (
        color: colorA,
        cx: w * 0.15 + w * 0.35 * math.sin(pi2 * (t * 0.7 + 0.0)),
        cy: h * 0.08 + h * 0.18 * math.sin(pi2 * (t * 0.5 + 0.1)),
        radius: w * 0.65,
        opacity: 0.09,
      ),
      (
        color: colorB,
        cx: w * 0.75 + w * 0.25 * math.sin(pi2 * (t * 0.6 + 0.4)),
        cy: h * 0.72 + h * 0.20 * math.sin(pi2 * (t * 0.8 + 0.6)),
        radius: w * 0.60,
        opacity: 0.08,
      ),
      (
        color: colorC,
        cx: w * 0.50 + w * 0.20 * math.sin(pi2 * (t * 0.4 + 0.8)),
        cy: h * 0.45 + h * 0.15 * math.sin(pi2 * (t * 0.55 + 0.3)),
        radius: w * 0.45,
        opacity: 0.055,
      ),
    ];

    for (final b in blobs) {
      final paint = Paint()
        ..shader = RadialGradient(
          colors: [
            b.color.withValues(alpha: b.opacity),
            b.color.withValues(alpha: 0.0),
          ],
        ).createShader(
          Rect.fromCircle(center: Offset(b.cx, b.cy), radius: b.radius),
        );
      canvas.drawCircle(Offset(b.cx, b.cy), b.radius, paint);
    }
  }

  @override
  bool shouldRepaint(_AuroraPainter old) =>
      old.t != t ||
      old.colorA != colorA ||
      old.colorB != colorB ||
      old.colorC != colorC;
}
