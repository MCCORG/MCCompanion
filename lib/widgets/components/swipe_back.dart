import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SwipeBack extends StatefulWidget {
  final Widget child;
  final VoidCallback onBack;

  const SwipeBack({super.key, required this.child, required this.onBack});

  @override
  State<SwipeBack> createState() => _SwipeBackState();
}

class _SwipeBackState extends State<SwipeBack> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  Offset? _start;
  bool _tracking = false;
  bool _decided = false;
  double _lastDx = 0;
  int _lastTime = 0;
  double _velocity = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isMobile => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  void _onPointerDown(PointerDownEvent e) {
    _start = e.localPosition;
    _tracking = false;
    _decided = false;
    _lastDx = e.localPosition.dx;
    _lastTime = DateTime.now().millisecondsSinceEpoch;
    _velocity = 0;
  }

  void _onPointerMove(PointerMoveEvent e) {
    if (_start == null) return;

    final now = DateTime.now().millisecondsSinceEpoch;
    final dt = now - _lastTime;
    if (dt > 0) {
      _velocity = (e.localPosition.dx - _lastDx) / dt * 1000;
    }
    _lastDx = e.localPosition.dx;
    _lastTime = now;

    if (!_decided) {
      final dx = e.localPosition.dx - _start!.dx;
      final dy = e.localPosition.dy - _start!.dy;
      if (dx.abs() < 8 && dy.abs() < 8) return;
      if (dx > 0 && dx.abs() > dy.abs()) {
        _tracking = true;
        _decided = true;
        _controller.value = 0;
      } else {
        _decided = true;
      }
      return;
    }

    if (!_tracking) return;
    final dx = e.localPosition.dx - _start!.dx;
    final width = MediaQuery.of(context).size.width;
    _controller.value = (dx / width).clamp(0.0, 1.0);
  }

  void _onPointerUp(PointerUpEvent e) {
    _decided = false;
    _start = null;
    if (!_tracking) return;
    _tracking = false;
    if (_velocity > 300 || _controller.value > 0.30) {
      _controller
          .animateTo(1.0, duration: const Duration(milliseconds: 180), curve: Curves.easeOut)
          .then((_) {
        widget.onBack();
        _controller.value = 0;
      });
    } else {
      _controller.animateBack(0, duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    }
  }

  void _onPointerCancel(PointerCancelEvent e) {
    _tracking = false;
    _decided = false;
    _start = null;
    if (_controller.value > 0) {
      _controller.animateBack(0, duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isMobile) return widget.child;

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: _onPointerDown,
      onPointerMove: _onPointerMove,
      onPointerUp: _onPointerUp,
      onPointerCancel: _onPointerCancel,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final offset = _controller.value * MediaQuery.of(context).size.width;
          return Stack(
            children: [
              Transform.translate(
                offset: Offset(offset, 0),
                child: child,
              ),
            ],
          );
        },
        child: widget.child,
      ),
    );
  }
}
