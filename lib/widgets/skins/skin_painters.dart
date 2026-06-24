import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../../theme/app_theme.dart';

class GeyserSkin {
  final int id;
  final bool isSteve;
  final String textureId;
  String get textureUrl => 'https://textures.minecraft.net/texture/$textureId';
  const GeyserSkin({
    required this.id,
    required this.isSteve,
    required this.textureId,
  });
}

class SkinFaceImage extends StatefulWidget {
  final String textureUrl;
  final double size;
  const SkinFaceImage({super.key, required this.textureUrl}) : size = 64;

  @override
  State<SkinFaceImage> createState() => SkinFaceImageState();
}

class SkinFaceImageState extends State<SkinFaceImage> {
  ui.Image? _image;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(SkinFaceImage old) {
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
          .get(
            Uri.parse(widget.textureUrl),
            headers: {'User-Agent': 'MCCompanionApp/1.0'},
          )
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
    final s = widget.size;
    if (_loading) {
      return SizedBox(
        width: s,
        height: s,
        child: Center(
          child: CircularProgressIndicator(
            color: AppTheme.accent,
            strokeWidth: 2,
          ),
        ),
      );
    }
    if (_image == null) {
      return SizedBox(
        width: s,
        height: s,
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.user,
            color: AppTheme.textMuted,
            size: 22,
          ),
        ),
      );
    }
    return CustomPaint(size: Size(s, s), painter: SkinFacePainter(_image!));
  }
}

class SkinFacePainter extends CustomPainter {
  final ui.Image image;
  SkinFacePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final sc = image.width / 64.0;
    final paint = Paint()
      ..filterQuality = FilterQuality.none
      ..isAntiAlias = false;
    final dst = Offset.zero & size;
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(8 * sc, 8 * sc, 8 * sc, 8 * sc),
      dst,
      paint,
    );
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(40 * sc, 8 * sc, 8 * sc, 8 * sc),
      dst,
      paint,
    );
  }

  @override
  bool shouldRepaint(SkinFacePainter old) => old.image != image;
}

class SkinBodyImage extends StatefulWidget {
  final String textureUrl;
  final double height;
  const SkinBodyImage({super.key, required this.textureUrl, this.height = 128});

  @override
  State<SkinBodyImage> createState() => SkinBodyImageState();
}

class SkinBodyImageState extends State<SkinBodyImage> {
  ui.Image? _image;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(SkinBodyImage old) {
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
          .get(
            Uri.parse(widget.textureUrl),
            headers: {'User-Agent': 'MCCompanionApp/1.0'},
          )
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
    if (_loading)
      return SizedBox(
        width: w,
        height: h,
        child: Center(
          child: CircularProgressIndicator(
            color: AppTheme.accent,
            strokeWidth: 2,
          ),
        ),
      );
    if (_image == null)
      return SizedBox(
        width: w,
        height: h,
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.personRunning,
            color: AppTheme.textMuted,
            size: 28,
          ),
        ),
      );
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
    final paint = Paint()
      ..filterQuality = FilterQuality.none
      ..isAntiAlias = false;

    void draw(
      double dx,
      double dy,
      double dw,
      double dh,
      double sx,
      double sy,
      double sw,
      double sh,
    ) {
      canvas.drawImageRect(
        image,
        Rect.fromLTWH(sx * sc, sy * sc, sw * sc, sh * sc),
        Rect.fromLTWH(dx * px, dy * px, dw * px, dh * px),
        paint,
      );
    }

    draw(4, 0, 8, 8, 8, 8, 8, 8);
    draw(4, 0, 8, 8, 40, 8, 8, 8);

    draw(4, 8, 8, 12, 20, 20, 8, 12);
    draw(4, 8, 8, 12, 20, 36, 8, 12);

    draw(0, 8, 4, 12, 44, 20, 4, 12);
    draw(0, 8, 4, 12, 44, 36, 4, 12);

    draw(12, 8, 4, 12, 36, 52, 4, 12);
    draw(12, 8, 4, 12, 52, 52, 4, 12);

    draw(4, 20, 4, 12, 4, 20, 4, 12);
    draw(4, 20, 4, 12, 4, 36, 4, 12);

    draw(8, 20, 4, 12, 20, 52, 4, 12);
    draw(8, 20, 4, 12, 4, 52, 4, 12);
  }

  @override
  bool shouldRepaint(SkinBodyPainter old) => old.image != image;
}

class LocalSkinBodyImage extends StatefulWidget {
  final String filePath;
  final double height;
  const LocalSkinBodyImage({super.key, required this.filePath, required this.height});

  @override
  State<LocalSkinBodyImage> createState() => LocalSkinBodyImageState();
}

class LocalSkinBodyImageState extends State<LocalSkinBodyImage> {
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(LocalSkinBodyImage old) {
    super.didUpdateWidget(old);
    if (old.filePath != widget.filePath) _load();
  }

  Future<void> _load() async {
    try {
      final bytes = await File(widget.filePath).readAsBytes();
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();
      if (mounted) setState(() => _image = frame.image);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final h = widget.height;
    final w = h / 2;
    if (_image == null) {
      return SizedBox(
        width: w,
        height: h,
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.personRunning,
            color: AppTheme.textMuted,
            size: 22,
          ),
        ),
      );
    }
    return CustomPaint(size: Size(w, h), painter: SkinBodyPainter(_image!));
  }
}
