import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';
import '../widgets/components/header_nav_bar.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';
import '../models/user_model.dart';
import '../models/saved_skin.dart';
import '../util/saved_skins_storage.dart';
import 'skin_editor_screen.dart';
import '../l10n/app_localizations.dart';

class _GeyserSkin {
  final int id;
  final bool isSteve;
  final String textureId;
  String get textureUrl => 'https://textures.minecraft.net/texture/$textureId';
  const _GeyserSkin({
    required this.id,
    required this.isSteve,
    required this.textureId,
  });
}

class _SkinFaceImage extends StatefulWidget {
  final String textureUrl;
  final double size;
  const _SkinFaceImage({required this.textureUrl}) : size = 64;

  @override
  State<_SkinFaceImage> createState() => _SkinFaceImageState();
}

class _SkinFaceImageState extends State<_SkinFaceImage> {
  ui.Image? _image;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(_SkinFaceImage old) {
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
        child: const Center(
          child: FaIcon(
            FontAwesomeIcons.user,
            color: AppTheme.textMuted,
            size: 22,
          ),
        ),
      );
    }
    return CustomPaint(size: Size(s, s), painter: _FacePainter(_image!));
  }
}

class _FacePainter extends CustomPainter {
  final ui.Image image;
  _FacePainter(this.image);

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
  bool shouldRepaint(_FacePainter old) => old.image != image;
}

class _SkinBodyImage extends StatefulWidget {
  final String textureUrl;
  final double height;
  const _SkinBodyImage({required this.textureUrl, this.height = 128});

  @override
  State<_SkinBodyImage> createState() => _SkinBodyImageState();
}

class _SkinBodyImageState extends State<_SkinBodyImage> {
  ui.Image? _image;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(_SkinBodyImage old) {
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
        child: const Center(
          child: FaIcon(
            FontAwesomeIcons.personRunning,
            color: AppTheme.textMuted,
            size: 28,
          ),
        ),
      );
    return CustomPaint(size: Size(w, h), painter: _BodyPainter(_image!));
  }
}

class _BodyPainter extends CustomPainter {
  final ui.Image image;
  _BodyPainter(this.image);

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
  bool shouldRepaint(_BodyPainter old) => old.image != image;
}

class SkinsScreen extends StatefulWidget {
  const SkinsScreen({super.key});

  @override
  State<SkinsScreen> createState() => SkinsScreenState();
}

class SkinsScreenState extends State<SkinsScreen> {
  void refresh() => _loadMe();
  StreamSubscription<AuthUser?>? _authSub;

  UserModel? _me;
  bool _loading = true;

  List<SavedSkin> _savedSkins = [];
  bool _loadingSaved = true;

  List<_GeyserSkin> _recentSkins = [];
  int _page = 1;
  int _totalPages = 10;
  bool _loadingRecent = false;

  @override
  void initState() {
    super.initState();
    _authSub = AuthService.userStream.listen((_) => _loadMe());
    _loadMe();
    _loadRecentSkins(1);
    _loadSavedSkins();
  }

  @override
  void dispose() {
    _authSub?.cancel();
    super.dispose();
  }

  Future<void> _loadMe() async {
    final user = AuthService.currentUser;
    if (user == null) {
      setState(() {
        _me = null;
        _loading = false;
      });
      return;
    }
    setState(() => _loading = true);
    final me = await UserService.getMe();
    if (!mounted) return;
    setState(() {
      _me = me;
      _loading = false;
    });
  }

  Future<void> _loadRecentSkins(int page) async {
    if (_loadingRecent) return;
    setState(() => _loadingRecent = true);
    try {
      final resp = await http
          .get(
            Uri.parse(
              'https://api.geysermc.org/v2/skin/bedrock/recent?page=$page',
            ),
            headers: {'User-Agent': 'MCCompanionApp/1.0'},
          )
          .timeout(const Duration(seconds: 10));
      if (!mounted) return;
      if (resp.statusCode == 200) {
        final json = jsonDecode(resp.body);
        final data = (json['data'] as List?) ?? [];
        final total = json['total_pages'] as int? ?? 10;
        final skins = data
            .map(
              (e) => _GeyserSkin(
                id: e['id'] as int,
                isSteve: e['is_steve'] as bool? ?? false,
                textureId: e['texture_id'] as String,
              ),
            )
            .toList();
        setState(() {
          _recentSkins = skins;
          _page = page;
          _totalPages = total;
          _loadingRecent = false;
        });
        return;
      }
    } catch (_) {}
    if (mounted) setState(() => _loadingRecent = false);
  }

  Future<void> _loadSavedSkins() async {
    final skins = await SavedSkinsStorage.loadAll();
    if (mounted)
      setState(() {
        _savedSkins = skins;
        _loadingSaved = false;
      });
  }

  void _openEditor(String? textureUrl) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (_) => SkinEditorScreen(initialTextureUrl: textureUrl),
          ),
        )
        .then((_) => _loadSavedSkins());
  }

  void _openEditorForSaved(SavedSkin skin) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (_) =>
                SkinEditorScreen(initialTextureUrl: null, existingSkin: skin),
          ),
        )
        .then((_) => _loadSavedSkins());
  }

  Future<void> _uploadSkin() async {
    final l = AppLocalizations.of(context)!;
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png'],
      withData: true,
    );
    if (result == null || result.files.isEmpty) return;
    final file = result.files.first;
    final bytes = file.bytes;
    if (bytes == null) return;

    try {
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();
      final img = frame.image;
      if (img.width != 64 || img.height != 64) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l.skinsMustBe64),
              backgroundColor: AppTheme.error,
            ),
          );
        }
        return;
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l.skinsInvalidFile),
            backgroundColor: AppTheme.error,
          ),
        );
      }
      return;
    }

    if (!mounted) return;
    final name = (file.name.endsWith('.png')
        ? file.name.substring(0, file.name.length - 4)
        : file.name);
    final saved = await SavedSkinsStorage.add(bytes, name);
    await _loadSavedSkins();
    if (mounted) _openEditorForSaved(saved);
  }

  Future<void> _deleteSavedSkin(SavedSkin skin) async {
    await SavedSkinsStorage.delete(skin.id);
    _loadSavedSkins();
  }

  void _openGeyserDetail(String textureUrl) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _SkinDetailSheet(
        textureUrl: textureUrl,
        onEdit: () {
          Navigator.pop(context);
          _openEditor(textureUrl);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: HeaderNavBar(
              items: [
                HeaderNavItem(label: l.skinsUpload, onTap: _uploadSkin),
                HeaderNavItem(
                  label: l.skinsCreate,
                  onTap: () => _openEditor(null),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildSavedSkins(l),
          const SizedBox(height: 28),
          _buildYourSkins(l),
          const SizedBox(height: 28),
          _sectionLabel(l.skinsSectionRecent),
          const SizedBox(height: 10),
          _buildRecentSkins(l),
        ],
      ),
    );
  }

  Widget _buildSavedSkins(AppLocalizations l) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionLabel(l.skinsSectionMy),
        const SizedBox(height: 10),
        if (_loadingSaved)
          SizedBox(
            height: 60,
            child: Center(
              child: CircularProgressIndicator(
                color: AppTheme.accent,
                strokeWidth: 2,
              ),
            ),
          )
        else if (_savedSkins.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppTheme.borderGray),
            ),
            child: Text(
              l.skinsEmptyMySkins,
              style: const TextStyle(color: AppTheme.textMuted, fontSize: 13),
            ),
          )
        else
          SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _savedSkins.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, i) => _SavedSkinCard(
                skin: _savedSkins[i],
                onEdit: () => _openEditorForSaved(_savedSkins[i]),
                onDelete: () => _deleteSavedSkin(_savedSkins[i]),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildYourSkins(AppLocalizations l) {
    if (_loading) {
      return SizedBox(
        height: 60,
        child: Center(
          child: CircularProgressIndicator(
            color: AppTheme.accent,
            strokeWidth: 2,
          ),
        ),
      );
    }

    if (_me == null) return const _NotLoggedInCard();

    final javaAccounts = _me!.javaAccounts;
    final bedrockAccounts = _me!.bedrockAccounts;

    if (javaAccounts.isEmpty && bedrockAccounts.isEmpty) {
      return const _NoAccountsCard();
    }

    final totalCards = javaAccounts.length + bedrockAccounts.length;
    final isSingle = totalCards == 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionLabel(l.skinsSectionYours),
        const SizedBox(height: 10),
        if (isSingle)
          if (javaAccounts.isNotEmpty)
            _JavaSkinCard(
              username: javaAccounts.first.javaUsername,
              javaUuid: javaAccounts.first.javaUuid,
              badge: 'Java',
              badgeColor: const Color(0xFF42A5F5),
              onEdit: _openEditor,
            )
          else
            _BedrockSkinCard(
              gamertag:
                  bedrockAccounts.first.xboxGamertag ??
                  bedrockAccounts.first.xboxXuid,
              xuid: bedrockAccounts.first.xboxXuid,
              onEdit: _openEditor,
            )
        else
          SizedBox(
            height: 210,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: totalCards,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, i) {
                if (i < javaAccounts.length) {
                  final acc = javaAccounts[i];
                  return SizedBox(
                    width: 140,
                    child: _JavaSkinCard(
                      username: acc.javaUsername,
                      javaUuid: acc.javaUuid,
                      badge: l.labelJava,
                      badgeColor: const Color(0xFF42A5F5),
                      onEdit: _openEditor,
                      compact: true,
                    ),
                  );
                }
                final acc = bedrockAccounts[i - javaAccounts.length];
                return SizedBox(
                  width: 140,
                  child: _BedrockSkinCard(
                    gamertag: acc.xboxGamertag ?? acc.xboxXuid,
                    xuid: acc.xboxXuid,
                    onEdit: _openEditor,
                    compact: true,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildRecentSkins(AppLocalizations l) {
    return Column(
      children: [
        if (_loadingRecent)
          SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(
                color: AppTheme.accent,
                strokeWidth: 2,
              ),
            ),
          )
        else if (_recentSkins.isEmpty)
          SizedBox(
            height: 80,
            child: Center(
              child: Text(
                l.skinsCouldNotLoad,
                style: const TextStyle(color: AppTheme.textMuted, fontSize: 13),
              ),
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.52,
            ),
            itemCount: _recentSkins.length,
            itemBuilder: (_, i) {
              final skin = _recentSkins[i];
              return _GeyserSkinChip(
                skin: skin,
                onTap: () => _openGeyserDetail(skin.textureUrl),
              );
            },
          ),
        const SizedBox(height: 12),
        _buildPagination(l),
      ],
    );
  }

  Widget _buildPagination(AppLocalizations l) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: (_page > 1 && !_loadingRecent)
              ? () => _loadRecentSkins(_page - 1)
              : null,
          icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 13),
          style: IconButton.styleFrom(
            foregroundColor: AppTheme.accent,
            disabledForegroundColor: AppTheme.textMuted,
            backgroundColor: AppTheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          l.skinsPageOf(_page, _totalPages),
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
          onPressed: (_page < _totalPages && !_loadingRecent)
              ? () => _loadRecentSkins(_page + 1)
              : null,
          icon: const FaIcon(FontAwesomeIcons.chevronRight, size: 13),
          style: IconButton.styleFrom(
            foregroundColor: AppTheme.accent,
            disabledForegroundColor: AppTheme.textMuted,
            backgroundColor: AppTheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _sectionLabel(String text) => Text(
    text,
    style: const TextStyle(
      color: AppTheme.textMuted,
      fontSize: 11,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.2,
    ),
  );
}

class _SavedSkinCard extends StatelessWidget {
  final SavedSkin skin;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const _SavedSkinCard({
    required this.skin,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: _LocalSkinBodyImage(filePath: skin.filePath, height: 90),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            skin.name,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onEdit,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: AppTheme.accent.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.penToSquare,
                        size: 11,
                        color: AppTheme.accent,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              GestureDetector(
                onTap: onDelete,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 7,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.error.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.trash,
                    size: 11,
                    color: AppTheme.error,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LocalSkinBodyImage extends StatefulWidget {
  final String filePath;
  final double height;
  const _LocalSkinBodyImage({required this.filePath, required this.height});

  @override
  State<_LocalSkinBodyImage> createState() => _LocalSkinBodyImageState();
}

class _LocalSkinBodyImageState extends State<_LocalSkinBodyImage> {
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(_LocalSkinBodyImage old) {
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
        child: const Center(
          child: FaIcon(
            FontAwesomeIcons.personRunning,
            color: AppTheme.textMuted,
            size: 22,
          ),
        ),
      );
    }
    return CustomPaint(size: Size(w, h), painter: _BodyPainter(_image!));
  }
}

class _GeyserSkinChip extends StatelessWidget {
  final _GeyserSkin skin;
  final VoidCallback onTap;
  const _GeyserSkinChip({required this.skin, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: LayoutBuilder(
                  builder: (_, constraints) => Center(
                    child: _SkinBodyImage(
                      textureUrl: skin.textureUrl,
                      height: constraints.maxHeight,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkinDetailSheet extends StatelessWidget {
  final String? username;
  final String? javaUuid;
  final String? textureUrl;
  final VoidCallback? onEdit;
  const _SkinDetailSheet({
    this.username,
    this.javaUuid,
    this.textureUrl,
    this.onEdit,
  });

  String? get _downloadUrl =>
      textureUrl ??
      (javaUuid != null ? 'https://visage.surgeplay.com/skin/$javaUuid' : null);

  Future<void> _download() async {
    final url = _downloadUrl;
    if (url == null) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(top: BorderSide(color: AppTheme.borderGray)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppTheme.borderLight,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          if (username != null)
            Text(
              username!,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          if (username != null) const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: Center(
              child: textureUrl != null
                  ? _SkinBodyImage(textureUrl: textureUrl!, height: 196)
                  : const FaIcon(
                      FontAwesomeIcons.personRunning,
                      color: AppTheme.textMuted,
                      size: 40,
                    ),
            ),
          ),
          const SizedBox(height: 24),
          Builder(
            builder: (context) {
              final l = AppLocalizations.of(context)!;
              return Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: _downloadUrl != null ? _download : null,
                      icon: const FaIcon(FontAwesomeIcons.download, size: 13),
                      label: Text(l.skinsDownload),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppTheme.accent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  if (onEdit != null) ...[
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: onEdit,
                        icon: const FaIcon(
                          FontAwesomeIcons.penToSquare,
                          size: 13,
                        ),
                        label: Text(l.skinsEdit),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppTheme.textSecondary,
                          side: const BorderSide(color: AppTheme.borderGray),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _JavaSkinCard extends StatefulWidget {
  final String username;
  final String javaUuid;
  final String? badge;
  final Color? badgeColor;
  final void Function(String?)? onEdit;
  final bool compact;
  const _JavaSkinCard({
    required this.username,
    required this.javaUuid,
    this.badge,
    this.badgeColor,
    this.onEdit,
    this.compact = false,
  });

  @override
  State<_JavaSkinCard> createState() => _JavaSkinCardState();
}

class _JavaSkinCardState extends State<_JavaSkinCard> {
  String? _textureUrl;

  @override
  void initState() {
    super.initState();
    _fetchTexture();
  }

  Future<void> _fetchTexture() async {
    try {
      final resp = await http
          .get(
            Uri.parse(
              'https://sessionserver.mojang.com/session/minecraft/profile/${widget.javaUuid}',
            ),
            headers: {'User-Agent': 'MCCompanionApp/1.0'},
          )
          .timeout(const Duration(seconds: 8));
      if (!mounted || resp.statusCode != 200) return;
      final url = _extractTextureUrl(resp.body);
      if (url != null && mounted) setState(() => _textureUrl = url);
    } catch (_) {}
  }

  String? _extractTextureUrl(String body) {
    try {
      final props = (jsonDecode(body)['properties'] as List?) ?? [];
      for (final p in props) {
        if (p['name'] == 'textures') {
          final decoded = jsonDecode(
            utf8.decode(base64.decode(p['value'] as String)),
          );
          return decoded['textures']?['SKIN']?['url'] as String?;
        }
      }
    } catch (_) {}
    return null;
  }

  Future<void> _download() async {
    final url =
        _textureUrl ?? 'https://visage.surgeplay.com/skin/${widget.javaUuid}';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  void _openDetail() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _SkinDetailSheet(
        username: widget.username,
        javaUuid: widget.javaUuid,
        textureUrl: _textureUrl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final badge = widget.badge;
    final badgeColor = widget.badgeColor ?? AppTheme.accent;

    final compact = widget.compact;
    final pad = compact ? 10.0 : 14.0;

    return GestureDetector(
      onTap: _openDetail,
      child: Container(
        padding: EdgeInsets.all(pad),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Column(
          children: [
            if (badge != null) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    badge,
                    style: TextStyle(
                      color: badgeColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
            ],
            Expanded(
              child: Center(
                child: LayoutBuilder(
                  builder: (_, constraints) => _textureUrl != null
                      ? _SkinBodyImage(
                          textureUrl: _textureUrl!,
                          height: constraints.maxHeight,
                        )
                      : CircularProgressIndicator(
                          color: AppTheme.accent,
                          strokeWidth: 2,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.username,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _download,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.accent,
                      side: BorderSide(color: AppTheme.accent),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const FaIcon(FontAwesomeIcons.download, size: 11),
                  ),
                ),
                if (widget.onEdit != null) ...[
                  const SizedBox(width: 6),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => widget.onEdit!(_textureUrl),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.textSecondary,
                        side: const BorderSide(color: AppTheme.borderGray),
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.penToSquare,
                        size: 11,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BedrockSkinCard extends StatefulWidget {
  final String gamertag;
  final String xuid;
  final void Function(String?)? onEdit;
  final bool compact;
  const _BedrockSkinCard({
    required this.gamertag,
    required this.xuid,
    this.onEdit,
    this.compact = false,
  });

  @override
  State<_BedrockSkinCard> createState() => _BedrockSkinCardState();
}

class _BedrockSkinCardState extends State<_BedrockSkinCard> {
  String? _textureUrl;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    try {
      final resp = await http
          .get(
            Uri.parse('https://api.geysermc.org/v2/skin/${widget.xuid}'),
            headers: {'User-Agent': 'MCCompanionApp/1.0'},
          )
          .timeout(const Duration(seconds: 8));
      if (!mounted) return;
      if (resp.statusCode == 200) {
        final id = jsonDecode(resp.body)['texture_id'] as String?;
        if (id != null) {
          setState(() {
            _textureUrl = 'https://textures.minecraft.net/texture/$id';
            _loading = false;
          });
          return;
        }
      }
    } catch (_) {}
    if (mounted) setState(() => _loading = false);
  }

  Future<void> _download() async {
    if (_textureUrl == null) return;
    final uri = Uri.parse(_textureUrl!);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  void _openDetail() {
    if (_textureUrl == null) return;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) =>
          _SkinDetailSheet(username: widget.gamertag, textureUrl: _textureUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    final compact = widget.compact;
    final pad = compact ? 10.0 : 14.0;

    return GestureDetector(
      onTap: _openDetail,
      child: Container(
        padding: EdgeInsets.all(pad),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  AppLocalizations.of(context)!.bedrockLabel,
                  style: const TextStyle(
                    color: Color(0xFF4CAF50),
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: Center(
                child: _loading
                    ? CircularProgressIndicator(
                        color: AppTheme.accent,
                        strokeWidth: 2,
                      )
                    : LayoutBuilder(
                        builder: (_, constraints) => _textureUrl != null
                            ? _SkinBodyImage(
                                textureUrl: _textureUrl!,
                                height: constraints.maxHeight,
                              )
                            : const FaIcon(
                                FontAwesomeIcons.personRunning,
                                color: AppTheme.textMuted,
                                size: 28,
                              ),
                      ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.gamertag,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _textureUrl != null ? _download : null,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF4CAF50),
                      side: const BorderSide(color: Color(0xFF4CAF50)),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const FaIcon(FontAwesomeIcons.download, size: 11),
                  ),
                ),
                if (widget.onEdit != null) ...[
                  const SizedBox(width: 6),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _textureUrl != null
                          ? () => widget.onEdit!(_textureUrl)
                          : null,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.textSecondary,
                        side: const BorderSide(color: AppTheme.borderGray),
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.penToSquare,
                        size: 11,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NoAccountsCard extends StatelessWidget {
  const _NoAccountsCard();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return _InfoCard(
      icon: FontAwesomeIcons.shirt,
      iconColor: const Color(0xFF42A5F5),
      title: l.skinsNoAccountsTitle,
      subtitle: l.skinsNoAccountsSubtitle,
    );
  }
}

class _NotLoggedInCard extends StatelessWidget {
  const _NotLoggedInCard();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return _InfoCard(
      icon: FontAwesomeIcons.user,
      iconColor: AppTheme.accent,
      title: l.skinsSignInTitle,
      subtitle: l.skinsSignInSubtitle,
    );
  }
}

class _InfoCard extends StatelessWidget {
  final FaIconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  const _InfoCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: FaIcon(icon, color: iconColor, size: 18)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
