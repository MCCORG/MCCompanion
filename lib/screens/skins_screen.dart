import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:file_picker/file_picker.dart';
import '../widgets/components/swipe_back.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../theme/app_theme.dart';
import '../design/design.dart';
import '../services/auth_service.dart';
import '../services/skin_migration_service.dart';
import '../services/user_service.dart';
import '../models/user_model.dart';
import '../models/saved_skin.dart';
import '../util/saved_skins_storage.dart';
import 'skin_editor_screen.dart';
import '../l10n/app_localizations.dart';
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
  void refresh() {
    _loadMe();
    _importCloudSkins();
  }

  StreamSubscription<AuthUser?>? _authSub;

  UserModel? _me;
  bool _loading = true;

  List<SavedSkin> _savedSkins = [];
  bool _loadingSaved = true;

  @override
  void initState() {
    super.initState();
    _authSub = AuthService.userStream.listen((user) {
      _loadMe();
      _importCloudSkins();
    });
    _loadSavedSkins();
    _importCloudSkins();
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

    if (_me == null) setState(() => _loading = true);
    final me = await UserService.getMe();
    if (!mounted) return;
    setState(() {
      _me = me;
      _loading = false;
    });
  }

  Future<void> _loadSavedSkins() async {
    final skins = await SavedSkinsStorage.loadAll();
    if (mounted) {
      setState(() {
        _savedSkins = skins;
        _loadingSaved = false;
      });
    }
  }

  Future<void> _importCloudSkins() async {
    final added = await SkinMigrationService.importCloudSkins();
    if (!mounted || added == 0) return;
    await _loadSavedSkins();
    if (!mounted) return;
    AppToast.show(
      context,
      message: AppLocalizations.of(context)!.skinsSavedToMySkins,
      icon: Icons.download_done_rounded,
      color: AppTheme.success,
    );
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

  Future<void> _importSkinFile() async {
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
          AppToast.show(
            context,
            message: AppLocalizations.of(context)!.skinSavedToDocuments,
            icon: Icons.download_done_rounded,
            color: AppTheme.success,
          );
        }
      } else {
        if (!mounted) return;
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

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    final content = LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 700;
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.zero,
              child: DsHeader(
                title: l.featureLabelSkins,
                actions: [
                  DsButton(
                    label: l.skinsUpload,
                    icon: Icons.upload_rounded,
                    tone: DsButtonTone.neutral,
                    size: DsButtonSize.small,
                    onPressed: _importSkinFile,
                  ),
                  DsButton(
                    label: l.skinsCreate,
                    icon: Icons.add_rounded,
                    size: DsButtonSize.small,
                    onPressed: () => _openEditor(null),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  DsSpace.gutter,
                  0,
                  DsSpace.gutter,
                  DsSpace.xxxl,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [_buildAllSkins(l, isDesktop: isDesktop)],
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

  Widget _buildAllSkins(AppLocalizations l, {required bool isDesktop}) {
    final items = <Widget>[
      ...List.generate(
        _savedSkins.length,
        (i) => SavedSkinCard(
          skin: _savedSkins[i],
          onTap: () => _showSavedSkinMenu(_savedSkins[i]),
        ),
      ),
      if (_me != null) ...[
        ...List.generate(
          _me!.javaAccounts.length,
          (i) => JavaSkinCard(
            username: _me!.javaAccounts[i].javaUsername,
            javaUuid: _me!.javaAccounts[i].javaUuid,
            badge: l.labelJava,
            badgeColor: const Color(0xFF42A5F5),
            onEdit: _openEditor,
          ),
        ),
        ...List.generate(
          _me!.bedrockAccounts.length,
          (i) => BedrockSkinCard(
            gamertag:
                _me!.bedrockAccounts[i].xboxGamertag ??
                _me!.bedrockAccounts[i].xboxXuid,
            xuid: _me!.bedrockAccounts[i].xboxXuid,
            onEdit: _openEditor,
          ),
        ),
      ],
    ];

    final isAnyLoading = _loadingSaved || _loading;
    if (isAnyLoading) {
      return SizedBox(
        height: 60,
        child: Center(
          child: SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(
              strokeWidth: 1.8,
              color: DsColor.textFaint,
            ),
          ),
        ),
      );
    }
    if (items.isEmpty) return _emptyState(l.skinsEmptyLocalSkins);
    return _skinGrid(isDesktop: isDesktop, items: items);
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

  Widget _emptyState(String message) => DsCard(
    child: Text(message, style: DsType.caption, textAlign: TextAlign.center),
  );
}
