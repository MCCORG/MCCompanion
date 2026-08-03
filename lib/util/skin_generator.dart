import 'dart:math';
import 'dart:typed_data';

import 'skin_format.dart';

const Map<String, double> _faceLight = {
  'top': 1.10,
  'front': 1.0,
  'right': 0.90,
  'left': 0.90,
  'back': 0.94,
  'bottom': 0.72,
};

const _tones = [0xE0AC8A, 0xC68660, 0x8D5537, 0x5E3826, 0xF0C8A0, 0xA9714B];
const _hairs = [
  0x2A1C12,
  0x3C2A18,
  0x6B4423,
  0xA8722C,
  0xC8A24A,
  0xCECED2,
  0x8A2E2E,
  0x2E3A5A,
  0x1A1A1E,
];
const _eyes = [0x523D89, 0x3A6B4A, 0x6B4A2A, 0x2E5A8A, 0x4A4A55, 0x7A3050];
const _shirts = [
  0x009696,
  0x38684A,
  0x2A6ABF,
  0x8C3040,
  0xD8583A,
  0x5C34A0,
  0xE0CE48,
  0xE8E8EC,
  0x2A2C34,
  0x9A9AA4,
  0xC86A28,
  0x2F7F6F,
];
const _trousers = [
  0x3C348C,
  0x2C3240,
  0x5A4A38,
  0x1E2028,
  0x6A6A74,
  0x4A3A5A,
  0x2A4A38,
  0x8A7A5A,
];
const _shoes = [0x2C2C32, 0x3C2C20, 0x1A1A1E, 0x6A2A2A, 0xE8E8EC, 0x4A4A52];
const _accents = [0xB03030, 0xCEA84A, 0xE8E8EC, 0x2A6ABF, 0x38A058, 0xE8822E];

int _clamp(num v) => v < 0 ? 0 : (v > 255 ? 255 : v.toInt());

class _Canvas {
  final Uint8List px = Uint8List(skinSize * skinSize * 4);
  final Random rnd;
  _Canvas(this.rnd);

  void set(int x, int y, int r, int g, int b) {
    final i = (y * skinSize + x) * 4;
    px[i] = r;
    px[i + 1] = g;
    px[i + 2] = b;
    px[i + 3] = 255;
  }

  void shaded(int x, int y, int colour, double light, int jitter) {
    final n = jitter == 0 ? 0 : rnd.nextInt(jitter * 2 + 1) - jitter;
    set(
      x,
      y,
      _clamp(((colour >> 16) & 0xFF) * light + n),
      _clamp(((colour >> 8) & 0xFF) * light + n),
      _clamp((colour & 0xFF) * light + n),
    );
  }

  void fillRect(SkinRect r, int colour, double light, int jitter) {
    for (var y = r.y; y < r.y + r.h; y++) {
      for (var x = r.x; x < r.x + r.w; x++) {
        shaded(x, y, colour, light, jitter);
      }
    }
  }
}

SkinRect _face(SkinBox b, String name) => switch (name) {
  'top' => b.top,
  'bottom' => b.bottom,
  'right' => b.right,
  'front' => b.front,
  'left' => b.left,
  _ => b.back,
};

const _allFaces = ['top', 'bottom', 'right', 'front', 'left', 'back'];
const _sideFaces = ['right', 'front', 'left', 'back'];

void _fillPart(_Canvas c, String part, int colour, [int jitter = 5]) {
  final box = skinParts[part]!;
  for (final f in _allFaces) {
    c.fillRect(_face(box, f), colour, _faceLight[f]!, jitter);
  }
}

void _band(
  _Canvas c,
  String part,
  int colour,
  int from,
  int to, [
  int jitter = 4,
]) {
  final box = skinParts[part]!;
  for (final f in _sideFaces) {
    final r = _face(box, f);
    for (var y = r.y + from; y < r.y + to && y < r.y + r.h; y++) {
      for (var x = r.x; x < r.x + r.w; x++) {
        c.shaded(x, y, colour, _faceLight[f]!, jitter);
      }
    }
  }
}

void _hair(_Canvas c, int colour) {
  final box = skinParts['head']!;
  c.fillRect(box.top, colour, _faceLight['top']!, 6);
  for (final entry in {'front': 2, 'right': 3, 'left': 3, 'back': 3}.entries) {
    final r = _face(box, entry.key);
    for (var y = r.y; y < r.y + entry.value; y++) {
      for (var x = r.x; x < r.x + r.w; x++) {
        c.shaded(x, y, colour, _faceLight[entry.key]!, 6);
      }
    }
  }
}

int _mulColour(int c, double f) =>
    (_clamp(((c >> 16) & 0xFF) * f) << 16) |
    (_clamp(((c >> 8) & 0xFF) * f) << 8) |
    _clamp((c & 0xFF) * f);

void _drawFace(_Canvas c, int tone, int eye) {
  final f = skinParts['head']!.front;
  void p(int lx, int ly, int colour) =>
      c.shaded(f.x + lx, f.y + ly, colour, 1.0, 0);

  const white = 0xEEEEEE;
  p(1, 4, white);
  p(6, 4, white);
  p(2, 4, eye);
  p(5, 4, eye);

  final brow = _mulColour(tone, 0.62);
  p(1, 3, brow);
  p(2, 3, brow);
  p(5, 3, brow);
  p(6, 3, brow);

  final nose = _mulColour(tone, 0.80);
  p(3, 5, nose);
  p(4, 5, nose);

  final mouth = _mulColour(tone, 0.55);
  p(3, 6, mouth);
  p(4, 6, mouth);
}

Uint8List generateSkin({int? seed}) {
  final rnd = Random(seed ?? DateTime.now().microsecondsSinceEpoch);
  final c = _Canvas(rnd);

  int pick(List<int> from) => from[rnd.nextInt(from.length)];
  final tone = pick(_tones);
  final shirt = pick(_shirts);
  final legs = pick(_trousers);
  final shoe = pick(_shoes);

  _fillPart(c, 'head', tone);
  _fillPart(c, 'body', shirt);
  _hair(c, pick(_hairs));
  _drawFace(c, tone, pick(_eyes));

  final sleeve = 6 + rnd.nextInt(4);
  for (final arm in ['armRight', 'armLeft']) {
    _fillPart(c, arm, tone, 4);
    _band(c, arm, shirt, 0, sleeve);
    c.fillRect(skinParts[arm]!.top, shirt, _faceLight['top']!, 4);
  }

  for (final leg in ['legRight', 'legLeft']) {
    _fillPart(c, leg, legs, 4);
    _band(c, leg, shoe, 9, 12);
    c.fillRect(skinParts[leg]!.bottom, shoe, _faceLight['bottom']!, 3);
  }

  final accent = pick(_accents);
  switch (rnd.nextInt(4)) {
    case 0:
      _band(c, 'body', accent, 0, 2);
    case 1:
      _band(c, 'body', accent, 4, 6);
    case 2:
      _band(c, 'body', accent, 8, 10);
    default:
      break;
  }

  return c.px;
}
