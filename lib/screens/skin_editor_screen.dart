import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../theme/app_theme.dart';
import '../models/saved_skin.dart';
import '../util/saved_skins_storage.dart';
import '../services/skin_upload_service.dart';
import '../services/auth_service.dart';
import '../widgets/skin_3d_viewer.dart';
import '../widgets/components/app_toast.dart';
import '../l10n/app_localizations.dart';

enum _Tool { draw, fill, erase }

class SkinEditorScreen extends StatefulWidget {
  final String? initialTextureUrl;
  final SavedSkin? existingSkin;
  final Map<String, dynamic>? cloudSkin;

  const SkinEditorScreen({
    super.key,
    this.initialTextureUrl,
    this.existingSkin,
    this.cloudSkin,
  });

  @override
  State<SkinEditorScreen> createState() => _SkinEditorScreenState();
}

class _SkinEditorScreenState extends State<SkinEditorScreen>
    with SingleTickerProviderStateMixin {
  static const int _sz = 64;

  late Uint8List _pixels;
  bool _loading = true;
  String? _sessionCloudSkinId;

  _Tool _activeTool = _Tool.draw;
  Color _activeColor = const Color(0xFF3F51B5);
  bool _rotateMode = true;
  bool _uvMode = false;
  bool _panModeUV = false;
  bool _outerLayer = false;

  double _rotY = 0.4;
  double _rotX = 0.1;
  late final AnimationController _spinCtrl;
  double _spinVelocityY = 0;
  double _spinVelocityX = 0;
  Size _canvasSize = Size.zero;

  static const double _canvasPx = 640.0;
  final _transformCtrl = TransformationController();
  final _uvCanvasKey = GlobalKey();
  final _exportButtonKey = GlobalKey();
  bool _activeStroke2D = false;

  ui.Image? _previewImage;
  Timer? _previewTimer;

  final List<Uint8List> _undoStack = [];
  static const int _maxUndo = 20;

  bool _activeStroke = false;
  bool _showUVTemplate = true;

  @override
  void initState() {
    super.initState();
    _pixels = Uint8List(_sz * _sz * 4);
    _spinCtrl = AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..addListener(_onSpinTick);
    _updatePreview(); // render blank canvas immediately so gestures work before texture loads
    _init();
  }

  void _onSpinTick() {
    if (!_rotateMode) return;
    _spinVelocityY *= 0.92;
    _spinVelocityX *= 0.92;
    if (_spinVelocityY.abs() < 0.001 && _spinVelocityX.abs() < 0.001) {
      _spinCtrl.stop();
      return;
    }
    setState(() {
      _rotY -= _spinVelocityY;
      if (_rotY > pi) _rotY -= 2 * pi;
      if (_rotY < -pi) _rotY += 2 * pi;
      _rotX -= _spinVelocityX;
      _rotX = _rotX.clamp(-pi / 2, pi / 2);
    });
  }

  @override
  void dispose() {
    _spinCtrl.dispose();
    _previewTimer?.cancel();
    _transformCtrl.dispose();
    super.dispose();
  }

  static const _steveSkinUrl = 'https://textures.minecraft.net/texture/31f477eb1a7beee631c2ca64d06f8f68fa93a3386d04452ab27f43acdf1b60cb';

  Future<void> _init() async {
    Uint8List? rawBytes;

    if (widget.existingSkin != null) {
      try {
        rawBytes = await File(widget.existingSkin!.filePath).readAsBytes();
      } catch (_) {}
    } else if (widget.cloudSkin != null) {
      try {
        final url = (widget.cloudSkin!['public_url'] ?? widget.cloudSkin!['publicUrl']) as String;
        final resp = await http.get(Uri.parse(url), headers: {'User-Agent': 'MCCompanionApp/1.0'}).timeout(const Duration(seconds: 10));
        rawBytes = resp.bodyBytes;
      } catch (_) {}
    } else if (widget.initialTextureUrl != null) {
      try {
        final resp = await http
            .get(
              Uri.parse(widget.initialTextureUrl!),
              headers: {'User-Agent': 'MCCompanionApp/1.0'},
            )
            .timeout(const Duration(seconds: 10));
        rawBytes = resp.bodyBytes;
      } catch (_) {}
    }

    if (rawBytes == null) {
      try {
        final resp = await http.get(Uri.parse(_steveSkinUrl), headers: {'User-Agent': 'MCCompanionApp/1.0'}).timeout(const Duration(seconds: 10));
        rawBytes = resp.bodyBytes;
      } catch (_) {}
    }

    if (rawBytes != null) {
      try {
        final codec = await ui.instantiateImageCodec(rawBytes);
        final frame = await codec.getNextFrame();
        final img = frame.image;
        final bd = await img.toByteData(format: ui.ImageByteFormat.rawRgba);
        if (bd != null && img.width == _sz && img.height == _sz) {
          _pixels = bd.buffer.asUint8List();
        }
      } catch (_) {}
    }

    if (mounted) {
      setState(() => _loading = false);
      _updatePreview();
    }
  }

  void _pushUndo() {
    _undoStack.add(Uint8List.fromList(_pixels));
    if (_undoStack.length > _maxUndo) _undoStack.removeAt(0);
  }

  void _undo() {
    if (_undoStack.isEmpty) return;
    setState(() => _pixels = _undoStack.removeLast());
    _updatePreview();
  }

  void _schedulePreview() {
    _previewTimer?.cancel();
    _previewTimer = Timer(const Duration(milliseconds: 80), _updatePreview);
  }

  Future<void> _updatePreview() async {
    final c = Completer<ui.Image>();
    ui.decodeImageFromPixels(
      Uint8List.fromList(_pixels),
      _sz,
      _sz,
      ui.PixelFormat.rgba8888,
      c.complete,
    );
    final img = await c.future;
    if (mounted) setState(() => _previewImage = img);
  }

  void _paintPixel(int tx, int ty) {
    final i = (ty * _sz + tx) * 4;
    if (_activeTool == _Tool.erase) {
      if (_pixels[i + 3] == 0) return;
      _pixels[i] = 0;
      _pixels[i + 1] = 0;
      _pixels[i + 2] = 0;
      _pixels[i + 3] = 0;
    } else {
      final r = _activeColor.red,
          g = _activeColor.green,
          b = _activeColor.blue,
          a = _activeColor.alpha;
      if (_pixels[i] == r &&
          _pixels[i + 1] == g &&
          _pixels[i + 2] == b &&
          _pixels[i + 3] == a)
        return;
      _pixels[i] = r;
      _pixels[i + 1] = g;
      _pixels[i + 2] = b;
      _pixels[i + 3] = a;
    }
    setState(() {});
    _schedulePreview();
  }

  void _floodFill(int sx, int sy) {
    _pushUndo();
    final si = (sy * _sz + sx) * 4;
    final tr = _pixels[si],
        tg = _pixels[si + 1],
        tb = _pixels[si + 2],
        ta = _pixels[si + 3];
    final nr = _activeColor.red,
        ng = _activeColor.green,
        nb = _activeColor.blue,
        na = _activeColor.alpha;
    if (tr == nr && tg == ng && tb == nb && ta == na) return;
    final q = Queue<(int, int)>()..add((sx, sy));
    while (q.isNotEmpty) {
      final (x, y) = q.removeFirst();
      if (x < 0 || x >= _sz || y < 0 || y >= _sz) continue;
      final i = (y * _sz + x) * 4;
      if (_pixels[i] != tr ||
          _pixels[i + 1] != tg ||
          _pixels[i + 2] != tb ||
          _pixels[i + 3] != ta)
        continue;
      _pixels[i] = nr;
      _pixels[i + 1] = ng;
      _pixels[i + 2] = nb;
      _pixels[i + 3] = na;
      q.add((x + 1, y));
      q.add((x - 1, y));
      q.add((x, y + 1));
      q.add((x, y - 1));
    }
    setState(() {});
    _updatePreview();
  }

  (int, int)? _hitTest(Offset point) {
    if (_canvasSize == Size.zero) return null;
    final faces = buildProjectedFaces(
      rotY: _rotY,
      rotX: _rotX,
      slim: false,
      canvasSize: _canvasSize,
    );
    final wantBase = !_outerLayer;
    for (int i = faces.length - 1; i >= 0; i--) {
      final face = faces[i];
      if (face.isBase != wantBase) continue;
      final p = face.screen;
      final uv = face.uvs;

      final b0 = _barycentricCoords(point, p[0], p[1], p[2]);
      if (b0 != null) {
        final u = (b0.$1 * uv[0].dx + b0.$2 * uv[1].dx + b0.$3 * uv[2].dx)
            .floor()
            .clamp(0, 63);
        final v = (b0.$1 * uv[0].dy + b0.$2 * uv[1].dy + b0.$3 * uv[2].dy)
            .floor()
            .clamp(0, 63);
        return (u, v);
      }
      final b1 = _barycentricCoords(point, p[0], p[2], p[3]);
      if (b1 != null) {
        final u = (b1.$1 * uv[0].dx + b1.$2 * uv[2].dx + b1.$3 * uv[3].dx)
            .floor()
            .clamp(0, 63);
        final v = (b1.$1 * uv[0].dy + b1.$2 * uv[2].dy + b1.$3 * uv[3].dy)
            .floor()
            .clamp(0, 63);
        return (u, v);
      }
    }
    return null;
  }

  static (double, double, double)? _barycentricCoords(
    Offset p,
    Offset a,
    Offset b,
    Offset c,
  ) {
    final v0x = b.dx - a.dx, v0y = b.dy - a.dy;
    final v1x = c.dx - a.dx, v1y = c.dy - a.dy;
    final v2x = p.dx - a.dx, v2y = p.dy - a.dy;
    final d00 = v0x * v0x + v0y * v0y;
    final d01 = v0x * v1x + v0y * v1y;
    final d11 = v1x * v1x + v1y * v1y;
    final d20 = v2x * v0x + v2y * v0y;
    final d21 = v2x * v1x + v2y * v1y;
    final denom = d00 * d11 - d01 * d01;
    if (denom.abs() < 1e-10) return null;
    final wB = (d11 * d20 - d01 * d21) / denom;
    final wC = (d00 * d21 - d01 * d20) / denom;
    final wA = 1 - wB - wC;
    if (wA < 0 || wB < 0 || wC < 0) return null;
    return (wA, wB, wC);
  }

  void _paintAt(Offset localPos) {
    final hit = _hitTest(localPos);
    if (hit == null) return;
    final (tx, ty) = hit;
    if (_activeTool == _Tool.fill) {
      _floodFill(tx, ty);
    } else {
      _paintPixel(tx, ty);
    }
  }

  void _zoomUV(double factor) {
    final current = _transformCtrl.value.clone();
    const cx = _canvasPx / 2;
    const cy = _canvasPx / 2;
    final m = Matrix4.identity()
      ..translate(cx, cy)
      ..scale(factor, factor)
      ..translate(-cx, -cy);
    m.multiply(current);
    final scale = m.getMaxScaleOnAxis();
    if (scale < 0.99 || scale > 20.0) return;
    _transformCtrl.value = m;
  }

  void _resetZoomUV() {
    _transformCtrl.value = Matrix4.identity();
  }

  void _pixelFromGlobal(Offset global) {
    final box = _uvCanvasKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;
    final local = box.globalToLocal(global);
    final size = box.size;
    final x = (local.dx / size.width * _sz).floor().clamp(0, _sz - 1);
    final y = (local.dy / size.height * _sz).floor().clamp(0, _sz - 1);
    if (_activeTool == _Tool.fill) {
      _floodFill(x, y);
    } else {
      _paintPixel(x, y);
    }
  }

  void _onPanStart(DragStartDetails d) {
    if (_rotateMode) return;
    _activeStroke = true;
    if (_activeTool != _Tool.fill) _pushUndo();
    _paintAt(d.localPosition);
  }

  void _onPanUpdate(DragUpdateDetails d) {
    if (_rotateMode) {
      _spinCtrl.stop();
      setState(() {
        _rotY -= d.delta.dx / _canvasSize.width * 2 * pi;
        if (_rotY > pi) _rotY -= 2 * pi;
        if (_rotY < -pi) _rotY += 2 * pi;
        _rotX -= d.delta.dy / _canvasSize.height * 2 * pi;
        if (_rotX > pi) _rotX -= 2 * pi;
        if (_rotX < -pi) _rotX += 2 * pi;
      });
      return;
    }
    if (!_activeStroke) return;
    _paintAt(d.localPosition);
  }

  void _onPanEnd(DragEndDetails d) {
    if (_rotateMode) {
      final vx = d.velocity.pixelsPerSecond.dx;
      final vy = d.velocity.pixelsPerSecond.dy;
      if (vx.abs() > 50 || vy.abs() > 50) {
        _spinVelocityY = vx / _canvasSize.width * 2 * pi * 0.016;
        _spinVelocityX = vy / _canvasSize.height * 2 * pi * 0.016;
        _spinCtrl.repeat();
      }
      return;
    }
    _activeStroke = false;
  }

  void _onTapDown(TapDownDetails d) {
    if (_rotateMode) return;
    if (_activeTool != _Tool.fill) _pushUndo();
    _paintAt(d.localPosition);
  }

  Future<void> _saveToCloud() async {
    final pngBytes = await _toPng();
    if (pngBytes == null) return;

    if (widget.cloudSkin != null) {
      await _saveSkin();
      return;
    }

    final l = AppLocalizations.of(context)!;
    String name = widget.existingSkin?.name ?? '';
    if (name.isEmpty && _sessionCloudSkinId == null) {
      final ctrl = TextEditingController(text: l.skinDefaultName);
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) {
          final ll = AppLocalizations.of(ctx)!;
          return AlertDialog(
            backgroundColor: AppTheme.surface,
            title: Text(ll.skinUploadToCloud, style: TextStyle(color: AppTheme.textPrimary, fontSize: 16, fontWeight: FontWeight.w700)),
            content: TextField(
              controller: ctrl,
              autofocus: true,
              style: TextStyle(color: AppTheme.textPrimary),
              decoration: InputDecoration(
                hintText: ll.skinNameHint,
                hintStyle: TextStyle(color: AppTheme.textMuted),
                filled: true,
                fillColor: AppTheme.background,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppTheme.borderGray)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppTheme.borderGray)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppTheme.accent)),
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(ll.cancel, style: TextStyle(color: AppTheme.textMuted))),
              FilledButton(onPressed: () => Navigator.pop(ctx, true), style: FilledButton.styleFrom(backgroundColor: AppTheme.accent), child: Text(ll.skinsUpload)),
            ],
          );
        },
      );
      if (confirmed != true || !mounted) return;
      name = ctrl.text.trim().isEmpty ? l.skinDefaultName : ctrl.text.trim();
    }

    try {
      _sessionCloudSkinId ??= widget.existingSkin?.id ?? DateTime.now().millisecondsSinceEpoch.toString();
      final skinId = _sessionCloudSkinId!;
      final dir = await getTemporaryDirectory();
      final tmp = File('${dir.path}/$skinId.png');
      await tmp.writeAsBytes(pngBytes);
      await SkinUploadService.uploadSkin(skinId: skinId, name: name, filePath: tmp.path);
      await tmp.delete();
      if (mounted) {
        AppToast.show(context, message: l.skinUploaded, icon: Icons.cloud_done_outlined, color: AppTheme.success, duration: const Duration(seconds: 2));
        Navigator.pop(context, 'cloud');
      }
    } catch (e) {
      if (mounted) AppToast.show(context, message: l.skinUploadFailed(e.toString().replaceAll('Exception: ', '')), icon: Icons.error_outline_rounded, color: AppTheme.error);
    }
  }

  Future<void> _saveSkin() async {
    final pngBytes = await _toPng();
    if (pngBytes == null) return;

    if (widget.cloudSkin != null) {
      final l = AppLocalizations.of(context)!;
      final skinId = widget.cloudSkin!['id'] as String;
      final name = widget.cloudSkin!['name'] as String? ?? l.skinDefaultName;
      try {
        final dir = await getTemporaryDirectory();
        final tmp = File('${dir.path}/$skinId.png');
        await tmp.writeAsBytes(pngBytes);
        await SkinUploadService.uploadSkin(skinId: skinId, name: name, filePath: tmp.path);
        await tmp.delete();
        if (mounted) {
          AppToast.show(context, message: l.skinUpdatedInCloud, icon: Icons.check_circle_outline_rounded, color: AppTheme.success, duration: const Duration(seconds: 2));
          Navigator.pop(context, 'cloud');
        }
      } catch (e) {
        if (mounted) AppToast.show(context, message: l.skinUploadFailed(e.toString().replaceAll('Exception: ', '')), icon: Icons.error_outline_rounded, color: AppTheme.error);
      }
      return;
    }

    if (widget.existingSkin != null) {
      await SavedSkinsStorage.update(widget.existingSkin!.id, pngBytes);
      if (mounted) {
        AppToast.show(
          context,
          message: AppLocalizations.of(context)!.skinSaved,
          icon: Icons.check_circle_outline_rounded,
          color: AppTheme.success,
          duration: const Duration(seconds: 2),
        );
      }
      return;
    }

    final l2 = AppLocalizations.of(context)!;
    final nameCtrl = TextEditingController(text: l2.skinDefaultName);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        final ll = AppLocalizations.of(ctx)!;
        return AlertDialog(
          backgroundColor: AppTheme.surface,
          title: Text(
            ll.skinSaveDialog,
            style: TextStyle(color: AppTheme.textPrimary, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          content: TextField(
            controller: nameCtrl,
            autofocus: true,
            style: TextStyle(color: AppTheme.textPrimary),
            decoration: InputDecoration(
              hintText: ll.skinNameHint,
              hintStyle: TextStyle(color: AppTheme.textMuted),
              filled: true,
              fillColor: AppTheme.background,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppTheme.borderGray)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppTheme.borderGray)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppTheme.accent)),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(ll.cancel, style: TextStyle(color: AppTheme.textMuted))),
            FilledButton(onPressed: () => Navigator.pop(ctx, true), style: FilledButton.styleFrom(backgroundColor: AppTheme.accent), child: Text(ll.save)),
          ],
        );
      },
    );
    if (confirmed != true || !mounted) return;
    final name = nameCtrl.text.trim().isEmpty ? l2.skinDefaultName : nameCtrl.text.trim();
    await SavedSkinsStorage.add(pngBytes, name);
    if (mounted) {
      AppToast.show(
        context,
        message: AppLocalizations.of(context)!.skinSavedAs(name),
        icon: Icons.check_circle_outline_rounded,
        color: AppTheme.success,
        duration: const Duration(seconds: 2),
      );
    }
  }

  Future<Uint8List?> _toPng() async {
    try {
      final c = Completer<ui.Image>();
      ui.decodeImageFromPixels(
        Uint8List.fromList(_pixels),
        _sz,
        _sz,
        ui.PixelFormat.rgba8888,
        c.complete,
      );
      final img = await c.future;
      final bytes = await img.toByteData(format: ui.ImageByteFormat.png);
      return bytes?.buffer.asUint8List();
    } catch (_) {
      return null;
    }
  }

  Future<void> _export() async {
    final bytes = await _toPng();
    if (bytes == null) {
      if (mounted)
        AppToast.show(
          context,
          message: AppLocalizations.of(context)!.skinExportFailed,
          icon: Icons.error_outline_rounded,
          color: AppTheme.error,
        );
      return;
    }
    try {
      final dir = await getTemporaryDirectory();
      final file = File(
        '${dir.path}/skin_${DateTime.now().millisecondsSinceEpoch}.png',
      );
      await file.writeAsBytes(bytes);

      if (Platform.isIOS || Platform.isAndroid) {
        final box = _exportButtonKey.currentContext?.findRenderObject() as RenderBox?;
        final result = await Share.shareXFiles(
          [XFile(file.path, mimeType: 'image/png')],
          subject: 'Minecraft Skin',
          sharePositionOrigin: box != null
              ? box.localToGlobal(Offset.zero) & box.size
              : null,
        );
        if (result.status == ShareResultStatus.dismissed) return;
      } else {
        final saveDir = await getApplicationDocumentsDirectory();
        final dest = File(
          '${saveDir.path}/skin_${DateTime.now().millisecondsSinceEpoch}.png',
        );
        await file.copy(dest.path);
        if (mounted) {
          AppToast.show(
            context,
            message: AppLocalizations.of(context)!.skinExported,
            icon: Icons.download_done_rounded,
            color: AppTheme.success,
            duration: const Duration(seconds: 4),
          );
        }
      }
    } catch (e) {
      if (mounted)
        AppToast.show(
          context,
          message: AppLocalizations.of(context)!.skinExportFailed,
          icon: Icons.error_outline_rounded,
          color: AppTheme.error,
          duration: const Duration(seconds: 4),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.surface,
        foregroundColor: AppTheme.textPrimary,
        elevation: 0,
        title: Text(
          'Skin Editor',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
          ),
        ),
        iconTheme: IconThemeData(color: AppTheme.textPrimary),
        actions: [
          IconButton(
            onPressed: _undoStack.isNotEmpty ? _undo : null,
            icon: const FaIcon(FontAwesomeIcons.rotateLeft, size: 15),
            tooltip: 'Undo',
          ),
          if (widget.cloudSkin == null)
            IconButton(
              onPressed: _saveSkin,
              icon: const FaIcon(FontAwesomeIcons.floppyDisk, size: 15),
              tooltip: 'Save to My Skins',
            ),
          if (AuthService.currentUser != null)
            IconButton(
              onPressed: _saveToCloud,
              icon: const FaIcon(FontAwesomeIcons.cloudArrowUp, size: 15),
              tooltip: widget.cloudSkin != null ? 'Update in cloud' : 'Upload to cloud',
            ),
          IconButton(
            key: _exportButtonKey,
            onPressed: _export,
            icon: const FaIcon(FontAwesomeIcons.download, size: 15),
            tooltip: 'Export PNG',
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: ExcludeSemantics(
          child: _loading
              ? Center(child: CircularProgressIndicator(color: AppTheme.accent))
              : Column(
                  children: [
                    _buildToolbar(),
                    Expanded(child: _build3DCanvas()),
                    _buildPalette(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildToolbar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border(bottom: BorderSide(color: AppTheme.borderGray)),
      ),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _ToolButton(
                    icon: FontAwesomeIcons.pencil,
                    label: 'Draw',
                    active: _activeTool == _Tool.draw && !_rotateMode && !_panModeUV,
                    onTap: () => setState(() {
                      _activeTool = _Tool.draw;
                      _rotateMode = false;
                      _panModeUV = false;
                    }),
                  ),
                  const SizedBox(width: 6),
                  _ToolButton(
                    icon: FontAwesomeIcons.fillDrip,
                    label: 'Fill',
                    active: _activeTool == _Tool.fill && !_rotateMode && !_panModeUV,
                    onTap: () => setState(() {
                      _activeTool = _Tool.fill;
                      _rotateMode = false;
                      _panModeUV = false;
                    }),
                  ),
                  const SizedBox(width: 6),
                  _ToolButton(
                    icon: FontAwesomeIcons.eraser,
                    label: 'Erase',
                    active: _activeTool == _Tool.erase && !_rotateMode && !_panModeUV,
                    onTap: () => setState(() {
                      _activeTool = _Tool.erase;
                      _rotateMode = false;
                      _panModeUV = false;
                    }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: () => setState(() => _outerLayer = !_outerLayer),
            child: Builder(builder: (ctx) {
              final l = AppLocalizations.of(ctx)!;
              return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: _outerLayer
                    ? const Color(0xFFFFA726).withValues(alpha: 0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _outerLayer ? const Color(0xFFFFA726) : AppTheme.borderGray,
                  width: _outerLayer ? 1.5 : 1,
                ),
              ),
              child: Text(
                _outerLayer ? l.skinLayerOuter : l.skinLayerInner,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: _outerLayer ? const Color(0xFFFFA726) : AppTheme.textMuted,
                ),
              ),
            );
          }),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: () => setState(() {
              _uvMode = !_uvMode;
              _rotateMode = false;
              _panModeUV = false;
            }),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: _uvMode
                    ? AppTheme.accent.withValues(alpha: 0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _uvMode ? AppTheme.accent : AppTheme.borderGray,
                  width: _uvMode ? 1.5 : 1,
                ),
              ),
              child: Text(
                _uvMode ? '3D' : 'UV',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: _uvMode ? AppTheme.accent : AppTheme.textMuted,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: _openColorPicker,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: _activeColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.borderLight, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _build3DCanvas() {
    return _uvMode ? _buildUVCanvas() : _build3DCharCanvas();
  }

  Widget _build3DCharCanvas() {
    return Container(
      color: const Color(0xFF0D0D14),
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              _canvasSize = constraints.biggest;
              return GestureDetector(
                onPanStart: _onPanStart,
                onPanUpdate: _onPanUpdate,
                onPanEnd: _onPanEnd,
                onTapDown: _onTapDown,
                child: _previewImage == null
                    ? Center(
                        child: CircularProgressIndicator(color: AppTheme.accent),
                      )
                    : CustomPaint(
                        size: _canvasSize,
                        painter: _Skin3DEditorPainter(_previewImage!, _rotY, _rotX),
                      ),
              );
            },
          ),
          Positioned(
            right: 12,
            top: 12,
            child: _ZoomBtn(
              icon: FontAwesomeIcons.rotate,
              active: _rotateMode,
              onTap: () => setState(() => _rotateMode = !_rotateMode),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUVCanvas() {
    return Container(
      color: const Color(0xFF111118),
      child: Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: InteractiveViewer(
                transformationController: _transformCtrl,
                minScale: 0.8,
                maxScale: 20.0,
                child: IgnorePointer(
                  ignoring: _panModeUV,
                  child: GestureDetector(
                    onPanStart: (d) {
                      _activeStroke2D = true;
                      if (_activeTool != _Tool.fill) _pushUndo();
                      _pixelFromGlobal(d.globalPosition);
                    },
                    onPanUpdate: (d) {
                      if (!_activeStroke2D) return;
                      _pixelFromGlobal(d.globalPosition);
                    },
                    onPanEnd: (_) => _activeStroke2D = false,
                    onTapDown: (d) {
                      if (_activeTool != _Tool.fill) _pushUndo();
                      _pixelFromGlobal(d.globalPosition);
                    },
                    child: SizedBox(
                      key: _uvCanvasKey,
                      width: _canvasPx,
                      height: _canvasPx,
                      child: CustomPaint(
                        painter: _PixelGridPainter(_pixels),
                        foregroundPainter: _showUVTemplate
                            ? const _UVTemplatePainter()
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 12,
            bottom: 12,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _ZoomBtn(
                  icon: FontAwesomeIcons.hand,
                  active: _panModeUV,
                  onTap: () => setState(() => _panModeUV = !_panModeUV),
                ),
                const SizedBox(height: 6),
                _ZoomBtn(
                  icon: FontAwesomeIcons.tableCells,
                  active: _showUVTemplate,
                  onTap: () =>
                      setState(() => _showUVTemplate = !_showUVTemplate),
                ),
              ],
            ),
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _ZoomBtn(
                  icon: FontAwesomeIcons.magnifyingGlassPlus,
                  onTap: () => _zoomUV(1.5),
                ),
                const SizedBox(height: 6),
                _ZoomBtn(
                  icon: FontAwesomeIcons.magnifyingGlassMinus,
                  onTap: () => _zoomUV(1 / 1.5),
                ),
                const SizedBox(height: 6),
                _ZoomBtn(icon: FontAwesomeIcons.maximize, onTap: _resetZoomUV),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPalette() {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border(top: BorderSide(color: AppTheme.borderGray)),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _palette.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (_, i) {
          final c = _palette[i];
          final selected =
              _activeColor.value == c.value && _activeTool != _Tool.erase;
          return GestureDetector(
            onTap: () => setState(() {
              _activeColor = c;
              _activeTool = _Tool.draw;
              _rotateMode = false;
            }),
            child: _PaletteCell(color: c, selected: selected),
          );
        },
      ),
    );
  }

  void _openColorPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _ColorPickerSheet(
        initial: _activeColor,
        onPicked: (c) => setState(() {
          _activeColor = c;
          _activeTool = _Tool.draw;
          _rotateMode = false;
        }),
      ),
    );
  }
}

class _ZoomBtn extends StatelessWidget {
  final FaIconData icon;
  final VoidCallback onTap;
  final bool active;
  const _ZoomBtn({
    required this.icon,
    required this.onTap,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: active
              ? AppTheme.accent.withValues(alpha: 0.18)
              : AppTheme.surface.withValues(alpha: 0.92),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: active ? AppTheme.accent : AppTheme.borderGray,
            width: active ? 1.5 : 1.0,
          ),
        ),
        child: Center(
          child: FaIcon(
            icon,
            size: 13,
            color: active ? AppTheme.accent : AppTheme.textSecondary,
          ),
        ),
      ),
    );
  }
}

typedef _UVRegion = ({
  String label,
  int x1,
  int y1,
  int x2,
  int y2,
  Color color,
});

const _uvRegions = <_UVRegion>[
  (label: 'Head', x1: 0, y1: 0, x2: 32, y2: 16, color: Color(0xFF4FC3F7)),
  (label: 'Hat', x1: 32, y1: 0, x2: 64, y2: 16, color: Color(0xFF0288D1)),
  (label: 'R.Leg', x1: 0, y1: 16, x2: 16, y2: 32, color: Color(0xFF81C784)),
  (label: 'Body', x1: 16, y1: 16, x2: 40, y2: 32, color: Color(0xFFFFCC80)),
  (label: 'R.Arm', x1: 40, y1: 16, x2: 64, y2: 32, color: Color(0xFFEF9A9A)),
  (label: 'R.Leg+', x1: 0, y1: 32, x2: 16, y2: 48, color: Color(0xFF66BB6A)),
  (label: 'Body+', x1: 16, y1: 32, x2: 40, y2: 48, color: Color(0xFFFFA726)),
  (label: 'R.Arm+', x1: 40, y1: 32, x2: 64, y2: 48, color: Color(0xFFEF5350)),
  (label: 'L.Leg+', x1: 0, y1: 48, x2: 16, y2: 64, color: Color(0xFF43A047)),
  (label: 'L.Leg', x1: 16, y1: 48, x2: 32, y2: 64, color: Color(0xFFA5D6A7)),
  (label: 'L.Arm', x1: 32, y1: 48, x2: 48, y2: 64, color: Color(0xFFE57373)),
  (label: 'L.Arm+', x1: 48, y1: 48, x2: 64, y2: 64, color: Color(0xFFC62828)),
];

class _PixelGridPainter extends CustomPainter {
  final Uint8List pixels;
  _PixelGridPainter(this.pixels);
  static const int _sz = 64;

  @override
  void paint(Canvas canvas, Size size) {
    final px = size.width / _sz;
    final paint = Paint()..isAntiAlias = false;

    final ckA = Paint()..color = const Color(0xFF555566);
    final ckB = Paint()..color = const Color(0xFF444455);
    for (int y = 0; y < _sz; y++) {
      for (int x = 0; x < _sz; x++) {
        canvas.drawRect(
          Rect.fromLTWH(x * px, y * px, px, px),
          (x + y).isEven ? ckA : ckB,
        );
      }
    }

    for (int y = 0; y < _sz; y++) {
      for (int x = 0; x < _sz; x++) {
        final i = (y * _sz + x) * 4;
        final a = pixels[i + 3];
        if (a == 0) continue;
        paint.color = Color.fromARGB(
          a,
          pixels[i],
          pixels[i + 1],
          pixels[i + 2],
        );
        canvas.drawRect(Rect.fromLTWH(x * px, y * px, px, px), paint);
      }
    }

    if (px >= 4) {
      final grid = Paint()
        ..color = Colors.white.withValues(alpha: 0.08)
        ..strokeWidth = 0.5;
      for (int i = 0; i <= _sz; i++) {
        canvas.drawLine(Offset(i * px, 0), Offset(i * px, size.height), grid);
        canvas.drawLine(Offset(0, i * px), Offset(size.width, i * px), grid);
      }
    }

    final div = Paint()
      ..color = Colors.white.withValues(alpha: 0.18)
      ..strokeWidth = 0.8;
    for (final y in [16, 32, 48]) {
      canvas.drawLine(Offset(0, y * px), Offset(size.width, y * px), div);
    }
    for (final x in [16, 32, 40, 48, 56]) {
      canvas.drawLine(Offset(x * px, 0), Offset(x * px, size.height), div);
    }
  }

  @override
  bool shouldRepaint(_PixelGridPainter old) => true;
}

class _UVTemplatePainter extends CustomPainter {
  const _UVTemplatePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final px = size.width / 64;

    for (final r in _uvRegions) {
      final regionW = (r.x2 - r.x1) * px;
      final regionH = (r.y2 - r.y1) * px;
      final rect = Rect.fromLTWH(r.x1 * px, r.y1 * px, regionW, regionH);

      canvas.drawRect(rect, Paint()..color = r.color.withValues(alpha: 0.18));
      canvas.drawRect(
        rect,
        Paint()
          ..color = r.color.withValues(alpha: 0.65)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2,
      );

      if (regionW < 20 || regionH < 14) continue;

      final tp = TextPainter(
        text: TextSpan(
          text: r.label,
          style: TextStyle(
            color: r.color,
            fontSize: (regionW * 0.13).clamp(7.0, 11.0),
            fontWeight: FontWeight.w700,
            shadows: const [Shadow(color: Colors.black, blurRadius: 3)],
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: regionW - 4);

      tp.paint(
        canvas,
        Offset(
          rect.left + (regionW - tp.width) / 2,
          rect.top + (regionH - tp.height) / 2,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(_UVTemplatePainter old) => false;
}

class _Skin3DEditorPainter extends CustomPainter {
  final ui.Image image;
  final double rotY;
  final double rotX;
  const _Skin3DEditorPainter(this.image, this.rotY, this.rotX);

  @override
  void paint(Canvas canvas, Size size) {
    final faces = buildProjectedFaces(
      rotY: rotY,
      rotX: rotX,
      slim: false,
      canvasSize: size,
    );
    drawSkinFaces(canvas, image, faces);
  }

  @override
  bool shouldRepaint(_Skin3DEditorPainter old) =>
      old.rotY != rotY || old.rotX != rotX || old.image != image;
}

class _PaletteCell extends StatelessWidget {
  final Color color;
  final bool selected;
  const _PaletteCell({required this.color, required this.selected});

  @override
  Widget build(BuildContext context) {
    final isTransparent = color.alpha == 0;
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: selected ? AppTheme.accent : AppTheme.borderGray,
          width: selected ? 2.5 : 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: isTransparent
            ? CustomPaint(painter: _CheckerPainter())
            : ColoredBox(color: color),
      ),
    );
  }
}

class _CheckerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const n = 4;
    final s = size.width / n;
    final a = Paint()..color = const Color(0xFFAAAAAA);
    final b = Paint()..color = const Color(0xFF666666);
    for (int y = 0; y < n; y++) {
      for (int x = 0; x < n; x++) {
        canvas.drawRect(
          Rect.fromLTWH(x * s, y * s, s, s),
          (x + y).isEven ? a : b,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_) => false;
}

class _ToolButton extends StatelessWidget {
  final FaIconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _ToolButton({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: active
              ? AppTheme.accent.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: active ? AppTheme.accent : AppTheme.borderGray,
            width: active ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              icon,
              size: 11,
              color: active ? AppTheme.accent : AppTheme.textMuted,
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: active ? AppTheme.accent : AppTheme.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorPickerSheet extends StatefulWidget {
  final Color initial;
  final ValueChanged<Color> onPicked;
  const _ColorPickerSheet({required this.initial, required this.onPicked});

  @override
  State<_ColorPickerSheet> createState() => _ColorPickerSheetState();
}

class _ColorPickerSheetState extends State<_ColorPickerSheet> {
  late double _r, _g, _b, _a;
  final _hexCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _r = widget.initial.red.toDouble();
    _g = widget.initial.green.toDouble();
    _b = widget.initial.blue.toDouble();
    _a = widget.initial.alpha.toDouble();
    _syncHex();
  }

  @override
  void dispose() {
    _hexCtrl.dispose();
    super.dispose();
  }

  Color get _current =>
      Color.fromARGB(_a.round(), _r.round(), _g.round(), _b.round());

  void _syncHex() {
    final c = _current;
    _hexCtrl.text =
        '#${c.red.toRadixString(16).padLeft(2, '0')}'
                '${c.green.toRadixString(16).padLeft(2, '0')}'
                '${c.blue.toRadixString(16).padLeft(2, '0')}'
            .toUpperCase();
  }

  void _parseHex(String val) {
    final hex = val.replaceAll('#', '');
    if (hex.length == 6) {
      try {
        final parsed = int.parse('FF$hex', radix: 16);
        final c = Color(parsed);
        setState(() {
          _r = c.red.toDouble();
          _g = c.green.toDouble();
          _b = c.blue.toDouble();
        });
      } catch (_) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(top: BorderSide(color: AppTheme.borderGray)),
      ),
      padding: EdgeInsets.fromLTRB(
        20,
        16,
        20,
        MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppTheme.borderLight,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Text(
            'Custom Colour',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: _current,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.borderLight),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: TextField(
                  controller: _hexCtrl,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 14,
                    fontFamily: 'monospace',
                  ),
                  decoration: InputDecoration(
                    labelText: 'Hex',
                    labelStyle: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 12,
                    ),
                    filled: true,
                    fillColor: AppTheme.surface,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppTheme.borderGray),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppTheme.borderGray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppTheme.accent),
                    ),
                  ),
                  onChanged: (v) {
                    _parseHex(v);
                    setState(() {});
                  },
                  onSubmitted: _parseHex,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _Slider(
            label: 'R',
            value: _r,
            color: Colors.red,
            onChanged: (v) => setState(() {
              _r = v;
              _syncHex();
            }),
          ),
          const SizedBox(height: 8),
          _Slider(
            label: 'G',
            value: _g,
            color: Colors.green,
            onChanged: (v) => setState(() {
              _g = v;
              _syncHex();
            }),
          ),
          const SizedBox(height: 8),
          _Slider(
            label: 'B',
            value: _b,
            color: Colors.blue,
            onChanged: (v) => setState(() {
              _b = v;
              _syncHex();
            }),
          ),
          const SizedBox(height: 8),
          _Slider(
            label: 'A',
            value: _a,
            color: AppTheme.textSecondary,
            onChanged: (v) => setState(() {
              _a = v;
              _syncHex();
            }),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                widget.onPicked(_current);
                Navigator.pop(context);
              },
              style: FilledButton.styleFrom(
                backgroundColor: AppTheme.accent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Apply',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Slider extends StatelessWidget {
  final String label;
  final double value;
  final Color color;
  final ValueChanged<double> onChanged;
  const _Slider({
    required this.label,
    required this.value,
    required this.color,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 14,
          child: Text(
            label,
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: color,
              thumbColor: color,
              inactiveTrackColor: AppTheme.borderGray,
              trackHeight: 3,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
            ),
            child: Slider(value: value, min: 0, max: 255, onChanged: onChanged),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 28,
          child: Text(
            value.round().toString(),
            style: TextStyle(color: AppTheme.textSecondary, fontSize: 11),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

const List<Color> _palette = [
  Color(0x00000000),
  Color(0xFFFFFFFF),
  Color(0xFFE0E0E0),
  Color(0xFFBDBDBD),
  Color(0xFF9E9E9E),
  Color(0xFF616161),
  Color(0xFF424242),
  Color(0xFF212121),
  Color(0xFFFEDFB5),
  Color(0xFFF0C896),
  Color(0xFFDEA870),
  Color(0xFFC8895A),
  Color(0xFFA06040),
  Color(0xFF7A4028),
  Color(0xFF4E2010),
  Color(0xFFFFE082),
  Color(0xFFFFB300),
  Color(0xFFBF360C),
  Color(0xFF6D4C41),
  Color(0xFF4E342E),
  Color(0xFF3E2723),
  Color(0xFFEF5350),
  Color(0xFFE91E63),
  Color(0xFFF48FB1),
  Color(0xFFFF8A65),
  Color(0xFFFF7043),
  Color(0xFFFFCA28),
  Color(0xFFFFF176),
  Color(0xFF66BB6A),
  Color(0xFF2E7D32),
  Color(0xFF1B5E20),
  Color(0xFF42A5F5),
  Color(0xFF1565C0),
  Color(0xFF0D47A1),
  Color(0xFF80DEEA),
  Color(0xFFAB47BC),
  Color(0xFF6A1B9A),
  Color(0xFFCE93D8),
  Color(0xFF8B6914),
  Color(0xFF5A9A2C),
  Color(0xFF7A7A7A),
  Color(0xFF1A1A1A),
  Color(0xFFB86834),
  Color(0xFFFF4500),
  Color(0xFFFAA320),
  Color(0xFF00ACC1),
];
