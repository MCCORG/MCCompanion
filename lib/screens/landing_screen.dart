import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/notification_service.dart';
import '../services/home_customization_service.dart';
import '../widgets/components/update_banner.dart';
import '../util/partners_servers.dart';
import '../widgets/components/global_notice_banner.dart';
import '../widgets/featured_server_banner.dart';
import '../widgets/landing/landing_quick_card.dart';
import '../widgets/landing/landing_customize_sheet.dart';

class LandingScreen extends StatefulWidget {
  final VoidCallback onGoToConnector;
  final VoidCallback onGoToSkins;
  final VoidCallback onGoToPartners;
  final VoidCallback onGoToPlayerLookup;
  final VoidCallback? onGoToServerTracker;
  final VoidCallback? onGoToFeedback;
  final VoidCallback? onWebsiteTap;
  final VoidCallback? onDiscordTap;
  final VoidCallback? onLanguageTap;
  final VoidCallback? onInfoTap;
  final Future<List<FeaturedServer>>? partnerServersFuture;
  final void Function(String ip, int port)? onPlayServer;
  final TextEditingController? ipController;
  final TextEditingController? portController;

  const LandingScreen({
    super.key,
    required this.onGoToConnector,
    required this.onGoToSkins,
    required this.onGoToPartners,
    required this.onGoToPlayerLookup,
    this.onGoToServerTracker,
    this.onGoToFeedback,
    this.onWebsiteTap,
    this.onDiscordTap,
    this.onLanguageTap,
    this.onInfoTap,
    this.partnerServersFuture,
    this.onPlayServer,
    this.ipController,
    this.portController,
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
    _noticeTimer?.cancel();
    _noticeTimer = Timer(const Duration(seconds: 20), () {
      if (mounted) setState(() => _notice = null);
    });
  }

  VoidCallback _callbackFor(AppFeature feature) => switch (feature) {
    AppFeature.connector => widget.onGoToConnector,
    AppFeature.skins => widget.onGoToSkins,
    AppFeature.partners => widget.onGoToPartners,
    AppFeature.lookup => widget.onGoToPlayerLookup,
    AppFeature.tracker => widget.onGoToServerTracker ?? widget.onGoToConnector,
  };

  void _openCustomize() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LandingCustomizeSheet(callbackFor: _callbackFor),
    );
  }

  @override
  Widget build(BuildContext context) {
    final svc = HomeCustomizationService.instance;
    final tiles = svc.tileOrder;
    final l = AppLocalizations.of(context)!;

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const UpdateBanner(),

            if (widget.partnerServersFuture != null &&
                widget.ipController != null &&
                widget.portController != null) ...[
              FeaturedServerBanner(
                partnerServersFuture: widget.partnerServersFuture,
                ipController: widget.ipController!,
                portController: widget.portController!,
                onSelected: widget.onGoToConnector,
              ),
              const SizedBox(height: 12),
            ] else
              const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  LandingQuickNavChip(
                    iconWidget: Icon(
                      Icons.language_rounded,
                      size: 16,
                      color: AppTheme.textMuted,
                    ),
                    label: l.website,
                    onTap: widget.onWebsiteTap,
                  ),
                  const SizedBox(width: 8),
                  LandingQuickNavChip(
                    iconWidget: FaIcon(
                      FontAwesomeIcons.discord,
                      size: 15,
                      color: AppTheme.textMuted,
                    ),
                    label: l.discord,
                    onTap: widget.onDiscordTap,
                  ),
                  const SizedBox(width: 8),
                  LandingQuickNavChip(
                    iconWidget: Icon(
                      Icons.translate_rounded,
                      size: 16,
                      color: AppTheme.textMuted,
                    ),
                    label: l.changeLanguage,
                    onTap: widget.onLanguageTap,
                  ),
                  const SizedBox(width: 8),
                  LandingQuickNavChip(
                    iconWidget: Icon(
                      Icons.tune_rounded,
                      size: 16,
                      color: AppTheme.textMuted,
                    ),
                    label: l.customizeLabel,
                    onTap: _openCustomize,
                  ),
                  const SizedBox(width: 8),
                  LandingQuickNavChip(
                    iconWidget: Icon(
                      Icons.info_outline_rounded,
                      size: 16,
                      color: AppTheme.textMuted,
                    ),
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
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 0, 14, 8),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth > 700
                                ? 860
                                : double.infinity,
                          ),
                          child: _buildGrid(tiles),
                        ),
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
    final svc = HomeCustomizationService.instance;
    final hidden = svc.hiddenTiles;
    final wideTile = svc.wideTile;
    final visible = tiles.where((f) => !hidden.contains(f)).toList();

    final rows = <Widget>[];
    var rowIndex = 0;

    for (var i = 0; i < visible.length;) {
      if (rows.isNotEmpty) rows.add(const SizedBox(height: 10));
      final f = visible[i];
      if (f == wideTile) {
        rows.add(
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: LandingQuickCard(
                    feature: f,
                    onTap: _callbackFor(f),
                    animationDelay: Duration(milliseconds: rowIndex * 80),
                    wide: true,
                  ),
                ),
              ],
            ),
          ),
        );
        i++;
      } else {
        final b = (i + 1 < visible.length && visible[i + 1] != wideTile)
            ? visible[i + 1]
            : null;
        rows.add(
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: LandingQuickCard(
                    feature: f,
                    onTap: _callbackFor(f),
                    animationDelay: Duration(milliseconds: rowIndex * 80),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: b != null
                      ? LandingQuickCard(
                          feature: b,
                          onTap: _callbackFor(b),
                          animationDelay: Duration(
                            milliseconds: rowIndex * 80 + 50,
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        );
        i += b != null ? 2 : 1;
      }
      rowIndex++;
    }
    return Column(mainAxisSize: MainAxisSize.min, children: rows);
  }
}
