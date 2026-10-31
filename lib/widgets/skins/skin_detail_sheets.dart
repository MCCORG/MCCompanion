import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme/app_theme.dart';
import '../../models/saved_skin.dart';
import '../../theme/app_tokens.dart';

class SavedSkinMenuSheet extends StatelessWidget {
  final SavedSkin skin;
  final VoidCallback onExport;
  final VoidCallback onDelete;
  const SavedSkinMenuSheet({
    super.key,
    required this.skin,
    required this.onExport,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(top: BorderSide(color: AppTheme.borderGray)),
      ),
      padding: EdgeInsets.fromLTRB(
        24,
        16,
        24,
        32 + MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppTheme.borderLight,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Text(
            skin.name,
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          SkinMenuTile(
            icon: FontAwesomeIcons.shareFromSquare,
            label: AppLocalizations.of(context)!.skinMenuExport,
            color: AppTheme.textSecondary,
            onTap: onExport,
          ),
          SkinMenuTile(
            icon: FontAwesomeIcons.trash,
            label: AppLocalizations.of(context)!.skinMenuDelete,
            color: AppTheme.error,
            onTap: onDelete,
          ),
        ],
      ),
    );
  }
}

class SkinMenuTile extends StatelessWidget {
  final FaIconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  const SkinMenuTile({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.medium,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
        child: Row(
          children: [
            SizedBox(width: 28, child: FaIcon(icon, size: 15, color: color)),
            const SizedBox(width: 14),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
