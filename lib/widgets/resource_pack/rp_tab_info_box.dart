import 'package:flutter/material.dart';

import '../../design/design.dart';

class RpTabInfoBox extends StatelessWidget {
  final String text;
  const RpTabInfoBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DsSpace.lg - 2,
        vertical: DsSpace.md - 1,
      ),
      decoration: BoxDecoration(
        color: DsColor.inset,
        borderRadius: DsRadius.controlR,
        border: Border.all(color: DsColor.line),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline_rounded, size: 16, color: DsColor.textFaint),
          const SizedBox(width: DsSpace.sm),
          Expanded(child: Text(text, style: DsType.caption)),
        ],
      ),
    );
  }
}
