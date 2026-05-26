import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class _Sub {
  final String label;
  final String emoji;
  final String category;
  final List<String>? hardcoded;
  final String? jsonKey;
  const _Sub({
    required this.label,
    required this.emoji,
    required this.category,
    this.hardcoded,
    this.jsonKey,
  });
}

class _Section {
  final String label;
  final String emoji;
  final Color color;
  final List<_Sub> subs;
  final String imagePath;
  const _Section({
    required this.label,
    required this.emoji,
    required this.color,
    required this.subs,
    required this.imagePath,
  });
}

const _sections = [
  _Section(
    label: 'Mobs',
    emoji: '🧟',
    color: Color(0xFF4CAF50),
    imagePath: 'assets/images/mobs.png',
    subs: [
      _Sub(label: 'Passive',  emoji: '🐄', category: 'Category:Passive mobs',  jsonKey: 'mobs_passive'),
      _Sub(label: 'Neutral',  emoji: '🐺', category: 'Category:Neutral mobs',  jsonKey: 'mobs_neutral'),
      _Sub(label: 'Hostile',  emoji: '💀', category: 'Category:Hostile mobs',  jsonKey: 'mobs_hostile'),
      _Sub(label: 'Boss',     emoji: '👑', category: 'Category:Boss mobs',     jsonKey: 'mobs_boss'),
      _Sub(label: 'Utility',  emoji: '🤖', category: 'Category:Utility mobs',  jsonKey: 'mobs_utility'),
    ],
  ),
  _Section(
    label: 'Blocks',
    emoji: '🧱',
    color: Color(0xFF795548),
    imagePath: 'assets/images/blocks.png',
    subs: [
      _Sub(label: 'Natural',    emoji: '🌿', category: 'Category:Natural blocks',       jsonKey: 'blocks_natural'),
      _Sub(label: 'Ores',       emoji: '💎', category: 'Category:Ores',                 jsonKey: 'blocks_ores'),
      _Sub(label: 'Wood',       emoji: '🌲', category: 'Category:Wood',                 jsonKey: 'blocks_wood'),
      _Sub(label: 'Stone',      emoji: '🪨', category: 'Category:Stone',                jsonKey: 'blocks_stone'),
      _Sub(label: 'Redstone',   emoji: '🔴', category: 'Category:Redstone components',  jsonKey: 'blocks_redstone'),
      _Sub(label: 'Plants',     emoji: '🌱', category: 'Category:Plants',               jsonKey: 'blocks_plants'),
      _Sub(label: 'Decoration', emoji: '🪟', category: 'Category:Decoration blocks',    jsonKey: 'blocks_decoration'),
    ],
  ),
  _Section(
    label: 'Items',
    emoji: '⚔️',
    color: Color(0xFF2196F3),
    imagePath: 'assets/images/items.png',
    subs: [
      _Sub(label: 'Tools',     emoji: '🪓', category: 'Category:Tools',          jsonKey: 'items_tools'),
      _Sub(
        label: 'Swords',
        emoji: '⚔️',
        category: 'Category:Swords',
        hardcoded: [
          'Wooden Sword', 'Stone Sword', 'Iron Sword',
          'Golden Sword', 'Diamond Sword', 'Netherite Sword',
        ],
      ),
      _Sub(
        label: 'Ranged',
        emoji: '🏹',
        category: 'Category:Ranged weapons',
        hardcoded: ['Bow', 'Crossbow', 'Trident', 'Wind Charge'],
      ),
      _Sub(label: 'Armor',     emoji: '🛡️', category: 'Category:Armor',          jsonKey: 'items_armor'),
      _Sub(label: 'Food',      emoji: '🍎', category: 'Category:Food',            jsonKey: 'items_food'),
      _Sub(label: 'Brewing',   emoji: '🧪', category: 'Category:Brewing',         jsonKey: 'items_brewing'),
      _Sub(label: 'Materials', emoji: '🔩', category: 'Category:Materials',       jsonKey: 'items_materials'),
    ],
  ),
  _Section(
    label: 'Biomes',
    emoji: '🌿',
    color: Color(0xFF66BB6A),
    imagePath: 'assets/images/biomes.png',
    subs: [
      _Sub(label: 'Overworld', emoji: '☀️', category: 'Category:Overworld biomes',  jsonKey: 'biomes_overworld'),
      _Sub(label: 'Nether',    emoji: '🔥', category: 'Category:Nether biomes',     jsonKey: 'biomes_nether'),
      _Sub(label: 'The End',   emoji: '🌑', category: 'Category:The End biomes',    jsonKey: 'biomes_end'),
    ],
  ),
  _Section(
    label: 'Structures',
    emoji: '🏰',
    color: Color(0xFF9C27B0),
    imagePath: 'assets/images/structures.png',
    subs: [
      _Sub(label: 'Overworld', emoji: '🗺️', category: 'Category:Overworld structures', jsonKey: 'structures_overworld'),
      _Sub(label: 'Nether',    emoji: '🔥', category: 'Category:Nether structures',     jsonKey: 'structures_nether'),
      _Sub(label: 'The End',   emoji: '🌑', category: 'Category:The End structures',    jsonKey: 'structures_end'),
    ],
  ),
  _Section(
    label: 'Enchantments',
    emoji: '✨',
    color: Color(0xFFFF9800),
    imagePath: 'assets/images/enchantments.png',
    subs: [
      _Sub(label: 'Sword',   emoji: '⚔️', category: 'Category:Sword enchantments',      jsonKey: 'enchantments_sword'),
      _Sub(label: 'Armor',   emoji: '🛡️', category: 'Category:Armor enchantments',      jsonKey: 'enchantments_armor'),
      _Sub(label: 'Tool',    emoji: '🪓', category: 'Category:Tool enchantments',        jsonKey: 'enchantments_tool'),
      _Sub(label: 'Bow',     emoji: '🏹', category: 'Category:Bow enchantments',         jsonKey: 'enchantments_bow'),
      _Sub(label: 'Fishing', emoji: '🎣', category: 'Category:Fishing Rod enchantments', jsonKey: 'enchantments_fishing'),
    ],
  ),
  _Section(
    label: 'Potions',
    emoji: '🧪',
    color: Color(0xFFE91E63),
    imagePath: 'assets/images/potions.png',
    subs: [
      _Sub(label: 'Potions',        emoji: '🧪', category: 'Category:Potions',        jsonKey: 'potions_potions'),
      _Sub(label: 'Status Effects', emoji: '💫', category: 'Category:Status effects', jsonKey: 'potions_effects'),
    ],
  ),
];

class WikiResult {
  int pageId;
  final String title;
  final String snippet;
  String? thumbnailUrl;
  WikiResult({
    required this.pageId,
    required this.title,
    required this.snippet,
    this.thumbnailUrl,
  });
}

enum _View { root, subs, pages, search }

class WikiScreen extends StatefulWidget {
  const WikiScreen({super.key});

  @override
  State<WikiScreen> createState() => _WikiScreenState();
}

class _WikiScreenState extends State<WikiScreen> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  _View _view = _View.root;
  _Section? _activeSection;
  _Sub? _activeSub;

  List<WikiResult> _pages = [];
  List<WikiResult> _searchResults = [];
  bool _loading = false;
  bool _hasSearched = false;
  String? _error;

  Map<String, List<String>>? _wikiData;

  @override
  void initState() {
    super.initState();
    _loadWikiData();
  }

  Future<void> _loadWikiData() async {
    try {
      final raw = await rootBundle.loadString('assets/data/wiki_data.json');
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      _wikiData = decoded.map(
        (k, v) => MapEntry(k, List<String>.from(v as List)),
      );
    } catch (_) {}
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _openSection(_Section section) {
    setState(() {
      _activeSection = section;
      _activeSub = null;
      _view = _View.subs;
    });
  }

  void _openSub(_Sub sub) {
    setState(() {
      _activeSub = sub;
      _pages = [];
      _loading = true;
      _error = null;
      _view = _View.pages;
    });
    if (sub.hardcoded != null) {
      _loadHardcoded(sub.hardcoded!);
    } else if (sub.jsonKey != null) {
      _loadFromJsonKey(sub.jsonKey!);
    } else {
      _loadPages(
        sub.category,
        fallback: '${sub.label} ${_activeSection!.label}',
      );
    }
  }

  void _loadHardcoded(List<String> titles) {
    final results = titles
        .map((t) => WikiResult(pageId: 0, title: t, snippet: ''))
        .toList();
    _fetchThumbnailsHardcoded(results);
    setState(() {
      _pages = results;
      _loading = false;
    });
  }

  Future<void> _loadFromJsonKey(String key) async {
    if (_wikiData == null) {
      await _loadWikiData();
    }
    if (!mounted) return;
    final titles = _wikiData?[key] ?? [];
    final results = titles
        .map((t) => WikiResult(pageId: 0, title: t, snippet: ''))
        .toList();
    setState(() {
      _pages = results;
      _loading = false;
    });
    if (results.isNotEmpty) _fetchThumbnailsAll(results);
  }

  Future<void> _fetchThumbnailsHardcoded(List<WikiResult> results) async {
    final titleStr = results.map((r) => r.title).join('|');
    try {
      final uri = Uri.parse('https://minecraft.wiki/api.php').replace(
        queryParameters: {
          'action': 'query',
          'titles': titleStr,
          'prop': 'pageimages|info',
          'pithumbsize': '150',
          'inprop': 'url',
          'format': 'json',
          'origin': '*',
        },
      );
      final resp = await http
          .get(uri, headers: {'User-Agent': 'MCCompanionApp/1.0'})
          .timeout(const Duration(seconds: 8));
      if (!mounted) return;

      final pages =
          (jsonDecode(resp.body)['query']?['pages'] as Map<String, dynamic>?) ??
          {};
      final thumbMap = <String, String>{};
      final pageIdMap = <String, int>{};
      for (final p in pages.values) {
        final t = p['title'] as String?;
        if (t == null) continue;
        final s = p['thumbnail']?['source'] as String?;
        if (s != null) thumbMap[t] = s;
        final id = p['pageid'] as int?;
        if (id != null) pageIdMap[t] = id;
      }
      if (!mounted) return;
      setState(() {
        for (final r in results) {
          if (thumbMap.containsKey(r.title)) r.thumbnailUrl = thumbMap[r.title];
          if (pageIdMap.containsKey(r.title)) r.pageId = pageIdMap[r.title]!;
        }
      });
    } catch (_) {}
  }

  void _goBack() {
    if (_view == _View.pages) {
      setState(() {
        _view = _View.subs;
        _pages = [];
      });
      return;
    }
    if (_view == _View.subs) {
      setState(() {
        _view = _View.root;
        _activeSection = null;
      });
      return;
    }
    if (_view == _View.search) {
      _clearSearch();
    }
  }

  void _clearSearch() {
    _searchController.clear();
    _debounce?.cancel();
    setState(() {
      _view = _View.root;
      _searchResults = [];
      _hasSearched = false;
      _error = null;
    });
  }

  static const _gameTemplates = {
    'Template:Block',
    'Template:Item',
    'Template:Mob',
    'Template:Entity',
    'Template:Biome',
    'Template:Generated structure',
    'Template:Structure',
    'Template:Enchantment',
    'Template:Status effect',
    'Template:Brewing',
    'Template:Potion',
  };

  Future<List<WikiResult>> _filterByGameTemplates(List<WikiResult> results) async {
    final effectiveTemplates = _gameTemplates;
    final filtered = <WikiResult>[];
    const batchSize = 50;
    for (var i = 0; i < results.length; i += batchSize) {
      if (!mounted) break;
      final batch = results.skip(i).take(batchSize).toList();
      final titles = batch.map((r) => r.title).join('|');
      try {
        final uri = Uri.parse('https://minecraft.wiki/api.php').replace(
          queryParameters: {
            'action': 'query',
            'titles': titles,
            'prop': 'templates',
            'tllimit': '500',
            'format': 'json',
            'origin': '*',
          },
        );
        final resp = await http
            .get(uri, headers: {'User-Agent': 'MCCompanionApp/1.0'})
            .timeout(const Duration(seconds: 10));
        final pages =
            (jsonDecode(resp.body)['query']?['pages']
                as Map<String, dynamic>?) ??
            {};
        final gameTitles = <String>{};
        for (final p in pages.values) {
          final templates = (p['templates'] as List?) ?? [];
          final names = templates.map((t) => t['title'] as String).toSet();
          if (names.intersection(effectiveTemplates).isNotEmpty) {
            gameTitles.add(p['title'] as String);
          }
        }
        filtered.addAll(batch.where((r) => gameTitles.contains(r.title)));
      } catch (_) {
        filtered.addAll(batch);
      }
    }
    return filtered;
  }

  static bool _isVanilla(String title) {
    // Subpages (e.g. "End City/Structure/Base")
    if (title.contains('/')) return false;
    // Disambiguation pages
    if (title.contains('(disambiguation)')) return false;
    // Tag articles (e.g. "Biome tag (Java Edition)")
    if (title.toLowerCase().contains(' tag ') || title.toLowerCase().endsWith(' tag')) return false;

    // Spin-off games
    if (title.contains('(Dungeons)')) return false;
    if (title.contains('(Legends)')) return false;
    if (title.contains('(Earth)')) return false;
    if (title.contains('(Story Mode)')) return false;

    // Edition-specific prefixes
    if (title.startsWith('Java Edition')) return false;
    if (title.startsWith('Bedrock Edition')) return false;
    if (title.startsWith('Education Edition')) return false;
    if (title.startsWith('Pocket Edition')) return false;
    if (title.startsWith('Console Edition')) return false;
    if (title.startsWith('PlayStation')) return false;
    if (title.startsWith('Xbox 360')) return false;
    if (title.startsWith('Xbox One')) return false;
    if (title.startsWith('Wii U')) return false;
    if (title.startsWith('New Nintendo')) return false;

    // Edition version strings inside title
    if (title.contains('Edition 1.')) return false;
    if (title.contains('Edition TU')) return false;
    if (title.contains('Edition CU')) return false;

    // Snapshot/pre-release version codes  e.g. 23w14a
    if (RegExp(r'^\d+w\d+[a-z]$').hasMatch(title)) return false;
    // Version number articles  e.g. "1.20.4"
    if (RegExp(r'^\d+\.\d+').hasMatch(title)) return false;

    // Update history articles
    if (title.endsWith(' Update')) return false;
    if (RegExp(r'\bUpdate \d').hasMatch(title)) return false;

    // Minecraft book/guide titles
    if (title.startsWith('Minecraft:')) return false;

    // Third-party / inspiration games
    if (title == 'Infiniminer') return false;
    if (title == 'Dwarf Fortress') return false;

    // April Fools / joke content
    if (title.contains('Poisonous Potato') && title != 'Poisonous Potato') return false;

    // Concept/meta articles unlikely to be an actual item/block/mob
    if (title.startsWith('Biome For Player')) return false;

    return true;
  }

  Future<void> _loadPages(String category, {String? fallback}) async {
    try {
      final allResults = <WikiResult>[];
      String? continueToken;

      do {
        final params = <String, String>{
          'action': 'query',
          'list': 'categorymembers',
          'cmtitle': category,
          'cmlimit': '500',
          'cmtype': 'page',
          'cmnamespace': '0',
          'format': 'json',
          'origin': '*',
        };
        if (continueToken != null) params['cmcontinue'] = continueToken;

        final uri = Uri.parse('https://minecraft.wiki/api.php')
            .replace(queryParameters: params);
        final response = await http
            .get(uri, headers: {'User-Agent': 'MCCompanionApp/1.0'})
            .timeout(const Duration(seconds: 10));
        if (!mounted) return;

        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final members = (data['query']?['categorymembers'] as List?) ?? [];
        allResults.addAll(
          members
              .map((m) => WikiResult(
                    pageId: m['pageid'] as int,
                    title: m['title'] as String,
                    snippet: '',
                  ))
              .where((r) => _isVanilla(r.title)),
        );

        continueToken =
            (data['continue'] as Map<String, dynamic>?)?['cmcontinue']
                as String?;
      } while (continueToken != null);

      if (!mounted) return;

      if (allResults.isEmpty && fallback != null) {
        await _searchIntoPages(fallback);
        return;
      }

      final filtered = await _filterByGameTemplates(allResults);
      if (!mounted) return;
      setState(() {
        _pages = filtered;
        _loading = false;
      });

      if (filtered.isNotEmpty) _fetchThumbnailsAll(filtered);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _error = 'Could not load pages.';
        _loading = false;
      });
    }
  }

  Future<void> _searchIntoPages(String query) async {
    try {
      final uri = Uri.parse('https://minecraft.wiki/api.php').replace(
        queryParameters: {
          'action': 'query',
          'list': 'search',
          'srsearch': query,
          'srnamespace': '0',
          'srlimit': '40',
          'utf8': '1',
          'format': 'json',
          'origin': '*',
        },
      );
      final resp = await http
          .get(uri, headers: {'User-Agent': 'MCCompanionApp/1.0'})
          .timeout(const Duration(seconds: 10));
      if (!mounted) return;

      final hits = (jsonDecode(resp.body)['query']?['search'] as List?) ?? [];
      final results = hits
          .map(
            (h) => WikiResult(
              pageId: h['pageid'] as int,
              title: h['title'] as String,
              snippet: '',
            ),
          )
          .where((r) => _isVanilla(r.title))
          .toList();

      if (results.isNotEmpty) _fetchThumbnails(results);
      setState(() {
        _pages = results;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _error = 'Could not load pages.';
        _loading = false;
      });
    }
  }

  Future<void> _fetchThumbnails(List<WikiResult> results) =>
      _fetchThumbnailsAll(results);

  Future<void> _fetchThumbnailsAll(List<WikiResult> results) async {
    const batchSize = 50;
    for (var i = 0; i < results.length; i += batchSize) {
      if (!mounted) return;
      final batch = results.skip(i).take(batchSize).toList();
      final titles = batch.map((r) => r.title).join('|');
      try {
        final uri = Uri.parse('https://minecraft.wiki/api.php').replace(
          queryParameters: {
            'action': 'query',
            'titles': titles,
            'prop': 'pageimages',
            'pithumbsize': '150',
            'format': 'json',
            'origin': '*',
          },
        );
        final resp = await http
            .get(uri, headers: {'User-Agent': 'MCCompanionApp/1.0'})
            .timeout(const Duration(seconds: 8));
        if (!mounted) return;

        final pages =
            (jsonDecode(resp.body)['query']?['pages']
                as Map<String, dynamic>?) ??
            {};
        final map = <String, String>{};
        for (final p in pages.values) {
          final t = p['title'] as String?;
          final s = p['thumbnail']?['source'] as String?;
          if (t != null && s != null) map[t] = s;
        }
        setState(() {
          for (final r in batch) {
            if (map.containsKey(r.title)) r.thumbnailUrl = map[r.title];
          }
        });
      } catch (_) {}
    }
  }

  void _onSearchChanged(String q) {
    _debounce?.cancel();
    if (q.trim().isEmpty) {
      setState(() {
        _searchResults = [];
        _hasSearched = false;
        _error = null;
        _view = _View.root;
      });
      return;
    }
    setState(() {
      _view = _View.search;
    });
    _debounce = Timer(const Duration(milliseconds: 400), () => _search(q));
  }

  Future<void> _search(String query) async {
    if (!mounted) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final uri = Uri.parse('https://minecraft.wiki/api.php').replace(
        queryParameters: {
          'action': 'query',
          'list': 'search',
          'srsearch': query,
          'srnamespace': '0',
          'srlimit': '20',
          'utf8': '1',
          'format': 'json',
          'origin': '*',
        },
      );
      final resp = await http
          .get(uri, headers: {'User-Agent': 'MCCompanionApp/1.0'})
          .timeout(const Duration(seconds: 10));
      if (!mounted) return;

      final hits = (jsonDecode(resp.body)['query']?['search'] as List?) ?? [];
      final results = hits
          .map(
            (h) => WikiResult(
              pageId: h['pageid'] as int,
              title: h['title'] as String,
              snippet: _strip(h['snippet'] as String? ?? ''),
            ),
          )
          .toList();
      if (results.isNotEmpty) _fetchThumbnails(results);
      setState(() {
        _searchResults = results;
        _hasSearched = true;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _error = 'Could not reach the Minecraft Wiki.';
        _loading = false;
      });
    }
  }

  String _strip(String html) => html
      .replaceAll(RegExp(r'<[^>]*>'), '')
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>')
      .replaceAll('&amp;', '&')
      .replaceAll('&quot;', '"')
      .replaceAll('&#039;', "'")
      .trim();

  void _openDetail(WikiResult r) => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (_) => WikiDetailScreen(result: r)));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        Expanded(child: _buildBody()),
      ],
    );
  }

  Widget _buildHeader() {
    final bool canBack = _view != _View.root;
    String title;
    switch (_view) {
      case _View.subs:
        title = _activeSection!.label;
        break;
      case _View.pages:
        title = _activeSub!.label;
        break;
      case _View.search:
        title = 'Wiki';
        break;
      case _View.root:
        title = 'Wiki';
        break;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (canBack)
                GestureDetector(
                  onTap: _goBack,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10, top: 2, bottom: 2),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppTheme.textSecondary,
                      size: 18,
                    ),
                  ),
                ),
              if (_view == _View.pages) ...[
                GestureDetector(
                  onTap: () => setState(() {
                    _view = _View.subs;
                    _pages = [];
                  }),
                  child: Text(
                    _activeSection!.label,
                    style: const TextStyle(
                      color: AppTheme.accent,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    color: AppTheme.textMuted,
                    size: 16,
                  ),
                ),
              ],
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: _view == _View.root ? 24 : 20,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (_view == _View.root)
                const Text(
                  'minecraft.wiki',
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                ),
            ],
          ),
          const SizedBox(height: 14),
          TextField(
            controller: _searchController,
            onChanged: _onSearchChanged,
            style: const TextStyle(color: AppTheme.textPrimary, fontSize: 14),
            decoration: InputDecoration(
              hintText: 'Search mobs, items, blocks…',
              hintStyle: const TextStyle(
                color: AppTheme.textMuted,
                fontSize: 13,
              ),
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 14,
                  color: AppTheme.textMuted,
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 40,
                minHeight: 40,
              ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(
                        Icons.close_rounded,
                        color: AppTheme.textMuted,
                        size: 18,
                      ),
                      onPressed: _clearSearch,
                    )
                  : null,
              filled: true,
              fillColor: AppTheme.surface,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppTheme.borderGray),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppTheme.borderGray),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppTheme.accent,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_loading)
      return const Center(
        child: CircularProgressIndicator(color: AppTheme.accent),
      );

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
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
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      );
    }

    switch (_view) {
      case _View.root:
        return _buildRoot();
      case _View.subs:
        return _buildSubs();
      case _View.pages:
        return _buildPageList(_pages);
      case _View.search:
        return _buildPageList(_searchResults);
    }
  }

  Widget _buildRoot() {
    final items = _sections;
    final rows = <Widget>[];
    for (int i = 0; i < items.length; i += 2) {
      final isLast = i + 1 >= items.length;
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _WikiCard(
                  section: items[i],
                  onTap: () => _openSection(items[i]),
                ),
              ),
              if (!isLast) ...[
                const SizedBox(width: 10),
                Expanded(
                  child: _WikiCard(
                    section: items[i + 1],
                    onTap: () => _openSection(items[i + 1]),
                  ),
                ),
              ] else
                const Expanded(child: SizedBox()),
            ],
          ),
        ),
      );
      if (i + 2 < items.length) rows.add(const SizedBox(height: 10));
    }
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight - 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: rows,
          ),
        ),
      ),
    );
  }

  Widget _buildSubs() {
    final subs = _activeSection!.subs;
    final color = _activeSection!.color;
    final rows = <Widget>[];
    for (int i = 0; i < subs.length; i += 2) {
      final isLast = i + 1 >= subs.length;
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _SubCard(
                  sub: subs[i],
                  color: color,
                  onTap: () => _openSub(subs[i]),
                ),
              ),
              if (!isLast) ...[
                const SizedBox(width: 10),
                Expanded(
                  child: _SubCard(
                    sub: subs[i + 1],
                    color: color,
                    onTap: () => _openSub(subs[i + 1]),
                  ),
                ),
              ] else
                const Expanded(child: SizedBox()),
            ],
          ),
        ),
      );
      if (i + 2 < subs.length) rows.add(const SizedBox(height: 10));
    }
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight - 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: rows,
          ),
        ),
      ),
    );
  }

  Widget _buildPageList(List<WikiResult> results) {
    if (results.isEmpty && _hasSearched) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FaIcon(
              FontAwesomeIcons.bookOpen,
              color: AppTheme.textMuted,
              size: 28,
            ),
            const SizedBox(height: 12),
            Text(
              'No results for "${_searchController.text}"',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }
    if (results.isEmpty) {
      return const Center(
        child: Text(
          'No pages found in this category.',
          style: TextStyle(color: AppTheme.textMuted, fontSize: 13),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      itemCount: results.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, i) =>
          _PageCard(result: results[i], onTap: () => _openDetail(results[i])),
    );
  }
}

class _WikiCard extends StatefulWidget {
  final _Section section;
  final VoidCallback onTap;

  const _WikiCard({
    required this.section,
    required this.onTap,
  });

  @override
  State<_WikiCard> createState() => _WikiCardState();
}

class _WikiCardState extends State<_WikiCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.section.color;
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        decoration: BoxDecoration(
          color: _pressed
              ? AppTheme.surfaceRaised.withOpacity(0.75)
              : AppTheme.surface.withOpacity(0.60),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  widget.section.emoji,
                  style: const TextStyle(fontSize: 26),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.section.label,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${widget.section.subs.length} categories',
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 11,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 11,
              color: color.withOpacity(0.60),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubCard extends StatelessWidget {
  final _Sub sub;
  final Color color;
  final VoidCallback onTap;
  const _SubCard({required this.sub, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        decoration: BoxDecoration(
          color: AppTheme.surface.withOpacity(0.60),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.borderGray),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(sub.emoji, style: const TextStyle(fontSize: 26)),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                sub.label,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 11,
              color: color.withOpacity(0.60),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageCard extends StatelessWidget {
  final WikiResult result;
  final VoidCallback onTap;
  const _PageCard({required this.result, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppTheme.borderGray),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: result.thumbnailUrl != null
                    ? Image.network(
                        result.thumbnailUrl!,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _placeholder(),
                      )
                    : _placeholder(),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  result.title,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppTheme.textMuted,
                size: 13,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _placeholder() => Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(
      color: AppTheme.accent.withOpacity(0.08),
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Center(child: Text('⛏️', style: TextStyle(fontSize: 20))),
  );
}

class _ArticleSection {
  final String? title;
  final String content;
  const _ArticleSection({required this.title, required this.content});
}

class _CraftingRecipe {
  final Map<String, String> grid;
  final String output;
  final int outputCount;
  const _CraftingRecipe({
    required this.grid,
    required this.output,
    this.outputCount = 1,
  });
}

class WikiDetailScreen extends StatefulWidget {
  final WikiResult result;
  const WikiDetailScreen({super.key, required this.result});

  @override
  State<WikiDetailScreen> createState() => _WikiDetailScreenState();
}

class _WikiDetailScreenState extends State<WikiDetailScreen> {
  List<_ArticleSection> _sections = [];
  List<_CraftingRecipe> _craftingRecipes = [];
  String? _imageUrl;
  bool _loading = true;
  String? _error;

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
        _error = 'Could not load page content.';
        _loading = false;
      });
    }
  }

  List<_ArticleSection> _parseSections(String text) {
    final result = <_ArticleSection>[];
    final headerRx = RegExp(r'^={2,4}\s*(.+?)\s*={2,4}\s*$', multiLine: true);
    int lastEnd = 0;
    String? lastTitle;
    for (final m in headerRx.allMatches(text)) {
      final content = text.substring(lastEnd, m.start).trim();
      if (content.isNotEmpty || lastTitle != null)
        result.add(_ArticleSection(title: lastTitle, content: content));
      lastTitle = m.group(1);
      lastEnd = m.end;
    }
    final tail = text.substring(lastEnd).trim();
    if (tail.isNotEmpty || lastTitle != null)
      result.add(_ArticleSection(title: lastTitle, content: tail));
    return result
        .where(
          (s) => s.content.isNotEmpty && !_hiddenSections.contains(s.title),
        )
        .toList();
  }

  List<_CraftingRecipe> _parseCraftingRecipes(String wikitext) {
    final result = <_CraftingRecipe>[];
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

  _CraftingRecipe? _parseOneTemplate(String block) {
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
    return _CraftingRecipe(grid: grid, output: output, outputCount: count);
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
    if (await canLaunchUrl(url))
      await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 8, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppTheme.textSecondary,
                      size: 18,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.result.title,
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: _openInBrowser,
                    icon: const FaIcon(
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
  }

  Widget _buildContent() {
    if (_loading)
      return const Center(
        child: CircularProgressIndicator(color: AppTheme.accent),
      );

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
              style: const TextStyle(color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _openInBrowser,
              icon: const FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                size: 13,
              ),
              label: const Text('Open in browser'),
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
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],

        if (_craftingRecipes.isNotEmpty) ...[
          const Text(
            'Crafting',
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
              child: _CraftingGridWidget(recipe: r),
            ),
          ),
          const SizedBox(height: 8),
          const Divider(color: AppTheme.borderDim, height: 1),
          const SizedBox(height: 20),
        ],

        if (intro != null && intro.content.isNotEmpty) ...[
          Text(
            intro.content,
            style: const TextStyle(
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
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                s.content,
                style: const TextStyle(
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
          label: const Text('Read full article on minecraft.wiki'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppTheme.accent,
            side: const BorderSide(color: AppTheme.accent),
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

class _CraftingGridWidget extends StatelessWidget {
  final _CraftingRecipe recipe;
  const _CraftingGridWidget({required this.recipe});

  static const _cellSize = 46.0;
  static const _gap = 3.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF141C24),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _row(['A1', 'B1', 'C1']),
              const SizedBox(height: _gap),
              _row(['A2', 'B2', 'C2']),
              const SizedBox(height: _gap),
              _row(['A3', 'B3', 'C3']),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(
              Icons.arrow_forward_rounded,
              color: AppTheme.textMuted,
              size: 20,
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              _cell(recipe.output),
              if (recipe.outputCount > 1)
                Positioned(
                  right: 2,
                  bottom: 2,
                  child: Text(
                    '${recipe.outputCount}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(blurRadius: 2, color: Colors.black)],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _row(List<String> positions) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      for (int i = 0; i < positions.length; i++) ...[
        if (i > 0) const SizedBox(width: _gap),
        _cell(recipe.grid[positions[i]]),
      ],
    ],
  );

  Widget _cell(String? item) {
    return Container(
      width: _cellSize,
      height: _cellSize,
      decoration: BoxDecoration(
        color: const Color(0xFF2D3A4A),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF1A2530), width: 1.5),
      ),
      child: item != null && item.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(4),
              child: Image.network(
                'https://minecraft.wiki/images/Invicon_${item.replaceAll(' ', '_')}.png',
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      item.length > 12 ? '${item.substring(0, 11)}…' : item,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 7.5,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
