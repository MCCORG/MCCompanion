import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AppSheet extends StatelessWidget {
  final VoidCallback onClose;
  final Widget child;
  final double maxHeightFactor;
  final Color? backgroundColor;

  const AppSheet({
    super.key,
    required this.onClose,
    required this.child,
    this.maxHeightFactor = 0.90,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * maxHeightFactor;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? AppTheme.background,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          border: const Border(top: BorderSide(color: AppTheme.borderGray)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onClose,
                behavior: HitTestBehavior.opaque,
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Container(
                      width: 36,
                      height: 4,
                      margin: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: AppTheme.borderLight,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
