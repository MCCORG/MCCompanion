import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../theme/app_tokens.dart';

class AppSidebarEntry {
  final Widget icon;
  final String label;
  final VoidCallback? onTap;

  const AppSidebarEntry({required this.icon, required this.label, this.onTap});
}

class AppSidebarSection {
  final String title;
  final List<AppSidebarEntry> entries;

  const AppSidebarSection({required this.title, required this.entries});
}

class AppSidebar extends StatelessWidget {
  final List<AppSidebarSection> sections;

  const AppSidebar({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.surfaceRaisedSolid,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 22,
                  errorBuilder: (_, _, _) => Text(
                    'MCCompanion',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
              ),
            ),
            Divider(height: 1, thickness: 1, color: AppTheme.borderDim),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 6, bottom: 20),
                children: [
                  for (final section in sections) ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 6),
                      child: Text(
                        section.title,
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                    for (final entry in section.entries) _row(context, entry),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(BuildContext context, AppSidebarEntry entry) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: entry.onTap == null
            ? null
            : () {
                Navigator.of(context).pop();
                entry.onTap!();
              },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              SizedBox(
                width: 24,
                child: IconTheme(
                  data: IconThemeData(size: 17, color: AppTheme.textSecondary),
                  child: entry.icon,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  entry.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppTopBar extends StatelessWidget {
  final VoidCallback onMenu;
  final VoidCallback? onProfile;
  final bool profileActive;

  const AppTopBar({
    super.key,
    required this.onMenu,
    this.onProfile,
    this.profileActive = false,
  });

  static const double height = 48;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onMenu,
              borderRadius: AppRadius.rounded,
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: Icon(
                  Icons.menu_rounded,
                  size: 22,
                  color: AppTheme.textPrimary,
                ),
              ),
            ),
          ),
          const Spacer(),
          if (onProfile != null)
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onProfile,
                borderRadius: AppRadius.rounded,
                child: Padding(
                  padding: const EdgeInsets.all(11),
                  child: Icon(
                    Icons.person_rounded,
                    size: 22,
                    color: profileActive
                        ? AppTheme.brand
                        : AppTheme.textSecondary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
