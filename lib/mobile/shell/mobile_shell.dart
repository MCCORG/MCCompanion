import 'package:flutter/material.dart';

import '../../widgets/components/update_banner.dart';
import '../navigation/app_sidebar.dart';

class MobileShell extends StatelessWidget {
  final Widget background;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget drawer;
  final Widget bottomBar;
  final double topBarOffset;
  final bool profileActive;
  final VoidCallback onProfile;
  final bool Function(ScrollNotification) onPageScroll;
  final Widget page;
  final Widget? notice;
  final Widget consoleOverlay;

  const MobileShell({
    super.key,
    required this.background,
    required this.scaffoldKey,
    required this.drawer,
    required this.bottomBar,
    required this.topBarOffset,
    required this.profileActive,
    required this.onProfile,
    required this.onPageScroll,
    required this.page,
    required this.notice,
    required this.consoleOverlay,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background,
        Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          drawer: drawer,
          drawerEnableOpenDragGesture: false,
          bottomNavigationBar: bottomBar,
          body: Stack(
            children: [
              SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRect(
                      child: SizedBox(
                        height: AppTopBar.height + topBarOffset,
                        child: OverflowBox(
                          alignment: Alignment.topCenter,
                          minHeight: AppTopBar.height,
                          maxHeight: AppTopBar.height,
                          child: AppTopBar(
                            onMenu: () =>
                                scaffoldKey.currentState?.openDrawer(),
                            profileActive: profileActive,
                            onProfile: onProfile,
                          ),
                        ),
                      ),
                    ),
                    const UpdateBanner(),
                    Expanded(
                      child: NotificationListener<ScrollNotification>(
                        onNotification: onPageScroll,
                        child: page,
                      ),
                    ),
                  ],
                ),
              ),
              ?notice,
              consoleOverlay,
            ],
          ),
        ),
      ],
    );
  }
}
