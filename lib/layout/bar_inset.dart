import 'package:flutter/widgets.dart';

class BarInset extends InheritedWidget {
  final double bottom;

  const BarInset({super.key, required this.bottom, required super.child});

  static double of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<BarInset>()?.bottom ?? 0;

  static EdgeInsets pad(BuildContext context, EdgeInsets base) =>
      base.copyWith(bottom: base.bottom + of(context));

  @override
  bool updateShouldNotify(BarInset oldWidget) => bottom != oldWidget.bottom;
}
