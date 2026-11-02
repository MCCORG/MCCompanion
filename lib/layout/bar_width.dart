import 'package:flutter/widgets.dart';

const double kDesktopBarWidth = 760;

class BarWidth extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const BarWidth({
    super.key,
    required this.child,
    this.maxWidth = kDesktopBarWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
