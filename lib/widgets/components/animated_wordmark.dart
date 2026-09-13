import 'package:flutter/material.dart';

import '../../design/design.dart';

class AnimatedWordmark extends StatefulWidget {
  final String asset;
  final double aspectRatio;

  const AnimatedWordmark({
    super.key,
    required this.asset,
    this.aspectRatio = 1542 / 182,
  });

  @override
  State<AnimatedWordmark> createState() => _AnimatedWordmarkState();
}

class _AnimatedWordmarkState extends State<AnimatedWordmark>
    with TickerProviderStateMixin {
  static const List<List<double>> _glyphs = [
    [0.00259, 0.11543],
    [0.12127, 0.20233],
    [0.20817, 0.28988],
    [0.29572, 0.37678],
    [0.38262, 0.49546],
    [0.50130, 0.58301],
    [0.58885, 0.66991],
    [0.67575, 0.76783],
    [0.77367, 0.81258],
    [0.81842, 0.90013],
    [0.90597, 0.99741],
  ];

  late final AnimationController _drop;
  late final AnimationController _shine;

  @override
  void initState() {
    super.initState();
    _drop = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1150),
    )..forward();
    _shine = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    _drop.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) _shine.forward();
    });
  }

  @override
  void dispose() {
    _drop.dispose();
    _shine.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: LayoutBuilder(
        builder: (context, box) {
          final image = Image.asset(
            widget.asset,
            width: box.maxWidth,
            height: box.maxHeight,
            fit: BoxFit.fill,
          );

          return AnimatedBuilder(
            animation: Listenable.merge([_drop, _shine]),
            builder: (context, _) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  for (var i = 0; i < _glyphs.length; i++)
                    _glyph(i, box.maxWidth, box.maxHeight, image),
                  if (_shine.value > 0) _sheen(box.maxWidth, box.maxHeight),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _glyph(int index, double width, double height, Widget image) {
    final span = _glyphs[index];
    final left = span[0] * width;
    final right = span[1] * width;
    final start = index * 0.055;
    final t = Curves.easeOutBack.transform(
      ((_drop.value - start) / 0.45).clamp(0.0, 1.0),
    );
    final fade = ((_drop.value - start) / 0.25).clamp(0.0, 1.0);

    return Positioned(
      left: left,
      width: right - left,
      top: 0,
      height: height,
      child: Opacity(
        opacity: fade,
        child: Transform.translate(
          offset: Offset(0, (1 - t) * -height * 0.55),
          child: ClipRect(
            clipper: _SpanClipper(left, right - left),
            child: OverflowBox(
              alignment: Alignment.topLeft,
              minWidth: width,
              maxWidth: width,
              minHeight: height,
              maxHeight: height,
              child: Transform.translate(
                offset: Offset(-left, 0),
                child: image,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sheen(double width, double height) {
    final p = Curves.easeInOut.transform(_shine.value);
    final x = -0.4 + p * 1.8;
    return IgnorePointer(
      child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (rect) => LinearGradient(
          begin: Alignment(x - 0.35, -1),
          end: Alignment(x + 0.35, 1),
          colors: [
            Colors.white.withValues(alpha: 0),
            Colors.white.withValues(alpha: 0.45),
            Colors.white.withValues(alpha: 0),
          ],
          stops: const [0.0, 0.5, 1.0],
        ).createShader(rect),
        child: Image.asset(
          widget.asset,
          width: width,
          height: height,
          fit: BoxFit.fill,
          color: DsColor.accent.withValues(alpha: 0),
        ),
      ),
    );
  }
}

class _SpanClipper extends CustomClipper<Rect> {
  final double left;
  final double width;

  const _SpanClipper(this.left, this.width);

  @override
  Rect getClip(Size size) => Rect.fromLTWH(0, 0, width, size.height);

  @override
  bool shouldReclip(covariant _SpanClipper oldClipper) =>
      oldClipper.left != left || oldClipper.width != width;
}
