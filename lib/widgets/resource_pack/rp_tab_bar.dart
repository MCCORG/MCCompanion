import 'package:flutter/material.dart';

import '../../design/design.dart';
import '../../l10n/app_localizations.dart';

enum RpInputMode { browse, upload, merge }

class RpTabBar extends StatelessWidget {
  final RpInputMode mode;
  final ValueChanged<RpInputMode> onSelect;

  const RpTabBar({super.key, required this.mode, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return DsSegmented<RpInputMode>(
      value: mode,
      onChanged: onSelect,
      options: [
        DsOption(
          value: RpInputMode.browse,
          label: l.rpBrowseTab,
          icon: Icons.explore_rounded,
        ),
        DsOption(
          value: RpInputMode.upload,
          label: l.rpUploadTab,
          icon: Icons.upload_rounded,
        ),
        DsOption(
          value: RpInputMode.merge,
          label: l.rpMergerTitle,
          icon: Icons.merge_rounded,
        ),
      ],
    );
  }
}
