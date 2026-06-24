import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ProfileAvatar extends StatelessWidget {
  final String initials;
  final double size;
  final String? avatarUrl;
  const ProfileAvatar({super.key, required this.initials, required this.size, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    final hasImage = avatarUrl != null && avatarUrl!.isNotEmpty;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppTheme.accent.withValues(alpha: 0.15),
        shape: BoxShape.circle,
        border: Border.all(color: AppTheme.accent.withValues(alpha: 0.30)),
      ),
      child: ClipOval(
        child: hasImage
            ? Image.network(
                avatarUrl!,
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, stack) => Center(
                  child: Text(
                    initials,
                    style: TextStyle(
                      color: AppTheme.accent,
                      fontSize: size * 0.33,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            : Center(
                child: Text(
                  initials,
                  style: TextStyle(
                    color: AppTheme.accent,
                    fontSize: size * 0.33,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
      ),
    );
  }
}

class ProfileSmallBtn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  const ProfileSmallBtn({super.key, required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.30)),
        ),
        child: Icon(icon, color: color, size: 16),
      ),
    );
  }
}

class ProfileIconBtn extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  const ProfileIconBtn({super.key, required this.icon, required this.tooltip, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: AppTheme.accent.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.accent.withValues(alpha: 0.25)),
          ),
          child: Icon(icon, color: AppTheme.accent, size: 18),
        ),
      ),
    );
  }
}

class ProfileSectionLabel extends StatelessWidget {
  final String text;
  const ProfileSectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      color: AppTheme.textMuted,
      fontSize: 10,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.4,
    ),
  );
}

class ProfileSectionHeader extends StatelessWidget {
  final String title;
  const ProfileSectionHeader(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        color: AppTheme.textMuted,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
      ),
    );
  }
}

class ProfileFieldLabel extends StatelessWidget {
  final String text;
  const ProfileFieldLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      color: AppTheme.textSecondary,
      fontSize: 11,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.4,
    ),
  );
}

class ProfileLoadingBody extends StatelessWidget {
  const ProfileLoadingBody({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: CircularProgressIndicator(color: AppTheme.accent, strokeWidth: 2),
  );
}

class ProfileEmptyBody extends StatelessWidget {
  final IconData icon;
  final String message;
  final String sub;
  const ProfileEmptyBody({super.key, required this.icon, required this.message, required this.sub});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppTheme.textDisabled, size: 40),
          const SizedBox(height: 12),
          Text(
            message,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            sub,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
