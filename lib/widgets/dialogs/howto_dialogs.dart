import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../../models/bot_model.dart';
import '../../services/bot_service.dart';
import '../../theme/app_theme.dart';
import '../components/app_toast.dart';

class HowToDialogs {
  static Future<void> showXboxInstructions(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return _showSheet(
      context,
      icon: FontAwesomeIcons.xbox,
      color: AppTheme.modeXbox,
      title: loc.howToXboxTitle,
      subtitle: loc.howToXboxSubtitle,
      body: loc.howToXboxBody,
    );
  }

  static Future<void> showNintendoInstructions(
    BuildContext context, {
    String? relayName,
    String? relayIp,
  }) {
    final loc = AppLocalizations.of(context)!;
    return _showSheet(
      context,
      icon: FontAwesomeIcons.gamepad,
      color: AppTheme.modeNintendo,
      title: loc.howToNintendoTitle,
      subtitle: loc.howToNintendoSubtitle,
      body: loc.playInstructionsSwitch(relayName ?? '-', relayIp ?? '-'),
    );
  }

  static Future<void> showFriendsInstructions(
    BuildContext context, {
    String? userRegion,
  }) {
    final loc = AppLocalizations.of(context)!;
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _FriendsSheet(
        color: AppTheme.modeFriends,
        title: loc.howToFriendsTitle,
        subtitle: loc.howToFriendsSubtitle,
        userRegion: userRegion,
      ),
    );
  }

  static Future<void> showJavaInstructions(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return _showSheet(
      context,
      icon: FontAwesomeIcons.java,
      color: AppTheme.modeJava,
      title: loc.howToJavaTitle,
      subtitle: loc.howToJavaSubtitle,
      body: loc.howToJavaBody,
    );
  }

  static Future<void> _showSheet(
    BuildContext context, {
    required FaIconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required String body,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _InstructionSheet(
        icon: icon,
        color: color,
        title: title,
        subtitle: subtitle,
        body: body,
      ),
    );
  }
}

class _InstructionSheet extends StatelessWidget {
  final FaIconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String body;

  const _InstructionSheet({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final maxH = MediaQuery.of(context).size.height * 0.88;
    final bottom = MediaQuery.of(context).padding.bottom;

    return Container(
      constraints: BoxConstraints(maxHeight: maxH),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _DragHandle(color: color),
          _SheetHeader(icon: icon, color: color, title: title, subtitle: subtitle),
          const Divider(height: 1, color: AppTheme.borderDim),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: StepContent(body: body, color: color),
            ),
          ),
          Container(
            color: AppTheme.surface,
            padding: EdgeInsets.fromLTRB(16, 10, 16, 14 + bottom),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.check_rounded, size: 18),
                label: Text(
                  loc.iUnderstand,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FriendsSheet extends StatefulWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String? userRegion;

  const _FriendsSheet({
    required this.color,
    required this.title,
    required this.subtitle,
    this.userRegion,
  });

  @override
  State<_FriendsSheet> createState() => _FriendsSheetState();
}

class _FriendsSheetState extends State<_FriendsSheet> {
  BotRegionData? _bots;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    BotService.fetchAllBots().then((data) {
      if (mounted) setState(() { _bots = data; _loading = false; });
    }).catchError((_) {
      if (mounted) setState(() { _loading = false; });
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final color = widget.color;
    final maxH = MediaQuery.of(context).size.height * 0.88;
    final bottom = MediaQuery.of(context).padding.bottom;

    return Container(
      constraints: BoxConstraints(maxHeight: maxH),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _DragHandle(color: color),
          _SheetHeader(
            icon: FontAwesomeIcons.userGroup,
            color: color,
            title: widget.title,
            subtitle: widget.subtitle,
          ),
          const Divider(height: 1, color: AppTheme.borderDim),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StepCard(number: 1, text: 'Open the Xbox app on your phone or console.', color: color),
                  const SizedBox(height: 8),
                  _StepCard(number: 2, text: 'Add one of the bots below as a friend on Xbox.', color: color),
                  const SizedBox(height: 12),
                  if (_loading)
                    const Center(child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: CircularProgressIndicator(),
                    ))
                  else if (_bots == null || (_bots!.eu.isEmpty && _bots!.us.isEmpty))
                    _NoteBubble(text: '⚠️ Could not load bot list. Try again later.', color: color)
                  else ...[
                    _BotRegionSection(flag: '🇪🇺', regionLabel: 'Europe', bots: _bots!.eu, color: color, isUserRegion: widget.userRegion == 'eu'),
                    const SizedBox(height: 10),
                    _BotRegionSection(flag: '🇺🇸', regionLabel: 'United States', bots: _bots!.us, color: color, isUserRegion: widget.userRegion == 'us'),
                  ],
                  const SizedBox(height: 12),
                  _StepCard(number: 3, text: 'Open Minecraft and go to the Friends tab.', color: color),
                  const SizedBox(height: 8),
                  _StepCard(number: 4, text: 'Look for your server under LAN Worlds and join.', color: color),
                  const SizedBox(height: 12),
                  _NoteBubble(
                    text: '⚠️ Every time you want to play, you need to start Friends mode in the MCCompanion app first. Keep the app open while playing.',
                    color: color,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          Container(
            color: AppTheme.surface,
            padding: EdgeInsets.fromLTRB(16, 10, 16, 14 + bottom),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  elevation: 0,
                ),
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.check_rounded, size: 18),
                label: Text(loc.iUnderstand, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DragHandle extends StatelessWidget {
  final Color color;
  const _DragHandle({required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _SheetHeader extends StatelessWidget {
  final FaIconData icon;
  final Color color;
  final String title;
  final String subtitle;

  const _SheetHeader({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: color.withValues(alpha: 0.35)),
            ),
            child: Center(child: FaIcon(icon, color: color, size: 20)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: color.withValues(alpha: 0.85),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppTheme.surfaceRaised,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppTheme.borderGray),
              ),
              child: const Icon(Icons.close_rounded, size: 16, color: AppTheme.textMuted),
            ),
          ),
        ],
      ),
    );
  }
}

class StepContent extends StatelessWidget {
  final String body;
  final Color color;

  const StepContent({super.key, required this.body, required this.color});

  @override
  Widget build(BuildContext context) {
    final lines = body.split('\n');
    final widgets = <Widget>[];

    for (final raw in lines) {
      final line = raw.trim();

      if (line.isEmpty) {
        widgets.add(const SizedBox(height: 4));
        continue;
      }

      final stepMatch = RegExp(r'^(\d+)\.\s+(.+)$').firstMatch(line);
      if (stepMatch != null) {
        widgets.add(_StepCard(
          number: int.parse(stepMatch.group(1)!),
          text: stepMatch.group(2)!,
          color: color,
        ));
        widgets.add(const SizedBox(height: 8));
        continue;
      }

      if (line.startsWith('- ') || line.startsWith('– ') || line.startsWith('• ')) {
        widgets.add(_BulletCard(text: line.substring(2), color: color));
        widgets.add(const SizedBox(height: 6));
        continue;
      }

      if (line.endsWith(':') ||
          (line == line.toUpperCase() && line.length > 2 && !line.contains('.'))) {
        widgets.add(_SectionHeader(text: line, color: color));
        widgets.add(const SizedBox(height: 8));
        continue;
      }

      if (line.startsWith('⚠️') || line.startsWith('✅') ||
          line.startsWith('📱') || line.startsWith('🔄')) {
        widgets.add(_NoteBubble(text: line, color: color));
        widgets.add(const SizedBox(height: 8));
        continue;
      }

      widgets.add(Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppTheme.borderDim),
        ),
        child: Text(line, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13, height: 1.65)),
      ));
      widgets.add(const SizedBox(height: 8));
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: widgets);
  }
}

class _StepCard extends StatelessWidget {
  final int number;
  final String text;
  final Color color;

  const _StepCard({required this.number, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.18)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.18),
              shape: BoxShape.circle,
              border: Border.all(color: color.withValues(alpha: 0.40)),
            ),
            child: Center(
              child: Text('$number', style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w700)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(text, style: const TextStyle(color: AppTheme.textPrimary, fontSize: 14, height: 1.55)),
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletCard extends StatelessWidget {
  final String text;
  final Color color;
  const _BulletCard({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.borderDim),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(color: color.withValues(alpha: 0.65), shape: BoxShape.circle),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13, height: 1.60)),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String text;
  final Color color;
  const _SectionHeader({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 16,
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.1),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _NoteBubble extends StatelessWidget {
  final String text;
  final Color color;
  const _NoteBubble({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    final isWarning = text.startsWith('⚠️');
    final bubbleColor = isWarning ? AppTheme.warning : AppTheme.success;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: bubbleColor.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: bubbleColor.withValues(alpha: 0.25)),
      ),
      child: Text(text, style: TextStyle(color: bubbleColor, fontSize: 13, height: 1.6, fontWeight: FontWeight.w500)),
    );
  }
}

class _BotRegionSection extends StatelessWidget {
  final String flag;
  final String regionLabel;
  final List<BotModel> bots;
  final Color color;
  final bool isUserRegion;

  const _BotRegionSection({
    required this.flag,
    required this.regionLabel,
    required this.bots,
    required this.color,
    required this.isUserRegion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isUserRegion ? color.withValues(alpha: 0.35) : AppTheme.borderGray,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
            child: Row(
              children: [
                Text(flag, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text(
                  regionLabel,
                  style: TextStyle(
                    color: isUserRegion ? color : AppTheme.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),
                if (isUserRegion) ...[
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text('YOUR REGION', style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.w700)),
                  ),
                ],
              ],
            ),
          ),
          const Divider(height: 1, color: AppTheme.borderDim),
          ...bots.map((bot) => _BotRow(bot: bot, color: color)),
        ],
      ),
    );
  }
}

class _BotRow extends StatelessWidget {
  final BotModel bot;
  final Color color;
  const _BotRow({required this.bot, required this.color});

  @override
  Widget build(BuildContext context) {
    final isOnline = bot.isOnline;
    final isFull = bot.isFull;
    final textColor = isOnline && !isFull ? AppTheme.textPrimary : AppTheme.textSecondary;
    final dotColor = isFull ? AppTheme.warning : (isOnline ? AppTheme.success : AppTheme.textSecondary);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 8, height: 8,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bot.gamertag, style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w600)),
                if (!isOnline)
                  Text('Offline', style: TextStyle(color: AppTheme.textSecondary.withValues(alpha: 0.6), fontSize: 11))
                else if (isFull)
                  Text('Full', style: const TextStyle(color: AppTheme.warning, fontSize: 11))
                else
                  Text('${bot.friendCount} / ${bot.maxFriends} friends', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11)),
              ],
            ),
          ),
          if (isOnline && !isFull)
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: bot.gamertag));
                AppToast.show(
                  context,
                  message: 'Copied ${bot.gamertag}',
                  icon: Icons.copy_rounded,
                  color: AppTheme.success,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: color.withValues(alpha: 0.25)),
                ),
                child: Text('Copy', style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
              ),
            ),
        ],
      ),
    );
  }
}

class InstructionPage extends StatelessWidget {
  final FaIconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String body;

  const InstructionPage({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.body,
  });

  @override
  Widget build(BuildContext context) => _InstructionSheet(
    icon: icon, color: color, title: title, subtitle: subtitle, body: body,
  );
}

class FriendsInstructionPage extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String? userRegion;

  const FriendsInstructionPage({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    this.userRegion,
  });

  @override
  Widget build(BuildContext context) => _FriendsSheet(
    color: color, title: title, subtitle: subtitle, userRegion: userRegion,
  );
}
