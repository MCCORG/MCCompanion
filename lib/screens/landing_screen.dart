import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/notification_service.dart';
import '../services/home_customization_service.dart';
import '../services/theme_service.dart';
import '../services/server_status_service.dart';
import '../util/partners_servers.dart';
import '../widgets/components/header_nav_bar.dart';
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

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Builder(
                builder: (context) {
                  final l = AppLocalizations.of(context)!;
                  return Align(
                    alignment: Alignment.centerRight,
                    child: HeaderNavBar(
                      items: [
                        HeaderNavItem(
                          label: l.website,
                          onTap: widget.onWebsiteTap,
                        ),
                        HeaderNavItem(
                          label: l.discord,
                          onTap: widget.onDiscordTap,
                        ),
                        HeaderNavItem(
                          label: l.changeLanguage,
                          onTap: widget.onLanguageTap,
                        ),
                        HeaderNavItem(
                          label: l.customizeLabel,
                          onTap: _openCustomize,
                        ),
                        HeaderNavItem(label: l.info, onTap: widget.onInfoTap),
                      ],
                    ),
                  );
                },
              ),
            ),
            if (widget.partnerServersFuture != null) ...[
              _PartnerBanner(
                future: widget.partnerServersFuture!,
                onTap: widget.onGoToPartners,
                onPlay: widget.onPlayServer,
              ),
              const SizedBox(height: 10),
            ],
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 16,
                        ),
                        child: _buildGrid(tiles),
                      ),
                    ),
                  ),
                ],
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
    final rows = <Widget>[];
    for (var i = 0; i < tiles.length; i += 2) {
      if (i > 0) rows.add(const SizedBox(height: 10));
      final a = tiles[i];
      final b = i + 1 < tiles.length ? tiles[i + 1] : null;
      rows.add(
        SizedBox(
          height: 158,
          child: Row(
            children: [
              Expanded(
                child: _QuickCard(feature: a, onTap: _callbackFor(a)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: b != null
                    ? _QuickCard(feature: b, onTap: _callbackFor(b))
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

  @override
  void initState() {
    super.initState();
    widget.future.then((all) {
      final featured = all.where((s) => s.featured).toList();
      if (!mounted || featured.isEmpty) return;
      setState(() => _servers = featured);
      for (final s in featured) _fetchStatus(s);
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
        decoration: BoxDecoration(
          color: AppTheme.surfaceRaised,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Container(width: 3, color: AppTheme.accent),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 8, 10),
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
                            color: AppTheme.accent.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppTheme.accent.withOpacity(0.3),
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

class _QuickCard extends StatefulWidget {
  final AppFeature feature;
  final VoidCallback onTap;

  const _QuickCard({required this.feature, required this.onTap});

  @override
  State<_QuickCard> createState() => _QuickCardState();
}

class _QuickCardState extends State<_QuickCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final color = Color(widget.feature.colorValue);
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedOpacity(
        opacity: _pressed ? 0.65 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: AppTheme.surfaceRaised,
            borderRadius: BorderRadius.circular(16),
            border: Border(
              top: BorderSide(color: color.withOpacity(0.55), width: 2),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.feature.imagePath,
                width: 64,
                height: 64,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 8),
              Text(
                widget.feature.label,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                widget.feature.subtitle(null),
                style: const TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 11,
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
                            color: _accent.color.withOpacity(_opacity),
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
                              color: p.color.withOpacity(_opacity),
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
                                        color: p.color.withOpacity(0.4),
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
                            color: _accent.color.withOpacity(_opacity),
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
                        activeTrackColor: _accent.color.withOpacity(_opacity),
                        inactiveTrackColor: AppTheme.borderGray,
                        thumbColor: _accent.color.withOpacity(_opacity),
                        overlayColor: _accent.color.withOpacity(0.15),
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
                                  colors: [p.tint.withOpacity(0.7), p.base],
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
                            color: _card.color.withOpacity(_cardOpacity),
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
                                color: p.color.withOpacity(_cardOpacity),
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
                        activeTrackColor: _card.color.withOpacity(0.7),
                        inactiveTrackColor: AppTheme.borderGray,
                        thumbColor: _card.color,
                        overlayColor: _card.color.withOpacity(0.15),
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
              color: color.withOpacity(0.12),
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
              feature.label,
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
                        ? color.withOpacity(0.15)
                        : AppTheme.surfaceLight,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? color : AppTheme.borderGray,
                    ),
                  ),
                  child: Text(
                    f.label,
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
