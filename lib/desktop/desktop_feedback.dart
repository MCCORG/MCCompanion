import 'package:flutter/material.dart';

import '../design/design.dart';
import '../screens/feedback_screen.dart';
import '../screens/my_feedback_screen.dart';

class DesktopFeedbackScreen extends StatefulWidget {
  static const double splitWidth = 900;
  static const double listWidth = 460;

  final VoidCallback onBack;
  final VoidCallback onGoToLogin;

  const DesktopFeedbackScreen({
    super.key,
    required this.onBack,
    required this.onGoToLogin,
  });

  @override
  State<DesktopFeedbackScreen> createState() => _DesktopFeedbackScreenState();
}

class _DesktopFeedbackScreenState extends State<DesktopFeedbackScreen> {
  final GlobalKey<MyFeedbackScreenState> _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final split = constraints.maxWidth >= DesktopFeedbackScreen.splitWidth;
        if (!split) {
          return FeedbackScreen(
            onBack: widget.onBack,
            onGoToLogin: widget.onGoToLogin,
          );
        }
        return Row(
          children: [
            Expanded(
              child: FeedbackScreen(
                onBack: widget.onBack,
                onGoToLogin: widget.onGoToLogin,
                embedded: true,
                onSubmitted: () => _listKey.currentState?.reload(),
              ),
            ),
            Container(
              width: DesktopFeedbackScreen.listWidth,
              decoration: BoxDecoration(
                color: DsColor.surfaceQuiet,
                border: Border(left: BorderSide(color: DsColor.line)),
              ),
              child: MyFeedbackScreen(key: _listKey, embedded: true),
            ),
          ],
        );
      },
    );
  }
}
