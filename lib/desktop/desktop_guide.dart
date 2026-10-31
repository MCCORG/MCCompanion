import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../design/design.dart';
import '../layout/bar_inset.dart';

class DesktopGuideTopic {
  final String id;
  final String title;
  final String subtitle;
  final FaIconData icon;
  final IconData rowIcon;
  final Color color;
  final WidgetBuilder content;

  const DesktopGuideTopic({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.rowIcon,
    required this.color,
    required this.content,
  });
}

class DesktopGuideScreen extends StatefulWidget {
  static const double splitWidth = 760;
  static const double listWidth = 280;
  static const double articleWidth = 720;

  final String title;
  final List<DesktopGuideTopic> topics;
  final String? selectedId;
  final Widget? listFooter;
  final WidgetBuilder narrow;

  const DesktopGuideScreen({
    super.key,
    required this.title,
    required this.topics,
    required this.narrow,
    this.selectedId,
    this.listFooter,
  });

  @override
  State<DesktopGuideScreen> createState() => _DesktopGuideScreenState();
}

class _DesktopGuideScreenState extends State<DesktopGuideScreen> {
  late String _selected = widget.selectedId ?? widget.topics.first.id;

  @override
  void didUpdateWidget(covariant DesktopGuideScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    final id = widget.selectedId;
    if (id != null && id != oldWidget.selectedId) _selected = id;
  }

  DesktopGuideTopic get _topic => widget.topics.firstWhere(
    (topic) => topic.id == _selected,
    orElse: () => widget.topics.first,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < DesktopGuideScreen.splitWidth) {
          return widget.narrow(context);
        }
        final topic = _topic;
        return Row(
          children: [
            Container(
              width: DesktopGuideScreen.listWidth,
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: DsColor.line)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DsHeader(title: widget.title),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(
                        DsSpace.md,
                        0,
                        DsSpace.md,
                        DsSpace.md,
                      ),
                      children: [
                        for (final item in widget.topics)
                          _TopicTile(
                            topic: item,
                            active: item.id == topic.id,
                            onTap: () => setState(() => _selected = item.id),
                          ),
                      ],
                    ),
                  ),
                  if (widget.listFooter != null)
                    Padding(
                      padding: const EdgeInsets.all(DsSpace.md),
                      child: widget.listFooter,
                    ),
                ],
              ),
            ),
            Expanded(child: _article(context, topic)),
          ],
        );
      },
    );
  }

  Widget _article(BuildContext context, DesktopGuideTopic topic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DsHeader(
          title: topic.title,
          subtitle: topic.subtitle,
          actions: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: topic.color.withValues(alpha: 0.14),
                borderRadius: DsRadius.controlR,
              ),
              child: FaIcon(topic.icon, size: 15, color: topic.color),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              DsSpace.gutter,
              0,
              DsSpace.gutter,
              DsSpace.xxxl + BarInset.of(context),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: DesktopGuideScreen.articleWidth,
                ),
                child: topic.content(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TopicTile extends StatelessWidget {
  final DesktopGuideTopic topic;
  final bool active;
  final VoidCallback onTap;

  const _TopicTile({
    required this.topic,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DsSpace.xs),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: DsRadius.controlR,
          child: AnimatedContainer(
            duration: DsDuration.fast,
            padding: const EdgeInsets.all(DsSpace.md),
            decoration: BoxDecoration(
              color: active
                  ? DsColor.accent.withValues(alpha: 0.14)
                  : Colors.transparent,
              borderRadius: DsRadius.controlR,
            ),
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: topic.color.withValues(alpha: 0.14),
                    borderRadius: DsRadius.controlR,
                  ),
                  child: Icon(topic.rowIcon, size: 18, color: topic.color),
                ),
                const SizedBox(width: DsSpace.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        topic.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: DsType.bodyStrong.copyWith(
                          color: active ? DsColor.text : DsColor.textSoft,
                        ),
                      ),
                      Text(
                        topic.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: DsType.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
