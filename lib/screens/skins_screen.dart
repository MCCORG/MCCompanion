import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../design/design.dart';
import '../l10n/app_localizations.dart';
import '../models/saved_skin.dart';
import '../services/auth_service.dart';
import '../services/skin_migration_service.dart';
import '../theme/app_theme.dart';
import '../util/saved_skins_storage.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/components/swipe_back.dart';
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
    _importCloudSkins();
  }

  StreamSubscription<AuthUser?>? _authSub;

  List<SavedSkin> _savedSkins = [];
  bool _loadingSaved = true;

  @override
  void initState() {
    super.initState();
    _authSub = AuthService.userStream.listen((_) => _importCloudSkins());
    _loadSavedSkins();
    _importCloudSkins();
  }

  @override
  void dispose() {
    _authSub?.cancel();
    super.dispose();
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
            DsHeader(title: l.featureLabelSkins),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  DsSpace.gutter,
                  0,
                  DsSpace.gutter,
                  DsSpace.xxxl,
                ),
                child: Align(
                  alignment: isDesktop
                      ? Alignment.topLeft
                      : Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isDesktop ? double.infinity : 900,
                    ),
                    child: _buildSkins(l, isDesktop: isDesktop),
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

  Widget _buildSkins(AppLocalizations l, {required bool isDesktop}) {
    if (_loadingSaved) {
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
    if (_savedSkins.isEmpty) {
      return DsCard(
        child: Text(
          l.skinsEmptyLocalSkins,
          style: DsType.caption,
          textAlign: TextAlign.center,
        ),
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: isDesktop ? 200 : 175,
        mainAxisExtent: isDesktop ? 240 : 215,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: _savedSkins.length,
      itemBuilder: (_, i) => SavedSkinCard(
        skin: _savedSkins[i],
        onTap: () => _showSavedSkinMenu(_savedSkins[i]),
      ),
    );
  }
}
