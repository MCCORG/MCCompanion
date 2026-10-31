import 'package:flutter/widgets.dart';

const double kDesktopUiScale = 0.88;

class UiScale extends StatelessWidget {
  final double scale;
  final Widget child;

  const UiScale({super.key, required this.scale, required this.child});

  @override
  Widget build(BuildContext context) {
    if (scale == 1) return child;
    final media = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final inner = Size(
          constraints.maxWidth / scale,
          constraints.maxHeight / scale,
        );
        return ClipRect(
          child: OverflowBox(
            alignment: Alignment.topLeft,
            minWidth: inner.width,
            maxWidth: inner.width,
            minHeight: inner.height,
            maxHeight: inner.height,
            child: Transform.scale(
              scale: scale,
              alignment: Alignment.topLeft,
              child: MediaQuery(
                data: media.copyWith(size: inner),
                child: SizedBox(
                  width: inner.width,
                  height: inner.height,
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
