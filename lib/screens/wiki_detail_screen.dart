import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../util/wiki_history_storage.dart';
import '../widgets/wiki/wiki_crafting_grid.dart';
import 'wiki_screen.dart';

class WikiArticleSection {
  final String? title;
  final String content;
  const WikiArticleSection({required this.title, required this.content});
}

class WikiCraftingRecipe {
  final Map<String, String> grid;
  final String output;
  final int outputCount;
  const WikiCraftingRecipe({
    required this.grid,
    required this.output,
    this.outputCount = 1,
  });
}

class WikiDetailScreen extends StatefulWidget {
  final WikiResult result;
  final VoidCallback? onBack;
  const WikiDetailScreen({super.key, required this.result, this.onBack});

  @override
  State<WikiDetailScreen> createState() => _WikiDetailScreenState();
}

class _WikiDetailScreenState extends State<WikiDetailScreen> {
  List<WikiArticleSection> _sections = [];
  List<WikiCraftingRecipe> _craftingRecipes = [];
  String? _imageUrl;
  bool _loading = true;
  String? _error;
  bool _isFavourite = false;

  static const _hiddenSections = {
    'History',
    'Trivia',
    'Gallery',
    'References',
    'Videos',
    'Navigation',
    'See also',
    'Advancements',
    'Data values',
    'Sounds',
    'Issues',
    'Notes',
    'Crafting',
  };

  @override
  void initState() {
    super.initState();
    _loadDetail();
    _checkFavourite();
  }

  Future<void> _checkFavourite() async {
    final fav = await WikiHistoryStorage.isFavourite(widget.result.title);
    if (mounted) setState(() => _isFavourite = fav);
  }

  Future<void> _toggleFavourite() async {
    await WikiHistoryStorage.toggleFavourite(WikiHistoryEntry(
      pageId: widget.result.pageId,
      title: widget.result.title,
      thumbnailUrl: widget.result.thumbnailUrl ?? _imageUrl,
      visitedAt: DateTime.now(),
    ));
    if (mounted) setState(() => _isFavourite = !_isFavourite);
  }

  Future<void> _loadDetail() async {
    try {
      final results = await Future.wait([
        http
            .get(
              Uri.parse('https://minecraft.wiki/api.php').replace(
                queryParameters: {
                  'action': 'query',
                  'titles': widget.result.title,
                  'prop': 'extracts|pageimages',
                  'explaintext': '1',
                  'exsectionformat': 'wiki',
                  'pithumbsize': '400',
                  'format': 'json',
                  'origin': '*',
                },
              ),
              headers: {'User-Agent': 'MCCompanionApp/1.0'},
            )
            .timeout(const Duration(seconds: 10)),
        http
            .get(
              Uri.parse('https://minecraft.wiki/api.php').replace(
                queryParameters: {
                  'action': 'parse',
                  'page': widget.result.title,
                  'prop': 'wikitext',
                  'format': 'json',
                  'origin': '*',
                },
              ),
              headers: {'User-Agent': 'MCCompanionApp/1.0'},
            )
            .timeout(const Duration(seconds: 10)),
      ]);
      if (!mounted) return;

      final pages =
          (jsonDecode(results[0].body)['query']?['pages']
              as Map<String, dynamic>?) ??
          {};
      final page = pages.values.first as Map<String, dynamic>? ?? {};
      final raw = (page['extract'] as String?)?.trim() ?? '';
      final imgUrl = page['thumbnail']?['source'] as String?;

      final wikitext =
          jsonDecode(results[1].body)['parse']?['wikitext']?['*'] as String? ??
          '';
      final recipes = _parseCraftingRecipes(wikitext);

      setState(() {
        _sections = _parseSections(raw);
        _craftingRecipes = recipes;
        _imageUrl = imgUrl;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _error = AppLocalizations.of(context)!.wikiCouldNotLoadContent;
        _loading = false;
      });
    }
  }

  List<WikiArticleSection> _parseSections(String text) {
    final result = <WikiArticleSection>[];
    final headerRx = RegExp(r'^={2,4}\s*(.+?)\s*={2,4}\s*$', multiLine: true);
    int lastEnd = 0;
    String? lastTitle;
    for (final m in headerRx.allMatches(text)) {
      final content = text.substring(lastEnd, m.start).trim();
      if (content.isNotEmpty || lastTitle != null) {
        result.add(WikiArticleSection(title: lastTitle, content: content));
      }
      lastTitle = m.group(1);
      lastEnd = m.end;
    }
    final tail = text.substring(lastEnd).trim();
    if (tail.isNotEmpty || lastTitle != null) {
      result.add(WikiArticleSection(title: lastTitle, content: tail));
    }
    return result
        .where(
          (s) => s.content.isNotEmpty && !_hiddenSections.contains(s.title),
        )
        .toList();
  }

  List<WikiCraftingRecipe> _parseCraftingRecipes(String wikitext) {
    final result = <WikiCraftingRecipe>[];
    int i = 0;
    while (i < wikitext.length) {
      final sub = wikitext.substring(i);
      final idx = sub.toLowerCase().indexOf('{{crafting');
      if (idx < 0) break;
      final start = i + idx;
      int depth = 0, j = start;
      int? end;
      while (j < wikitext.length - 1) {
        if (wikitext[j] == '{' && wikitext[j + 1] == '{') {
          depth++;
          j += 2;
        } else if (wikitext[j] == '}' && wikitext[j + 1] == '}') {
          depth--;
          if (depth == 0) {
            end = j + 2;
            break;
          }
          j += 2;
        } else {
          j++;
        }
      }
      if (end == null) break;
      final recipe = _parseOneTemplate(wikitext.substring(start, end));
      if (recipe != null) result.add(recipe);
      i = end;
    }
    return result;
  }

  WikiCraftingRecipe? _parseOneTemplate(String block) {
    final params = <String, String>{};
    final sb = StringBuffer();
    int depth = 0;
    final inner = block.substring(2, block.length - 2);
    for (int k = 0; k < inner.length; k++) {
      final c = inner[k];
      if (c == '{' && k + 1 < inner.length && inner[k + 1] == '{') {
        depth++;
        sb.write(c);
      } else if (c == '}' && k + 1 < inner.length && inner[k + 1] == '}') {
        depth--;
        sb.write(c);
      } else if (c == '|' && depth == 0) {
        _addParam(sb.toString(), params);
        sb.clear();
      } else {
        sb.write(c);
      }
    }
    _addParam(sb.toString(), params);

    final output = _clean(params['Output'] ?? params['output'] ?? '');
    if (output.isEmpty) return null;

    final grid = <String, String>{};
    for (final pos in ['A1', 'B1', 'C1', 'A2', 'B2', 'C2', 'A3', 'B3', 'C3']) {
      final v = _clean(params[pos] ?? '');
      if (v.isNotEmpty) grid[pos] = v;
    }
    if (grid.isEmpty) {
      const numbered = {
        '1': 'A1',
        '2': 'B1',
        '3': 'C1',
        '4': 'A2',
        '5': 'B2',
        '6': 'C2',
        '7': 'A3',
        '8': 'B3',
        '9': 'C3',
      };
      for (final e in numbered.entries) {
        final v = _clean(params[e.key] ?? '');
        if (v.isNotEmpty) grid[e.value] = v;
      }
    }
    if (grid.isEmpty) return null;

    final count = int.tryParse(params['OA'] ?? params['count'] ?? '1') ?? 1;
    return WikiCraftingRecipe(grid: grid, output: output, outputCount: count);
  }

  void _addParam(String part, Map<String, String> out) {
    final eq = part.indexOf('=');
    if (eq < 0) return;
    final key = part
        .substring(0, eq)
        .trim()
        .replaceAll(RegExp(r'[\n\r\s]+'), '');
    final val = part.substring(eq + 1).trim();
    if (key.isNotEmpty) out[key] = val;
  }

  String _clean(String raw) {
    var s = raw.trim();
    if (s.contains(';')) s = s.split(';').first.trim();
    if (s.startsWith('{{')) {
      final inner = s.replaceAll(RegExp(r'^\{\{|\}\}$'), '');
      s = inner.split('|').last.trim();
    }
    s = s.replaceAll(RegExp(r'\[\[(?:[^\]|]*\|)?([^\]]*)\]\]'), r'\1');
    s = s
        .replaceAll(RegExp(r'[{}\[\]]'), '')
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .trim();
    return s;
  }

  Future<void> _openInBrowser() async {
    final url = Uri.parse(
      'https://minecraft.wiki/w/${Uri.encodeComponent(widget.result.title.replaceAll(' ', '_'))}',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final body = LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 700;
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isWide ? 900 : double.infinity),
            child: Column(
              children: [
        if (widget.onBack == null) Padding(
          padding: const EdgeInsets.fromLTRB(4, 8, 8, 0),
          child: Row(
            children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppTheme.textSecondary,
                      size: 18,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.result.title,
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: _toggleFavourite,
                    icon: FaIcon(
                      _isFavourite ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
                      size: 15,
                      color: _isFavourite ? const Color(0xFFfbbf24) : AppTheme.textMuted,
                    ),
                  ),
                  IconButton(
                    onPressed: _openInBrowser,
                    icon: FaIcon(
                      FontAwesomeIcons.arrowUpRightFromSquare,
                      size: 15,
                      color: AppTheme.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: _buildContent()),
              ],
            ),
          ),
        );
      },
    );
    if (widget.onBack != null) return body;
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(child: body),
    );
  }

  Widget _buildContent() {
    if (_loading) {
      return Center(child: CircularProgressIndicator(color: AppTheme.accent));
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FaIcon(
              FontAwesomeIcons.triangleExclamation,
              color: AppTheme.error,
              size: 28,
            ),
            const SizedBox(height: 12),
            Text(
              _error!,
              style: TextStyle(color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _openInBrowser,
              icon: const FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                size: 13,
              ),
              label: Text(AppLocalizations.of(context)!.wikiOpenInBrowser),
              style: FilledButton.styleFrom(backgroundColor: AppTheme.accent),
            ),
          ],
        ),
      );
    }

    final intro = _sections.where((s) => s.title == null).firstOrNull;
    final rest = _sections.where((s) => s.title != null).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      children: [
        if (_imageUrl != null) ...[
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                _imageUrl!,
                height: 180,
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) => const SizedBox.shrink(),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],

        if (_craftingRecipes.isNotEmpty) ...[
          Text(
            AppLocalizations.of(context)!.wikiCrafting,
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          ..._craftingRecipes.map(
            (r) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: WikiCraftingGrid(recipe: r),
            ),
          ),
          const SizedBox(height: 8),
          const Divider(color: AppTheme.borderDim, height: 1),
          const SizedBox(height: 20),
        ],

        if (intro != null && intro.content.isNotEmpty) ...[
          Text(
            intro.content,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 14,
              height: 1.65,
            ),
          ),
          const SizedBox(height: 16),
        ],

        if (rest.isNotEmpty) ...[
          const Divider(color: AppTheme.borderDim, height: 1),
          const SizedBox(height: 20),
          ...rest.expand(
            (s) => [
              Text(
                s.title!,
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                s.content,
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                  height: 1.65,
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: AppTheme.borderDim, height: 1),
              const SizedBox(height: 20),
            ],
          ),
        ],

        OutlinedButton.icon(
          onPressed: _openInBrowser,
          icon: const FaIcon(FontAwesomeIcons.arrowUpRightFromSquare, size: 12),
          label: Text(AppLocalizations.of(context)!.wikiReadFullArticle),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppTheme.accent,
            side: BorderSide(color: AppTheme.accent),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
