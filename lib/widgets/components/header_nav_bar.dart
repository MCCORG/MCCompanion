import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class HeaderNavItem {
  final String label;
  final VoidCallback? onTap;
  const HeaderNavItem({required this.label, this.onTap});
}

class HeaderNavBar extends StatelessWidget {
  final List<HeaderNavItem> items;
  const HeaderNavBar({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface.withOpacity(0.60),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < items.length; i++) ...[
            if (i > 0)
              Container(
                width: 1,
                height: 12,
                color: AppTheme.borderGray,
              ),
            _HeaderNavButton(item: items[i]),
          ],
        ],
      ),
    );
  }
}

class _HeaderNavButton extends StatefulWidget {
  final HeaderNavItem item;
  const _HeaderNavButton({required this.item});

  @override
  State<_HeaderNavButton> createState() => _HeaderNavButtonState();
}

class _HeaderNavButtonState extends State<_HeaderNavButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.item.onTap?.call();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: _pressed
              ? AppTheme.surfaceRaised.withOpacity(0.80)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          widget.item.label,
          style: TextStyle(
            color: _pressed ? AppTheme.textPrimary : AppTheme.textMuted,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
