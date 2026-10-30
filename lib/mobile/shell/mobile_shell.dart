import 'package:flutter/material.dart';

import '../../layout/bar_inset.dart';
import '../../widgets/components/update_banner.dart';
import '../navigation/bottom_nav_bar.dart';
import '../navigation/app_sidebar.dart';

class MobileShell extends StatelessWidget {
  final Widget background;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget drawer;
  final Widget bottomBar;
  final double topBarOffset;
  final double bottomBarOffset;
  final bool animateBottomBar;
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
    this.bottomBarOffset = 0,
    this.animateBottomBar = false,
    required this.profileActive,
    required this.onProfile,
    required this.onPageScroll,
    required this.page,
    required this.notice,
    required this.consoleOverlay,
  });

  Widget _withBarInset(BuildContext context) {
    final inset = BottomGlassSimpleNavBar.insetOf(context);
    final media = MediaQuery.of(context);
    return BarInset(
      bottom: inset,
      child: MediaQuery(
        data: media.copyWith(padding: media.padding.copyWith(bottom: inset)),
        child: page,
      ),
    );
  }

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
                        child: _withBarInset(context),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: TweenAnimationBuilder<double>(
                  duration: animateBottomBar
                      ? const Duration(milliseconds: 240)
                      : Duration.zero,
                  curve: Curves.easeOutCubic,
                  tween: Tween<double>(end: bottomBarOffset),
                  builder: (context, offset, child) => Transform.translate(
                    offset: Offset(0, offset),
                    child: child,
                  ),
                  child: bottomBar,
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
