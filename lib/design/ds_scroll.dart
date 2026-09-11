import 'package:flutter/material.dart';

class DsHScroll extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double fade;

  const DsHScroll({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.fade = 28,
  });

  @override
  State<DsHScroll> createState() => _DsHScrollState();
}

class _DsHScrollState extends State<DsHScroll> {
  final _controller = ScrollController();
  bool _atStart = true;
  bool _atEnd = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_update);
    WidgetsBinding.instance.addPostFrameCallback((_) => _update());
  }

  void _update() {
    if (!_controller.hasClients) return;
    final max = _controller.position.maxScrollExtent;
    final offset = _controller.offset;
    final atStart = offset <= 1;
    final atEnd = max <= 1 || offset >= max - 1;
    if (atStart != _atStart || atEnd != _atEnd) {
      setState(() {
        _atStart = atStart;
        _atEnd = atEnd;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_update);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = SingleChildScrollView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      padding: widget.padding,
      physics: const BouncingScrollPhysics(),
      child: widget.child,
    );

    return LayoutBuilder(
      builder: (context, box) {
        final width = box.maxWidth;
        if (width == 0 || width.isInfinite) return list;
        final f = (widget.fade / width).clamp(0.0, 0.4);

        return ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              _atStart ? Colors.white : Colors.transparent,
              Colors.white,
              Colors.white,
              _atEnd ? Colors.white : Colors.transparent,
            ],
            stops: [0, f, 1 - f, 1],
          ).createShader(rect),
          blendMode: BlendMode.dstIn,
          child: list,
        );
      },
    );
  }
}
