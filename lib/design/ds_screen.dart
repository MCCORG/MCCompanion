import 'package:flutter/material.dart';

import 'ds_tokens.dart';

class DsHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final List<Widget> actions;

  const DsHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        DsSpace.gutter,
        DsSpace.md,
        DsSpace.gutter,
        DsSpace.lg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leading != null) ...[leading!, const SizedBox(width: DsSpace.md)],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: DsType.title),
                if (subtitle != null) ...[
                  const SizedBox(height: DsSpace.xxs),
                  Text(subtitle!, style: DsType.caption),
                ],
              ],
            ),
          ),
          for (final action in actions) ...[
            const SizedBox(width: DsSpace.sm),
            action,
          ],
        ],
      ),
    );
  }
}
