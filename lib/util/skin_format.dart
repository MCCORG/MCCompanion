import 'dart:typed_data';

const int skinSize = 64;

typedef SkinRect = ({int x, int y, int w, int h});

typedef SkinBox = ({
  SkinRect top,
  SkinRect bottom,
  SkinRect right,
  SkinRect front,
  SkinRect left,
  SkinRect back,
});

SkinBox _box(int x, int y, int w, int d, int h) => (
  top: (x: x + d, y: y, w: w, h: d),
  bottom: (x: x + d + w, y: y, w: w, h: d),
  right: (x: x, y: y + d, w: d, h: h),
  front: (x: x + d, y: y + d, w: w, h: h),
  left: (x: x + d + w, y: y + d, w: d, h: h),
  back: (x: x + d + w + d, y: y + d, w: w, h: h),
);

final Map<String, SkinBox> skinParts = {
  'head': _box(0, 0, 8, 8, 8),
  'body': _box(16, 16, 8, 4, 12),
  'armRight': _box(40, 16, 4, 4, 12),
  'legRight': _box(0, 16, 4, 4, 12),
  'armLeft': _box(32, 48, 4, 4, 12),
  'legLeft': _box(16, 48, 4, 4, 12),
};

int _idx(int x, int y) => (y * skinSize + x) * 4;

bool looksSlim(Uint8List px) {
  for (final x in [54, 55]) {
    for (var y = 20; y < 32; y++) {
      if (px[_idx(x, y) + 3] != 0) return false;
    }
  }
  for (final x in [51, 52, 53]) {
    for (var y = 20; y < 32; y++) {
      if (px[_idx(x, y) + 3] == 0) return false;
    }
  }
  return true;
}

void _copyMirrored(Uint8List src, Uint8List dst, SkinRect from, SkinRect to) {
  for (var row = 0; row < from.h; row++) {
    for (var col = 0; col < from.w; col++) {
      final s = _idx(from.x + col, from.y + row);
      final d = _idx(to.x + (to.w - 1 - col), to.y + row);
      for (var c = 0; c < 4; c++) {
        dst[d + c] = src[s + c];
      }
    }
  }
}

void _mirrorLimb(Uint8List src, Uint8List dst, SkinBox right, SkinBox left) {
  _copyMirrored(src, dst, right.top, left.top);
  _copyMirrored(src, dst, right.bottom, left.bottom);
  _copyMirrored(src, dst, right.front, left.front);
  _copyMirrored(src, dst, right.back, left.back);
  _copyMirrored(src, dst, right.left, left.right);
  _copyMirrored(src, dst, right.right, left.left);
}

Uint8List expandLegacy(Uint8List px) {
  final out = Uint8List(skinSize * skinSize * 4);
  out.setRange(0, px.length, px);
  _mirrorLimb(out, out, skinParts['legRight']!, skinParts['legLeft']!);
  _mirrorLimb(out, out, skinParts['armRight']!, skinParts['armLeft']!);
  return out;
}

final Map<String, SkinBox> skinOverlayParts = {
  'hat': _box(32, 0, 8, 8, 8),
  'jacket': _box(16, 32, 8, 4, 12),
  'armRightOver': _box(40, 32, 4, 4, 12),
  'legRightOver': _box(0, 32, 4, 4, 12),
  'armLeftOver': _box(48, 48, 4, 4, 12),
  'legLeftOver': _box(0, 48, 4, 4, 12),
};

const Map<String, String> _mirrorPart = {
  'head': 'head',
  'body': 'body',
  'armRight': 'armLeft',
  'armLeft': 'armRight',
  'legRight': 'legLeft',
  'legLeft': 'legRight',
  'hat': 'hat',
  'jacket': 'jacket',
  'armRightOver': 'armLeftOver',
  'armLeftOver': 'armRightOver',
  'legRightOver': 'legLeftOver',
  'legLeftOver': 'legRightOver',
};

SkinRect _face(SkinBox b, String name) => switch (name) {
  'top' => b.top,
  'bottom' => b.bottom,
  'right' => b.right,
  'front' => b.front,
  'left' => b.left,
  _ => b.back,
};

String _mirrorFace(String f) => switch (f) {
  'right' => 'left',
  'left' => 'right',
  _ => f,
};

const List<String> _faceNames = [
  'top',
  'bottom',
  'right',
  'front',
  'left',
  'back',
];

bool _inside(SkinRect r, int x, int y) =>
    x >= r.x && x < r.x + r.w && y >= r.y && y < r.y + r.h;

({int x, int y})? mirrorPoint(int x, int y) {
  for (final map in [skinParts, skinOverlayParts]) {
    for (final entry in map.entries) {
      for (final faceName in _faceNames) {
        final r = _face(entry.value, faceName);
        if (!_inside(r, x, y)) continue;
        final target = map[_mirrorPart[entry.key]!]!;
        final dst = _face(target, _mirrorFace(faceName));
        return (x: dst.x + (dst.w - 1 - (x - r.x)), y: dst.y + (y - r.y));
      }
    }
  }
  return null;
}

List<({int x, int y})> texelLine(int x0, int y0, int x1, int y1) {
  final out = <({int x, int y})>[];
  var x = x0, y = y0;
  final dx = (x1 - x0).abs(), dy = -(y1 - y0).abs();
  final sx = x0 < x1 ? 1 : -1, sy = y0 < y1 ? 1 : -1;
  var err = dx + dy;
  while (true) {
    out.add((x: x, y: y));
    if (x == x1 && y == y1) break;
    final e2 = 2 * err;
    if (e2 >= dy) {
      err += dy;
      x += sx;
    }
    if (e2 <= dx) {
      err += dx;
      y += sy;
    }
  }
  return out;
}

bool sameFace(int x0, int y0, int x1, int y1) {
  for (final map in [skinParts, skinOverlayParts]) {
    for (final box in map.values) {
      for (final r in [
        box.top,
        box.bottom,
        box.right,
        box.front,
        box.left,
        box.back,
      ]) {
        if (_inside(r, x0, y0)) return _inside(r, x1, y1);
      }
    }
  }
  return false;
}

const List<(int, int)> _armBlocks = [(40, 16), (32, 48), (40, 32), (48, 48)];

const int _armDepth = 4;
const int _armHeight = 12;

void _resizeArm(
  Uint8List src,
  Uint8List dst,
  int bx,
  int by,
  int fromW,
  int toW,
) {
  void copy(int sx, int sy, int dx, int dy, int w, int h, int srcW) {
    for (var row = 0; row < h; row++) {
      for (var col = 0; col < w; col++) {
        final from = _idx(sx + (col < srcW ? col : srcW - 1), sy + row);
        final to = _idx(dx + col, dy + row);
        for (var c = 0; c < 4; c++) {
          dst[to + c] = src[from + c];
        }
      }
    }
  }

  const d = _armDepth;
  final h = _armHeight;

  copy(bx + d, by, bx + d, by, toW, d, fromW);
  copy(bx + d + fromW, by, bx + d + toW, by, toW, d, fromW);
  copy(bx + d, by + d, bx + d, by + d, toW, h, fromW);
  copy(bx + d + fromW + d, by + d, bx + d + toW + d, by + d, toW, h, fromW);

  copy(bx, by + d, bx, by + d, d, h, d);
  copy(bx + d + fromW, by + d, bx + d + toW, by + d, d, h, d);

  for (var x = bx + d + toW + d + toW; x < bx + d + 4 + d + 4; x++) {
    for (var y = by; y < by + d + h; y++) {
      for (var c = 0; c < 4; c++) {
        dst[_idx(x, y) + c] = 0;
      }
    }
  }
}

Uint8List setArmWidth(Uint8List px, {required bool slim}) {
  final fromW = slim ? 4 : 3;
  final toW = slim ? 3 : 4;
  final out = Uint8List.fromList(px);
  for (final (bx, by) in _armBlocks) {
    _resizeArm(px, out, bx, by, fromW, toW);
  }
  return out;
}

final Map<String, SkinBox> slimSkinParts = {
  ...skinParts,
  'armRight': _box(40, 16, 3, 4, 12),
  'armLeft': _box(32, 48, 3, 4, 12),
};
