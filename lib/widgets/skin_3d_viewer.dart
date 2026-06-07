import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../theme/app_theme.dart';

class SkinBodyFromUrl extends StatefulWidget {
  final String textureUrl;
  final double height;

  const SkinBodyFromUrl({
    super.key,
    required this.textureUrl,
    required this.height,
  });

  @override
  State<SkinBodyFromUrl> createState() => _SkinBodyFromUrlState();
}

class _SkinBodyFromUrlState extends State<SkinBodyFromUrl> {
  ui.Image? _image;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(SkinBodyFromUrl old) {
    super.didUpdateWidget(old);
    if (old.textureUrl != widget.textureUrl) _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _image = null;
    });
    try {
      final resp = await http
          .get(Uri.parse(widget.textureUrl),
              headers: {'User-Agent': 'MCCompanionApp/1.0'})
          .timeout(const Duration(seconds: 10));
      if (!mounted) return;
      final codec = await ui.instantiateImageCodec(resp.bodyBytes);
      final frame = await codec.getNextFrame();
      if (mounted)
        setState(() {
          _image = frame.image;
          _loading = false;
        });
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = widget.height;
    final w = h / 2.0;
    if (_loading) {
      return SizedBox(
        width: w,
        height: h,
        child: Center(
          child: CircularProgressIndicator(
              color: AppTheme.accent, strokeWidth: 2),
        ),
      );
    }
    if (_image == null) {
      return SizedBox(
        width: w,
        height: h,
        child: Center(
          child: Icon(Icons.person, color: AppTheme.textMuted, size: 28),
        ),
      );
    }
    return CustomPaint(size: Size(w, h), painter: SkinBodyPainter(_image!));
  }
}
class SkinBodyPainter extends CustomPainter {
  final ui.Image image;
  SkinBodyPainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final sc = image.width / 64.0; 
    final px = size.width / 16.0; 

  
    final is64x64 = image.height >= 64;

    final paint = Paint()
      ..filterQuality = FilterQuality.none
      ..isAntiAlias = false;

    void draw(double dx, double dy, double dw, double dh,
        double sx, double sy, double sw, double sh) {
      canvas.drawImageRect(
        image,
        Rect.fromLTWH(sx * sc, sy * sc, sw * sc, sh * sc),
        Rect.fromLTWH(dx * px, dy * px, dw * px, dh * px),
        paint,
      );
    }

    draw(4, 0, 8, 8,  8, 8, 8, 8); 
    draw(4, 0, 8, 8, 40, 8, 8, 8); 

    draw(4,  8, 8, 12, 20, 20, 8, 12);
    if (is64x64) draw(4, 8, 8, 12, 20, 36, 8, 12); 

    draw(0,  8, 4, 12, 44, 20, 4, 12); 
    if (is64x64) draw(0, 8, 4, 12, 44, 36, 4, 12);

    draw(12, 8, 4, 12, is64x64 ? 36 : 44, is64x64 ? 52 : 20, 4, 12);
    if (is64x64) draw(12, 8, 4, 12, 52, 52, 4, 12); 

    draw(4, 20, 4, 12,  4, 20, 4, 12); 
    if (is64x64) draw(4, 20, 4, 12, 4, 36, 4, 12); 
    draw(8, 20, 4, 12, is64x64 ? 20 : 4, is64x64 ? 52 : 20, 4, 12);
    if (is64x64) draw(8, 20, 4, 12, 4, 52, 4, 12);
  }

  @override
  bool shouldRepaint(SkinBodyPainter old) => old.image != image;
}

class Skin3DFromUrl extends StatefulWidget {
  final String textureUrl;
  final double height;

  const Skin3DFromUrl({
    super.key,
    required this.textureUrl,
    required this.height,
  });

  @override
  State<Skin3DFromUrl> createState() => _Skin3DFromUrlState();
}

class _Skin3DFromUrlState extends State<Skin3DFromUrl> {
  ui.Image? _image;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(Skin3DFromUrl old) {
    super.didUpdateWidget(old);
    if (old.textureUrl != widget.textureUrl) _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _image = null;
    });
    try {
      final resp = await http
          .get(Uri.parse(widget.textureUrl),
              headers: {'User-Agent': 'MCCompanionApp/1.0'})
          .timeout(const Duration(seconds: 10));
      if (!mounted) return;
      final codec = await ui.instantiateImageCodec(resp.bodyBytes);
      final frame = await codec.getNextFrame();
      if (mounted)
        setState(() {
          _image = frame.image;
          _loading = false;
        });
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = widget.height;
    final w = h / 2.0;
    if (_loading) {
      return SizedBox(
        width: w,
        height: h,
        child: Center(
          child: CircularProgressIndicator(
              color: AppTheme.accent, strokeWidth: 2),
        ),
      );
    }
    if (_image == null) {
      return SizedBox(
        width: w,
        height: h,
        child: Center(
          child: Icon(Icons.person, color: AppTheme.textMuted, size: 28),
        ),
      );
    }
    return SizedBox(
      width: w,
      height: h,
      child: Skin3DViewer(texture: _image!, size: h),
    );
  }
}

class Skin3DViewer extends StatefulWidget {
  final ui.Image texture;
  final double size;
  final bool slim;

  const Skin3DViewer({
    super.key,
    required this.texture,
    required this.size,
    this.slim = false,
  });

  @override
  State<Skin3DViewer> createState() => _Skin3DViewerState();
}

class _Skin3DViewerState extends State<Skin3DViewer> {
  static const double _rotY = -0.5;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        size: Size(widget.size / 2, widget.size),
        painter: _Skin3DPainter(widget.texture, _rotY, 0.0, widget.slim),
        isComplex: true,
      ),
    );
  }
}

class _V3 {
  final double x, y, z;
  const _V3(this.x, this.y, this.z);
}

class _Face {
  final List<_V3> corners;
  final List<Offset> uvs;
  const _Face(this.corners, this.uvs);
}

List<_Face> _boxFaces({
  required double hw,
  required double hh,
  required double hd,
  required int tx,
  required int ty,
  required int bw,
  required int bh,
  required int bd,
}) {
  final w = bw.toDouble(), h = bh.toDouble(), d = bd.toDouble();
  final x = tx.toDouble(), y = ty.toDouble();

  return [
    _Face(
      [_V3(-hw, hh, hd), _V3(hw, hh, hd), _V3(hw, -hh, hd), _V3(-hw, -hh, hd)],
      [Offset(x+d, y+d), Offset(x+d+w, y+d), Offset(x+d+w, y+d+h), Offset(x+d, y+d+h)],
    ),
    _Face(
      [_V3(hw, hh, -hd), _V3(-hw, hh, -hd), _V3(-hw, -hh, -hd), _V3(hw, -hh, -hd)],
      [Offset(x+d+w+d, y+d), Offset(x+d+w+d+w, y+d), Offset(x+d+w+d+w, y+d+h), Offset(x+d+w+d, y+d+h)],
    ),
    _Face(
      [_V3(hw, hh, hd), _V3(hw, hh, -hd), _V3(hw, -hh, -hd), _V3(hw, -hh, hd)],
      [Offset(x+d+w, y+d), Offset(x+d+w+d, y+d), Offset(x+d+w+d, y+d+h), Offset(x+d+w, y+d+h)],
    ),
    _Face(
      [_V3(-hw, hh, -hd), _V3(-hw, hh, hd), _V3(-hw, -hh, hd), _V3(-hw, -hh, -hd)],
      [Offset(x, y+d), Offset(x+d, y+d), Offset(x+d, y+d+h), Offset(x, y+d+h)],
    ),
    _Face(
      [_V3(-hw, hh, -hd), _V3(hw, hh, -hd), _V3(hw, hh, hd), _V3(-hw, hh, hd)],
      [Offset(x+d, y), Offset(x+d+w, y), Offset(x+d+w, y+d), Offset(x+d, y+d)],
    ),
    _Face(
      [_V3(hw, -hh, hd), _V3(-hw, -hh, hd), _V3(-hw, -hh, -hd), _V3(hw, -hh, -hd)],
      [Offset(x+d+w, y+d), Offset(x+d+w+w, y+d), Offset(x+d+w+w, y), Offset(x+d+w, y)],
    ),
  ];
}

double _screenNormalZ(_Face face, double rotY, double rotX) {
  final v0 = face.corners[0], v1 = face.corners[1], v3 = face.corners[3];
  final ax = v1.x - v0.x, ay = v1.y - v0.y, az = v1.z - v0.z;
  final bx = v3.x - v0.x, by_ = v3.y - v0.y, bz = v3.z - v0.z;
  final nx = ay * bz - az * by_;
  final ny = az * bx - ax * bz;
  final nz = ax * by_ - ay * bx;
  final nz2 = ny * sin(rotX) + nz * cos(rotX);
  return nx * sin(rotY) + nz2 * cos(rotY);
}

void _drawQuadSolid(Canvas canvas, List<Offset> p, Paint paint) {
  final pos = Float32List(12);
  pos[0]  = p[0].dx; pos[1]  = p[0].dy;
  pos[2]  = p[1].dx; pos[3]  = p[1].dy;
  pos[4]  = p[2].dx; pos[5]  = p[2].dy;
  pos[6]  = p[0].dx; pos[7]  = p[0].dy;
  pos[8]  = p[2].dx; pos[9]  = p[2].dy;
  pos[10] = p[3].dx; pos[11] = p[3].dy;
  canvas.drawVertices(
      ui.Vertices.raw(ui.VertexMode.triangles, pos), BlendMode.srcOver, paint);
}

void _drawQuad(Canvas canvas, List<Offset> p, List<Offset> uv, Paint paint) {
  final pos = Float32List(12);
  final tex = Float32List(12);
  pos[0]  = p[0].dx;  pos[1]  = p[0].dy;
  pos[2]  = p[1].dx;  pos[3]  = p[1].dy;
  pos[4]  = p[2].dx;  pos[5]  = p[2].dy;
  pos[6]  = p[0].dx;  pos[7]  = p[0].dy;
  pos[8]  = p[2].dx;  pos[9]  = p[2].dy;
  pos[10] = p[3].dx;  pos[11] = p[3].dy;
  tex[0]  = uv[0].dx; tex[1]  = uv[0].dy;
  tex[2]  = uv[1].dx; tex[3]  = uv[1].dy;
  tex[4]  = uv[2].dx; tex[5]  = uv[2].dy;
  tex[6]  = uv[0].dx; tex[7]  = uv[0].dy;
  tex[8]  = uv[2].dx; tex[9]  = uv[2].dy;
  tex[10] = uv[3].dx; tex[11] = uv[3].dy;
  canvas.drawVertices(
    ui.Vertices.raw(ui.VertexMode.triangles, pos, textureCoordinates: tex),
    BlendMode.srcOver,
    paint,
  );
}

typedef SkinFaceData = ({
  List<Offset> screen,
  List<Offset> uvs,
  double depth,
  double shade,
  bool isBase,
});

List<SkinFaceData> buildProjectedFaces({
  required double rotY,
  required double rotX,
  required bool slim,
  required Size canvasSize,
}) {
  final scale = canvasSize.height / 38.0;
  final cx = canvasSize.width / 2;
  final cy = canvasSize.height / 2;
  const charCenterY = 16.0;

  final armHW = slim ? 1.5 : 2.0;
  final armW  = slim ? 3   : 4;

  const s = 0.5;

  final parts = <(double, double, double, List<_Face>)>[
    (0, 28, 0, _boxFaces(hw: 4,    hh: 4,    hd: 4,    tx: 0,  ty: 0,  bw: 8,    bh: 8,  bd: 8)),
    (0, 28, 0, _boxFaces(hw: 4.05, hh: 4.05, hd: 4.05, tx: 32, ty: 0,  bw: 8,    bh: 8,  bd: 8)),
    (0, 18, 0, _boxFaces(hw: 4,    hh: 6 + s,      hd: 2,    tx: 16, ty: 16, bw: 8,    bh: 12, bd: 4)),
    (0, 18, 0, _boxFaces(hw: 4.05, hh: 6.05 + s,   hd: 2.05, tx: 16, ty: 32, bw: 8,    bh: 12, bd: 4)),
    (-(4 + armHW - s), 18, 0, _boxFaces(hw: armHW,        hh: 6 + s,      hd: 2,    tx: 40, ty: 16, bw: armW, bh: 12, bd: 4)),
    (-(4 + armHW - s), 18, 0, _boxFaces(hw: armHW + 0.05, hh: 6.05 + s,   hd: 2.05, tx: 40, ty: 32, bw: armW, bh: 12, bd: 4)),
    ( (4 + armHW - s), 18, 0, _boxFaces(hw: armHW,        hh: 6 + s,      hd: 2,    tx: 32, ty: 48, bw: armW, bh: 12, bd: 4)),
    ( (4 + armHW - s), 18, 0, _boxFaces(hw: armHW + 0.05, hh: 6.05 + s,   hd: 2.05, tx: 48, ty: 48, bw: armW, bh: 12, bd: 4)),
    (-(2.0 - s), 6, 0, _boxFaces(hw: 2,    hh: 6 + s,      hd: 2,    tx: 0,  ty: 16, bw: 4,    bh: 12, bd: 4)),
    (-(2.0 - s), 6, 0, _boxFaces(hw: 2.05, hh: 6.05 + s,   hd: 2.05, tx: 0,  ty: 32, bw: 4,    bh: 12, bd: 4)),
    ( (2.0 - s), 6, 0, _boxFaces(hw: 2,    hh: 6 + s,      hd: 2,    tx: 16, ty: 48, bw: 4,    bh: 12, bd: 4)),
    ( (2.0 - s), 6, 0, _boxFaces(hw: 2.05, hh: 6.05 + s,   hd: 2.05, tx: 0,  ty: 48, bw: 4,    bh: 12, bd: 4)),
  ];

  final list = <SkinFaceData>[];

  for (int pi = 0; pi < parts.length; pi++) {
    final (bx, by, bz, faces) = parts[pi];
    final isBase = pi % 2 == 0;

    int skipFaceIdx = -1;
    if (pi == 4 || pi == 5 || pi == 8 || pi == 9)   skipFaceIdx = 2;
    if (pi == 6 || pi == 7 || pi == 10 || pi == 11) skipFaceIdx = 3;

    for (int fi = 0; fi < faces.length; fi++) {
      if (fi == skipFaceIdx) continue;
      final face = faces[fi];
      if (fi != 5 && _screenNormalZ(face, rotY, rotX) >= 0) continue;

      final screenPts = <Offset>[];
      double sumDepth = 0;
      for (final c in face.corners) {
        final wx = c.x + bx;
        final wy = c.y + by - charCenterY;
        final wz = c.z + bz;
        final wy2 = wy * cos(rotX) - wz * sin(rotX);
        final wz2 = wy * sin(rotX) + wz * cos(rotX);
        final sx = wx * cos(rotY) - wz2 * sin(rotY);
        final sz = wx * sin(rotY) + wz2 * cos(rotY);
        sumDepth += sz;
        screenPts.add(Offset(cx + sx * scale, cy - wy2 * scale));
      }

      const shades = [0.9, 0.8, 0.7, 0.7, 1.0, 0.60];
      final shade = fi < shades.length ? shades[fi] : 1.0;

      list.add((
        screen: screenPts,
        uvs: face.uvs,
        depth: sumDepth / 4,
        shade: shade,
        isBase: isBase,
      ));
    }
  }

  return list; 
}

void drawSkinFaces(Canvas canvas, ui.Image image, List<SkinFaceData> faces) {
  final shader = ui.ImageShader(
      image, TileMode.clamp, TileMode.clamp, Matrix4.identity().storage);
  final texPaint = Paint()
    ..shader = shader
    ..filterQuality = FilterQuality.none
    ..isAntiAlias = false;
  final bgPaint = Paint()..isAntiAlias = false;

  final baseFaces = faces.where((f) => f.isBase).toList()
    ..sort((a, b) => a.depth.compareTo(b.depth));
  final overlayFaces = faces.where((f) => !f.isBase).toList()
    ..sort((a, b) => a.depth.compareTo(b.depth));

  void renderFace(SkinFaceData f, {required bool withBackground}) {
    final s = f.shade;
    if (withBackground) {
      final grey = (s * 255).round().clamp(0, 255);
      bgPaint.color = Color.fromARGB(255, grey, grey, grey);
      _drawQuadSolid(canvas, f.screen, bgPaint);
    }
    texPaint.colorFilter = s < 0.999
        ? ColorFilter.matrix([
            s, 0, 0, 0, 0,
            0, s, 0, 0, 0,
            0, 0, s, 0, 0,
            0, 0, 0, 1, 0,
          ])
        : null;
    _drawQuad(canvas, f.screen, f.uvs, texPaint);
  }

  for (final f in baseFaces)    renderFace(f, withBackground: true);
  for (final f in overlayFaces) renderFace(f, withBackground: false);
}

class _Skin3DPainter extends CustomPainter {
  final ui.Image image;
  final double rotY;
  final double rotX;
  final bool slim;

  const _Skin3DPainter(this.image, this.rotY, this.rotX, this.slim);

  @override
  void paint(Canvas canvas, Size size) {
    final faces = buildProjectedFaces(rotY: rotY, rotX: rotX, slim: slim, canvasSize: size);
    drawSkinFaces(canvas, image, faces);
  }

  @override
  bool shouldRepaint(_Skin3DPainter old) =>
      old.rotY != rotY || old.rotX != rotX || old.image != image;
}
