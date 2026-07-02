import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:file_picker/file_picker.dart';
import '../widgets/components/swipe_back.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../theme/app_theme.dart';
import '../widgets/components/header_nav_bar.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';
import '../services/skin_upload_service.dart';
import '../models/user_model.dart';
import '../models/saved_skin.dart';
import '../util/saved_skins_storage.dart';
import 'skin_editor_screen.dart';
import '../l10n/app_localizations.dart';
import '../constants/app_constants.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/skins/skin_cards.dart';
import '../widgets/skins/skin_detail_sheets.dart';

class SkinsScreen extends StatefulWidget {
  const SkinsScreen({super.key, this.onBack});
  final VoidCallback? onBack;

  @override
  State<SkinsScreen> createState() => SkinsScreenState();
}

class SkinsScreenState extends State<SkinsScreen> {
  void refresh() { _loadMe(); _loadMeDashboard(); }
  StreamSubscription<AuthUser?>? _authSub;

  UserModel? _me;
  bool _loading = true;

  List<SavedSkin> _savedSkins = [];
  bool _loadingSaved = true;

  List<Map<String, dynamic>> _cloudSkins = [];
  bool _loadingCloud = false;


  List<Map<String, dynamic>> _topSkins = [];
  bool _loadingTop = false;

  List<Map<String, dynamic>> _allSkins = [];
  bool _loadingAll = false;
  bool _allHasMore = true;
  int _allOffset = 0;
  int _allTotal = 0;
  static const int _allPageSize = 20;

  Set<String> _likedIds = {};
  String? _idToken;

  @override
  void initState() {
    super.initState();
    _authSub = AuthService.userStream.listen((user) {
      _loadMe();
      _loadMeDashboard();
    });
    _loadMe();
    _loadSavedSkins();
    _loadTopSkins();
    _loadAllSkins();
    _loadMeDashboard();
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

  Future<void> _loadTopSkins() async {
    setState(() => _loadingTop = true);
    try {
      final resp = await http
          .get(Uri.parse('${AppConstants.apiBase}/api/skins/gallery'))
          .timeout(const Duration(seconds: 10));
      if (!mounted) return;
      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body);
        final top = (data['top'] as List?)?.cast<Map<String, dynamic>>() ?? [];
        setState(() { _topSkins = top; _loadingTop = false; });
        return;
      }
    } catch (_) {}
    if (mounted) setState(() => _loadingTop = false);
  }

  Future<void> _loadAllSkins({ bool reset = false }) async {
    if (_loadingAll) return;
    if (reset) setState(() { _allSkins = []; _allOffset = 0; _allHasMore = true; _allTotal = 0; });
    setState(() => _loadingAll = true);
    try {
      final offset = reset ? 0 : _allOffset;
      final resp = await http
          .get(Uri.parse('${AppConstants.apiBase}/api/skins/gallery/all?limit=$_allPageSize&offset=$offset'))
          .timeout(const Duration(seconds: 10));
      if (!mounted) return;
      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body);
        final skins = (data['skins'] as List?)?.cast<Map<String, dynamic>>() ?? [];
        final total = (data['total'] as num?)?.toInt() ?? 0;
        setState(() {
          _allSkins = reset ? skins : [..._allSkins, ...skins];
          _allOffset = (reset ? 0 : _allOffset) + skins.length;
          _allTotal = total;
          _allHasMore = _allOffset < total;
          _loadingAll = false;
        });
        return;
      }
    } catch (_) {}
    if (mounted) setState(() => _loadingAll = false);
  }

  Future<void> _loadMeDashboard() async {
    final user = AuthService.currentUser;
    if (user == null) {
      setState(() { _cloudSkins = []; _likedIds = {}; _idToken = null; _loadingCloud = false; });
      return;
    }
    setState(() => _loadingCloud = true);
    try {
      final token = await AuthService.getIdToken();
      final resp = await http
          .get(Uri.parse('${AppConstants.apiBase}/api/skins/me/dashboard'),
              headers: {'Authorization': 'Bearer $token'})
          .timeout(const Duration(seconds: 10));
      if (!mounted) return;
      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body);
        final skins = (data['skins'] as List?)?.cast<Map<String, dynamic>>() ?? [];
        final ids = (data['liked'] as List?)?.cast<String>().toSet() ?? {};
        setState(() { _cloudSkins = skins; _likedIds = ids; _idToken = token; _loadingCloud = false; });
        return;
      }
    } catch (_) {}
    if (mounted) setState(() { _loadingCloud = false; });
  }

  Future<void> _loadSavedSkins() async {
    final skins = await SavedSkinsStorage.loadAll();
    if (mounted)
      setState(() {
        _savedSkins = skins;
        _loadingSaved = false;
      });
  }

  Future<void> _downloadCloudSkin(Map<String, dynamic> skin) async {
    try {
      final url = (skin['public_url'] ?? skin['publicUrl']) as String;
      final name = skin['name'] as String? ?? 'skin';
      final resp = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      if (resp.statusCode == 200) {
        await SavedSkinsStorage.add(resp.bodyBytes, name);
        await _loadSavedSkins();
        if (mounted) AppToast.show(context, message: AppLocalizations.of(context)!.skinsSavedToMySkins, icon: Icons.download_done_rounded, color: AppTheme.success);
      }
    } catch (e) {
      if (mounted) AppToast.show(context, message: AppLocalizations.of(context)!.skinsDownloadFailed, icon: Icons.error_outline_rounded, color: AppTheme.error);
    }
  }

  Future<void> _deleteCloudSkin(Map<String, dynamic> skin) async {
    try {
      final id = skin['id'] as String;
      await SkinUploadService.deleteSkin(id);
      await _loadMeDashboard();
      if (mounted) AppToast.show(context, message: AppLocalizations.of(context)!.skinsDeletedFromCloud, icon: Icons.check_circle_outline_rounded, color: AppTheme.success);
    } catch (e) {
      if (mounted) AppToast.show(context, message: AppLocalizations.of(context)!.skinsDeleteFailed, icon: Icons.error_outline_rounded, color: AppTheme.error);
    }
  }

  void _showGallerySkinMenu(Map<String, dynamic> skin) {
    final currentUid = AuthService.currentUser?.uid;
    final isOwn = currentUid != null && skin['uid'] == currentUid;
    final textureUrl = (skin['public_url'] ?? skin['publicUrl']) as String?;
    final skinId = skin['id'] as String?;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => GallerySkinPreviewSheet(
        skin: skin,
        idToken: _idToken,
        currentUid: currentUid,
        isOwn: isOwn,
        initialLiked: skinId != null && _likedIds.contains(skinId),
        onEdit: textureUrl != null ? () {
          Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => isOwn
                  ? SkinEditorScreen(cloudSkin: skin)
                  : SkinEditorScreen(initialTextureUrl: textureUrl),
            ),
          ).then((result) { if (result == 'cloud') _loadMeDashboard(); });
        } : null,
        onDownload: () {
          Navigator.pop(context);
          _downloadCloudSkin(skin);
        },
        onDelete: isOwn ? () {
          Navigator.pop(context);
          _deleteCloudSkin(skin);
        } : null,
      ),
    );
  }

  void _showCloudSkinMenu(Map<String, dynamic> skin) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => CloudSkinMenuSheet(
        skin: skin,
        onEdit: () {
          Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => SkinEditorScreen(cloudSkin: skin),
            ),
          ).then((result) { if (result == 'cloud') _loadMeDashboard(); });
        },
        onDownload: () {
          Navigator.pop(context);
          _downloadCloudSkin(skin);
        },
        onDelete: () {
          Navigator.pop(context);
          _deleteCloudSkin(skin);
        },
      ),
    );
  }

  void _openEditor(String? textureUrl) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => SkinEditorScreen(initialTextureUrl: textureUrl)))
        .then((result) { _loadSavedSkins(); if (result == 'cloud') _loadMeDashboard(); });
  }

  void _openEditorForSaved(SavedSkin skin) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => SkinEditorScreen(initialTextureUrl: null, existingSkin: skin)))
        .then((result) { _loadSavedSkins(); if (result == 'cloud') _loadMeDashboard(); });
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
          AppToast.show(
            context,
            message: l.skinsMustBe64,
            icon: Icons.error_outline_rounded,
            color: AppTheme.error,
          );
        }
        return;
      }
    } catch (_) {
      if (mounted) {
        AppToast.show(
          context,
          message: l.skinsInvalidFile,
          icon: Icons.error_outline_rounded,
          color: AppTheme.error,
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

  Future<void> _uploadSkinToCloud(SavedSkin skin) async {
    final user = AuthService.currentUser;
    if (user == null) {
      if (mounted) AppToast.show(context, message: AppLocalizations.of(context)!.skinsLoginToUpload, icon: Icons.lock_outline_rounded, color: AppTheme.error);
      return;
    }

    if (mounted) AppToast.show(context, message: AppLocalizations.of(context)!.skinsUploading, icon: Icons.cloud_upload_outlined, color: AppTheme.accent);

    try {
      await SkinUploadService.uploadSkin(
        skinId: skin.id,
        name: skin.name,
        filePath: skin.filePath,
      );

      await SavedSkinsStorage.delete(skin.id);
      await _loadSavedSkins();
      await _loadMeDashboard();

      if (mounted) AppToast.show(context, message: AppLocalizations.of(context)!.skinUploaded, icon: Icons.check_circle_outline_rounded, color: AppTheme.success);
    } catch (e) {
      if (mounted) AppToast.show(context, message: AppLocalizations.of(context)!.skinUploadFailed(e.toString().replaceAll('Exception: ', '')), icon: Icons.error_outline_rounded, color: AppTheme.error);
    }
  }

  Future<void> _exportSavedSkin(SavedSkin skin) async {
    try {
      final bytes = await File(skin.filePath).readAsBytes();
      final dir = await getTemporaryDirectory();
      final tmp = File('${dir.path}/${skin.name}.png');
      await tmp.writeAsBytes(bytes);
      if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
        final saveDir = await getApplicationDocumentsDirectory();
        final dest = File('${saveDir.path}/${skin.name}.png');
        await tmp.copy(dest.path);
        if (mounted) {
          AppToast.show(context, message: AppLocalizations.of(context)!.skinSavedToDocuments, icon: Icons.download_done_rounded, color: AppTheme.success);
        }
      } else {
        final size = MediaQuery.of(context).size;
        await Share.shareXFiles(
          [XFile(tmp.path, mimeType: 'image/png')],
          subject: AppLocalizations.of(context)!.skinMenuExport,
          sharePositionOrigin: Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: 1,
            height: 1,
          ),
        );
      }
    } catch (_) {}
  }

  void _showSavedSkinMenu(SavedSkin skin) {
    final isLoggedIn = AuthService.currentUser != null;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => SavedSkinMenuSheet(
        skin: skin,
        onEdit: () {
          Navigator.pop(context);
          _openEditorForSaved(skin);
        },
        onUpload: isLoggedIn ? () {
          Navigator.pop(context);
          _uploadSkinToCloud(skin);
        } : null,
        onExport: () async {
          Navigator.pop(context);
          await Future.delayed(const Duration(milliseconds: 300));
          if (mounted) _exportSavedSkin(skin);
        },
        onDelete: () {
          Navigator.pop(context);
          _deleteSavedSkin(skin);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final isLoggedIn = AuthService.currentUser != null;

    final content = LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 700;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  const Spacer(),
                  HeaderNavBar(
                    items: [
                      HeaderNavItem(label: l.skinsUpload, onTap: _uploadSkin),
                      HeaderNavItem(label: l.skinsCreate, onTap: () => _openEditor(null)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionHeader(l.skinsLabel, icon: FontAwesomeIcons.shirt),
                        const SizedBox(height: 10),
                        _buildAllSkins(l, isDesktop: isDesktop, isLoggedIn: isLoggedIn),
                        const SizedBox(height: 24),
                        const Divider(color: AppTheme.borderGray, thickness: 1),
                        const SizedBox(height: 24),
                        _buildGallerySkins(l, isDesktop: isDesktop),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    if (widget.onBack != null) {
      return SwipeBack(onBack: widget.onBack!, child: content);
    }
    return content;
  }

  Widget _buildAllSkins(AppLocalizations l, {required bool isDesktop, required bool isLoggedIn}) {
    final items = <Widget>[
      ...List.generate(_savedSkins.length, (i) => SavedSkinCard(
        skin: _savedSkins[i],
        onTap: () => _showSavedSkinMenu(_savedSkins[i]),
      )),
      if (isLoggedIn)
        ...List.generate(_cloudSkins.length, (i) => CloudSkinCard(
          skin: _cloudSkins[i],
          onTap: () => _showCloudSkinMenu(_cloudSkins[i]),
        )),
      if (_me != null) ...[
        ...List.generate(_me!.javaAccounts.length, (i) => JavaSkinCard(
          username: _me!.javaAccounts[i].javaUsername,
          javaUuid: _me!.javaAccounts[i].javaUuid,
          badge: l.labelJava,
          badgeColor: const Color(0xFF42A5F5),
          onEdit: _openEditor,
        )),
        ...List.generate(_me!.bedrockAccounts.length, (i) => BedrockSkinCard(
          gamertag: _me!.bedrockAccounts[i].xboxGamertag ?? _me!.bedrockAccounts[i].xboxXuid,
          xuid: _me!.bedrockAccounts[i].xboxXuid,
          onEdit: _openEditor,
        )),
      ],
    ];

    final isAnyLoading = _loadingSaved || (isLoggedIn && _loadingCloud) || _loading;
    if (isAnyLoading) {
      return SizedBox(height: 60, child: Center(child: CircularProgressIndicator(color: AppTheme.accent, strokeWidth: 2)));
    }
    if (items.isEmpty) return _emptyState(l.skinsEmptyLocalSkins);
    return _skinGrid(isDesktop: isDesktop, items: items);
  }

  Widget _buildGallerySkins(AppLocalizations l, {bool isDesktop = false}) {
    const rankBadges = ['🥇', '🥈', '🥉'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader(l.skinsTopLabel, icon: FontAwesomeIcons.trophy, iconColor: const Color(0xFFfbbf24)),
        const SizedBox(height: 10),
        if (_loadingTop)
          SizedBox(height: 60, child: Center(child: CircularProgressIndicator(color: AppTheme.accent, strokeWidth: 2)))
        else if (_topSkins.isEmpty)
          const SizedBox.shrink()
        else
          _skinGrid(
            isDesktop: isDesktop,
            items: List.generate(_topSkins.length > 9 ? 9 : _topSkins.length, (i) {
              final skin = _topSkins[i];
              final badge = i < 3 ? rankBadges[i] : null;
              return Stack(
                fit: StackFit.expand,
                children: [
                  GallerySkinCard(
                    skin: skin,
                    onTap: () => _showGallerySkinMenu(skin),
                    idToken: _idToken,
                    initialLiked: _likedIds.contains(skin['id'] as String?),
                    isOwn: AuthService.currentUser?.uid == skin['uid'],
                  ),
                  if (badge != null)
                    Positioned(
                      top: 6,
                      left: 6,
                      child: Text(badge, style: const TextStyle(fontSize: 16)),
                    ),
                ],
              );
            }),
          ),

        const SizedBox(height: 24),

        Row(
          children: [
            Expanded(child: _sectionHeader(
              l.skinsAllLabel,
              icon: FontAwesomeIcons.earthAmericas,
              count: _allTotal > 0 ? _allTotal : null,
            )),
          ],
        ),
        const SizedBox(height: 10),
        if (_loadingAll && _allSkins.isEmpty)
          SizedBox(height: 60, child: Center(child: CircularProgressIndicator(color: AppTheme.accent, strokeWidth: 2)))
        else if (_allSkins.isEmpty)
          const SizedBox.shrink()
        else
          _skinGrid(
            isDesktop: isDesktop,
            items: List.generate(_allSkins.length, (i) => GallerySkinCard(
              skin: _allSkins[i],
              onTap: () => _showGallerySkinMenu(_allSkins[i]),
              idToken: _idToken,
              initialLiked: _likedIds.contains(_allSkins[i]['id'] as String?),
              isOwn: AuthService.currentUser?.uid == _allSkins[i]['uid'],
            )),
          ),

        if (_allSkins.isNotEmpty) ...[
          const SizedBox(height: 12),
          Center(
            child: Text(
              '${_allSkins.length} / $_allTotal',
              style: TextStyle(color: AppTheme.textMuted, fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ),
        ],
        if (_allHasMore || (_loadingAll && _allSkins.isNotEmpty)) ...[
          const SizedBox(height: 8),
          Center(
            child: _loadingAll
                ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 2))
                : OutlinedButton(
                    onPressed: () => _loadAllSkins(),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.textSecondary,
                      side: const BorderSide(color: AppTheme.borderGray),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(l.loadMore),
                  ),
          ),
          const SizedBox(height: 16),
        ],
      ],
    );
  }

  Widget _sectionHeader(String label, {int? count, FaIconData? icon, Color? iconColor}) {
    return Row(
      children: [
        if (icon != null) ...[
          FaIcon(icon, size: 12, color: iconColor ?? AppTheme.textMuted),
          const SizedBox(width: 7),
        ],
        Text(label.toUpperCase(), style: TextStyle(color: AppTheme.textMuted, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
        if (count != null) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
            decoration: BoxDecoration(color: AppTheme.surface, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppTheme.borderGray)),
            child: Text('$count', style: TextStyle(color: AppTheme.textSecondary, fontSize: 10, fontWeight: FontWeight.w600)),
          ),
        ],
      ],
    );
  }

  Widget _skinGrid({required List<Widget> items, required bool isDesktop}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: isDesktop ? 200 : 175,
        mainAxisExtent: isDesktop ? 240 : 215,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (_, i) => items[i],
    );
  }

  Widget _emptyState(String message) => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    decoration: BoxDecoration(
      color: AppTheme.surface,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: AppTheme.borderGray),
    ),
    child: Text(message, style: TextStyle(color: AppTheme.textMuted, fontSize: 13), textAlign: TextAlign.center),
  );
}
