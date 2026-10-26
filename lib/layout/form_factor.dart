import 'package:flutter/widgets.dart';

enum FormFactor { compact, medium, expanded }

class Breakpoints {
  static const double medium = 600;
  static const double expanded = 1000;
}

FormFactor formFactorForWidth(double width) {
  if (width >= Breakpoints.expanded) return FormFactor.expanded;
  if (width >= Breakpoints.medium) return FormFactor.medium;
  return FormFactor.compact;
}

extension FormFactorContext on BuildContext {
  FormFactor get formFactor =>
      formFactorForWidth(MediaQuery.sizeOf(this).width);
}

class FormFactorBuilder extends StatelessWidget {
  final WidgetBuilder compact;
  final WidgetBuilder? medium;
  final WidgetBuilder? expanded;

  const FormFactorBuilder({
    super.key,
    required this.compact,
    this.medium,
    this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    final builder = switch (context.formFactor) {
      FormFactor.expanded => expanded ?? medium ?? compact,
      FormFactor.medium => medium ?? compact,
      FormFactor.compact => compact,
    };
    return builder(context);
  }
}
