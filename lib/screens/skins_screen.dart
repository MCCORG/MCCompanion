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
import '../models/user_model.dart';
import '../models/saved_skin.dart';
import '../util/saved_skins_storage.dart';
import 'skin_editor_screen.dart';
import '../l10n/app_localizations.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/skins/skin_painters.dart';
import '../widgets/skins/skin_cards.dart';
import '../widgets/skins/skin_detail_sheets.dart';

class SkinsScreen extends StatefulWidget {
  const SkinsScreen({super.key, this.onBack});
  final VoidCallback? onBack;

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

  List<GeyserSkin> _recentSkins = [];
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
              (e) => GeyserSkin(
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
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => SavedSkinMenuSheet(
        skin: skin,
        onEdit: () {
          Navigator.pop(context);
          _openEditorForSaved(skin);
        },
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

  void _openGeyserDetail(String textureUrl) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => SkinDetailSheet(
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
    final content = LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 700;
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: HeaderNavBar(
                  items: [
                    HeaderNavItem(label: l.skinsUpload, onTap: _uploadSkin),
                    HeaderNavItem(label: l.skinsCreate, onTap: () => _openEditor(null)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildSavedSkins(l, isDesktop: isDesktop),
              const SizedBox(height: 28),
              _buildYourSkins(l, isDesktop: isDesktop),
              const SizedBox(height: 28),
              _sectionLabel(l.skinsSectionRecent),
              const SizedBox(height: 10),
              _buildRecentSkins(l),
            ],
          ),
            ),
          ),
        );
      },
    );
    if (widget.onBack != null) {
      return SwipeBack(onBack: widget.onBack!, child: content);
    }
    return content;
  }

  Widget _buildSavedSkins(AppLocalizations l, {bool isDesktop = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionLabel(l.skinsSectionMy),
        const SizedBox(height: 10),
        if (_loadingSaved)
          SizedBox(
            height: 60,
            child: Center(child: CircularProgressIndicator(color: AppTheme.accent, strokeWidth: 2)),
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
            child: Text(l.skinsEmptyMySkins, style: TextStyle(color: AppTheme.textMuted, fontSize: 13)),
          )
        else if (isDesktop)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 140,
              mainAxisExtent: 170,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: _savedSkins.length,
            itemBuilder: (_, i) => SavedSkinCard(
              skin: _savedSkins[i],
              onTap: () => _showSavedSkinMenu(_savedSkins[i]),
            ),
          )
        else
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _savedSkins.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, i) => SavedSkinCard(
                skin: _savedSkins[i],
                onTap: () => _showSavedSkinMenu(_savedSkins[i]),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildYourSkins(AppLocalizations l, {bool isDesktop = false}) {
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

    if (_me == null) return const SkinsNotLoggedInCard();

    final javaAccounts = _me!.javaAccounts;
    final bedrockAccounts = _me!.bedrockAccounts;

    if (javaAccounts.isEmpty && bedrockAccounts.isEmpty) {
      return const SkinsNoAccountsCard();
    }

    final totalCards = javaAccounts.length + bedrockAccounts.length;
    final isSingle = totalCards == 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionLabel(l.skinsSectionYours),
        const SizedBox(height: 10),
        if (isDesktop)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 240,
              mainAxisExtent: 260,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: totalCards,
            itemBuilder: (_, i) {
              if (i < javaAccounts.length) {
                final acc = javaAccounts[i];
                return JavaSkinCard(
                  username: acc.javaUsername,
                  javaUuid: acc.javaUuid,
                  badge: l.labelJava,
                  badgeColor: const Color(0xFF42A5F5),
                  onEdit: _openEditor,
                );
              }
              final acc = bedrockAccounts[i - javaAccounts.length];
              return BedrockSkinCard(
                gamertag: acc.xboxGamertag ?? acc.xboxXuid,
                xuid: acc.xboxXuid,
                onEdit: _openEditor,
              );
            },
          )
        else if (isSingle)
          SizedBox(
            height: 210,
            child: javaAccounts.isNotEmpty
                ? JavaSkinCard(
                    username: javaAccounts.first.javaUsername,
                    javaUuid: javaAccounts.first.javaUuid,
                    badge: 'Java',
                    badgeColor: const Color(0xFF42A5F5),
                    onEdit: _openEditor,
                  )
                : BedrockSkinCard(
                    gamertag:
                        bedrockAccounts.first.xboxGamertag ??
                        bedrockAccounts.first.xboxXuid,
                    xuid: bedrockAccounts.first.xboxXuid,
                    onEdit: _openEditor,
                  ),
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
                    child: JavaSkinCard(
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
                  child: BedrockSkinCard(
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
                style: TextStyle(color: AppTheme.textMuted, fontSize: 13),
              ),
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 160,
              mainAxisExtent: 200,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: _recentSkins.length,
            itemBuilder: (_, i) {
              final skin = _recentSkins[i];
              return GeyserSkinChip(
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
          style: TextStyle(
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
    style: TextStyle(
      color: AppTheme.textMuted,
      fontSize: 11,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.2,
    ),
  );
}
