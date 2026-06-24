import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../widgets/components/swipe_back.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../widgets/wiki/wiki_cards.dart';
import 'wiki_detail_screen.dart';

class WikiSub {
  final String label;
  final String emoji;
  final String category;
  final List<String>? hardcoded;
  final String? jsonKey;
  final String? imagePath;
  const WikiSub({
    required this.label,
    required this.emoji,
    required this.category,
    this.hardcoded,
    this.jsonKey,
    this.imagePath,
  });
}

class WikiSection {
  final String label;
  final String emoji;
  final Color color;
  final List<WikiSub> subs;
  final String imagePath;
  const WikiSection({
    required this.label,
    required this.emoji,
    required this.color,
    required this.subs,
    required this.imagePath,
  });
}

const _sections = [
  WikiSection(
    label: 'Mobs',
    emoji: '🧟',
    color: Color(0xFF4CAF50),
    imagePath: 'assets/images/wiki/mobs.png',
    subs: [
      WikiSub(
        label: 'Passive',
        emoji: '🐄',
        category: 'Category:Passive mobs',
        jsonKey: 'mobs_passive',
        imagePath: 'assets/images/wiki/chicken.png',
      ),
      WikiSub(
        label: 'Neutral',
        emoji: '🐺',
        category: 'Category:Neutral mobs',
        jsonKey: 'mobs_neutral',
        imagePath: 'assets/images/wiki/spider.png',
      ),
      WikiSub(
        label: 'Hostile',
        emoji: '💀',
        category: 'Category:Hostile mobs',
        jsonKey: 'mobs_hostile',
        imagePath: 'assets/images/wiki/creeper.png',
      ),
      WikiSub(
        label: 'Boss',
        emoji: '👑',
        category: 'Category:Boss mobs',
        jsonKey: 'mobs_boss',
        imagePath: 'assets/images/wiki/ender_dragon.png',
      ),
      WikiSub(
        label: 'Utility',
        emoji: '🤖',
        category: 'Category:Utility mobs',
        jsonKey: 'mobs_utility',
        imagePath: 'assets/images/wiki/iron_golem.png',
      ),
    ],
  ),
  WikiSection(
    label: 'Blocks',
    emoji: '🧱',
    color: Color(0xFF795548),
    imagePath: 'assets/images/wiki/blocks.png',
    subs: [
      WikiSub(
        label: 'Natural',
        emoji: '🌿',
        category: 'Category:Natural blocks',
        jsonKey: 'blocks_natural',
        imagePath: 'assets/images/wiki/dirt.png',
      ),
      WikiSub(
        label: 'Ores',
        emoji: '💎',
        category: 'Category:Ores',
        jsonKey: 'blocks_ores',
        imagePath: 'assets/images/wiki/raw_gold.png',
      ),
      WikiSub(
        label: 'Wood',
        emoji: '🌲',
        category: 'Category:Wood',
        jsonKey: 'blocks_wood',
        imagePath: 'assets/images/wiki/log.png',
      ),
      WikiSub(
        label: 'Stone',
        emoji: '🪨',
        category: 'Category:Stone',
        jsonKey: 'blocks_stone',
        imagePath: 'assets/images/wiki/stone.png',
      ),
      WikiSub(
        label: 'Redstone',
        emoji: '🔴',
        category: 'Category:Redstone components',
        jsonKey: 'blocks_redstone',
        imagePath: 'assets/images/wiki/redstone.png',
      ),
      WikiSub(
        label: 'Plants',
        emoji: '🌱',
        category: 'Category:Plants',
        jsonKey: 'blocks_plants',
        imagePath: 'assets/images/wiki/bamboo.png',
      ),
      WikiSub(
        label: 'Decoration',
        emoji: '🪟',
        category: 'Category:Decoration blocks',
        jsonKey: 'blocks_decoration',
        imagePath: 'assets/images/wiki/obsidian.png',
      ),
    ],
  ),
  WikiSection(
    label: 'Items',
    emoji: '⚔️',
    color: Color(0xFF2196F3),
    imagePath: 'assets/images/wiki/items.png',
    subs: [
      WikiSub(
        label: 'Tools',
        emoji: '🪓',
        category: 'Category:Tools',
        jsonKey: 'items_tools',
        imagePath: 'assets/images/wiki/tools.gif',
      ),
      WikiSub(
        label: 'Swords',
        emoji: '⚔️',
        category: 'Category:Swords',
        imagePath: 'assets/images/wiki/sword.gif',
        hardcoded: [
          'Wooden Sword',
          'Stone Sword',
          'Iron Sword',
          'Golden Sword',
          'Diamond Sword',
          'Netherite Sword',
        ],
      ),
      WikiSub(
        label: 'Ranged',
        emoji: '🏹',
        category: 'Category:Ranged weapons',
        imagePath: 'assets/images/wiki/bow.png',
        hardcoded: ['Bow', 'Crossbow', 'Trident', 'Wind Charge'],
      ),
      WikiSub(
        label: 'Armor',
        emoji: '🛡️',
        category: 'Category:Armor',
        jsonKey: 'items_armor',
        imagePath: 'assets/images/wiki/armor.png',
      ),
      WikiSub(
        label: 'Food',
        emoji: '🍎',
        category: 'Category:Food',
        jsonKey: 'items_food',
        imagePath: 'assets/images/wiki/apple.png',
      ),
      WikiSub(
        label: 'Brewing',
        emoji: '🧪',
        category: 'Category:Brewing',
        jsonKey: 'items_brewing',
        imagePath: 'assets/images/wiki/brew.png',
      ),
      WikiSub(
        label: 'Materials',
        emoji: '🔩',
        category: 'Category:Materials',
        jsonKey: 'items_materials',
        imagePath: 'assets/images/wiki/gold.png',
      ),
    ],
  ),
  WikiSection(
    label: 'Biomes',
    emoji: '🌿',
    color: Color(0xFF66BB6A),
    imagePath: 'assets/images/wiki/biomes.png',
    subs: [
      WikiSub(
        label: 'Overworld',
        emoji: '☀️',
        category: 'Category:Overworld biomes',
        jsonKey: 'biomes_overworld',
        imagePath: 'assets/images/wiki/overworld.png',
      ),
      WikiSub(
        label: 'Nether',
        emoji: '🔥',
        category: 'Category:Nether biomes',
        jsonKey: 'biomes_nether',
        imagePath: 'assets/images/wiki/nether.png',
      ),
      WikiSub(
        label: 'The End',
        emoji: '🌑',
        category: 'Category:The End biomes',
        jsonKey: 'biomes_end',
        imagePath: 'assets/images/wiki/end.png',
      ),
    ],
  ),
  WikiSection(
    label: 'Structures',
    emoji: '🏰',
    color: Color(0xFF9C27B0),
    imagePath: 'assets/images/wiki/structures.png',
    subs: [
      WikiSub(
        label: 'Overworld',
        emoji: '🗺️',
        category: 'Category:Overworld structures',
        jsonKey: 'structures_overworld',
        imagePath: 'assets/images/wiki/overworld.png',
      ),
      WikiSub(
        label: 'Nether',
        emoji: '🔥',
        category: 'Category:Nether structures',
        jsonKey: 'structures_nether',
        imagePath: 'assets/images/wiki/nether.png',
      ),
      WikiSub(
        label: 'The End',
        emoji: '🌑',
        category: 'Category:The End structures',
        jsonKey: 'structures_end',
        imagePath: 'assets/images/wiki/end.png',
      ),
    ],
  ),
  WikiSection(
    label: 'Enchantments',
    emoji: '✨',
    color: Color(0xFFFF9800),
    imagePath: 'assets/images/wiki/enchantments.png',
    subs: [
      WikiSub(
        label: 'Sword',
        emoji: '⚔️',
        category: 'Category:Sword enchantments',
        jsonKey: 'enchantments_sword',
        imagePath: 'assets/images/wiki/sword.gif',
      ),
      WikiSub(
        label: 'Armor',
        emoji: '🛡️',
        category: 'Category:Armor enchantments',
        jsonKey: 'enchantments_armor',
        imagePath: 'assets/images/wiki/armor.png',
      ),
      WikiSub(
        label: 'Tool',
        emoji: '🪓',
        category: 'Category:Tool enchantments',
        jsonKey: 'enchantments_tool',
        imagePath: 'assets/images/wiki/tools.gif',
      ),
      WikiSub(
        label: 'Bow',
        emoji: '🏹',
        category: 'Category:Bow enchantments',
        jsonKey: 'enchantments_bow',
        imagePath: 'assets/images/wiki/bow.png',
      ),
      WikiSub(
        label: 'Fishing',
        emoji: '🎣',
        category: 'Category:Fishing Rod enchantments',
        jsonKey: 'enchantments_fishing',
        imagePath: 'assets/images/wiki/fishing.png',
      ),
    ],
  ),
  WikiSection(
    label: 'Potions',
    emoji: '🧪',
    color: Color(0xFFE91E63),
    imagePath: 'assets/images/wiki/potions.png',
    subs: [
      WikiSub(
        label: 'Potions',
        emoji: '🧪',
        category: 'Category:Potions',
        jsonKey: 'potions_potions',
        imagePath: 'assets/images/wiki/brew.png',
      ),
      WikiSub(
        label: 'Status Effects',
        emoji: '💫',
        category: 'Category:Status effects',
        jsonKey: 'potions_effects',
        imagePath: 'assets/images/wiki/effect.png',
      ),
    ],
  ),
];

String wikiL10n(AppLocalizations l, String key) {
  switch (key) {
    case 'Mobs':
      return l.wikiMobs;
    case 'Blocks':
      return l.wikiBlocks;
    case 'Items':
      return l.wikiItems;
    case 'Biomes':
      return l.wikiBiomes;
    case 'Structures':
      return l.wikiStructures;
    case 'Enchantments':
      return l.wikiEnchantments;
    case 'Potions':
      return l.wikiPotions;
    case 'Passive':
      return l.wikiPassive;
    case 'Neutral':
      return l.wikiNeutral;
    case 'Hostile':
      return l.wikiHostile;
    case 'Boss':
      return l.wikiBoss;
    case 'Utility':
      return l.wikiUtility;
    case 'Natural':
      return l.wikiNatural;
    case 'Ores':
      return l.wikiOres;
    case 'Wood':
      return l.wikiWood;
    case 'Stone':
      return l.wikiStone;
    case 'Redstone':
      return l.wikiRedstone;
    case 'Plants':
      return l.wikiPlants;
    case 'Decoration':
      return l.wikiDecoration;
    case 'Tools':
      return l.wikiTools;
    case 'Swords':
      return l.wikiSwords;
    case 'Ranged':
      return l.wikiRanged;
    case 'Armor':
      return l.wikiArmor;
    case 'Food':
      return l.wikiFood;
    case 'Brewing':
      return l.wikiBrewing;
    case 'Materials':
      return l.wikiMaterials;
    case 'Overworld':
      return l.wikiOverworld;
    case 'Nether':
      return l.wikiNether;
    case 'The End':
      return l.wikiTheEnd;
    case 'Sword':
      return l.wikiSword;
    case 'Tool':
      return l.wikiTool;
    case 'Bow':
      return l.wikiBow;
    case 'Fishing':
      return l.wikiFishing;
    case 'Status Effects':
      return l.wikiStatusEffects;
    default:
      return key;
  }
}

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

enum _View { root, subs, pages, search, detail }

class WikiScreen extends StatefulWidget {
  const WikiScreen({super.key, this.onBack});
  final VoidCallback? onBack;

  @override
  State<WikiScreen> createState() => _WikiScreenState();
}

class _WikiScreenState extends State<WikiScreen> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  _View _view = _View.root;
  WikiSection? _activeSection;
  WikiSub? _activeSub;
  WikiResult? _detailResult;

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

  void _openSection(WikiSection section) {
    setState(() {
      _activeSection = section;
      _activeSub = null;
      _view = _View.subs;
    });
  }

  void _openSub(WikiSub sub) {
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
    if (_view == _View.detail) {
      setState(() => _view = _previousView);
      return;
    }
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

  Future<List<WikiResult>> _filterByGameTemplates(
    List<WikiResult> results,
  ) async {
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
    if (title.contains('/')) return false;
    if (title.contains('(disambiguation)')) return false;
    if (title.toLowerCase().contains(' tag ') ||
        title.toLowerCase().endsWith(' tag'))
      return false;

    if (title.contains('(Dungeons)')) return false;
    if (title.contains('(Legends)')) return false;
    if (title.contains('(Earth)')) return false;
    if (title.contains('(Story Mode)')) return false;

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

    if (title.contains('Edition 1.')) return false;
    if (title.contains('Edition TU')) return false;
    if (title.contains('Edition CU')) return false;

    if (RegExp(r'^\d+w\d+[a-z]$').hasMatch(title)) return false;
    if (RegExp(r'^\d+\.\d+').hasMatch(title)) return false;

    if (title.endsWith(' Update')) return false;
    if (RegExp(r'\bUpdate \d').hasMatch(title)) return false;

    if (title.startsWith('Minecraft:')) return false;

    if (title == 'Infiniminer') return false;
    if (title == 'Dwarf Fortress') return false;

    if (title.contains('Poisonous Potato') && title != 'Poisonous Potato')
      return false;

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

        final uri = Uri.parse(
          'https://minecraft.wiki/api.php',
        ).replace(queryParameters: params);
        final response = await http
            .get(uri, headers: {'User-Agent': 'MCCompanionApp/1.0'})
            .timeout(const Duration(seconds: 10));
        if (!mounted) return;

        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final members = (data['query']?['categorymembers'] as List?) ?? [];
        allResults.addAll(
          members
              .map(
                (m) => WikiResult(
                  pageId: m['pageid'] as int,
                  title: m['title'] as String,
                  snippet: '',
                ),
              )
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
        _error = AppLocalizations.of(context)!.wikiCouldNotLoadPages;
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
        _error = AppLocalizations.of(context)!.wikiCouldNotLoadPages;
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
        _error = AppLocalizations.of(context)!.wikiCouldNotReach;
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

  void _openDetail(WikiResult r) => setState(() {
    _detailResult = r;
    _view = _View.detail;
  });

  @override
  Widget build(BuildContext context) {
    final column = Column(
      children: [
        _buildHeader(),
        Expanded(child: _buildBody()),
      ],
    );
    final backFn = _view != _View.root ? _goBack : widget.onBack;
    if (backFn != null) {
      return SwipeBack(onBack: backFn, child: column);
    }
    return column;
  }

  Widget _buildHeader() {
    final l = AppLocalizations.of(context)!;
    final bool canBack = _view != _View.root;
    String title;
    switch (_view) {
      case _View.subs:
        title = wikiL10n(l, _activeSection!.label);
        break;
      case _View.pages:
        title = wikiL10n(l, _activeSub!.label);
        break;
      case _View.search:
        title = l.wikiTitle;
        break;
      case _View.root:
        title = l.wikiTitle;
        break;
      case _View.detail:
        title = _detailResult?.title ?? l.wikiTitle;
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
                  child: Padding(
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
                    wikiL10n(l, _activeSection!.label),
                    style: TextStyle(
                      color: AppTheme.accent,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
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
                Text(
                  l.wikiMinecraftWiki,
                  style: TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                  ),
                ),
            ],
          ),
          if (_view != _View.detail) ...[
          const SizedBox(height: 14),
          TextField(
            controller: _searchController,
            onChanged: _onSearchChanged,
            style: TextStyle(color: AppTheme.textPrimary, fontSize: 14),
            decoration: InputDecoration(
              hintText: l.wikiSearchHint,
              hintStyle: TextStyle(
                color: AppTheme.textMuted,
                fontSize: 13,
              ),
              prefixIcon: Padding(
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
                      icon: Icon(
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
                borderSide: BorderSide(color: AppTheme.accent, width: 1.5),
              ),
            ),
          ),
          ],
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_loading)
      return Center(child: CircularProgressIndicator(color: AppTheme.accent));

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
                style: TextStyle(
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
      case _View.detail:
        if (_detailResult == null) return _buildRoot();
        return WikiDetailScreen(
          key: ValueKey(_detailResult!.title),
          result: _detailResult!,
          onBack: () => setState(() => _view = _previousView),
        );
    }
  }

  _View get _previousView {
    if (_pages.isNotEmpty) return _View.pages;
    if (_searchResults.isNotEmpty) return _View.search;
    if (_activeSub != null) return _View.pages;
    return _View.root;
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
                child: WikiSectionCard(
                  section: items[i],
                  onTap: () => _openSection(items[i]),
                ),
              ),
              if (!isLast) ...[
                const SizedBox(width: 10),
                Expanded(
                  child: WikiSectionCard(
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
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: constraints.maxWidth > 700 ? 900 : double.infinity),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: rows,
              ),
            ),
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
                child: WikiSubCard(
                  sub: subs[i],
                  color: color,
                  onTap: () => _openSub(subs[i]),
                ),
              ),
              if (!isLast) ...[
                const SizedBox(width: 10),
                Expanded(
                  child: WikiSubCard(
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
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: constraints.maxWidth > 700 ? 900 : double.infinity),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: rows,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageList(List<WikiResult> results) {
    final l = AppLocalizations.of(context)!;
    if (results.isEmpty && _hasSearched) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              FontAwesomeIcons.bookOpen,
              color: AppTheme.textMuted,
              size: 28,
            ),
            const SizedBox(height: 12),
            Text(
              l.wikiNoResults(_searchController.text),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }
    if (results.isEmpty) {
      return Center(
        child: Text(
          l.wikiNoPagesFound,
          style: TextStyle(color: AppTheme.textMuted, fontSize: 13),
        ),
      );
    }
    return LayoutBuilder(
      builder: (context, constraints) => ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
        itemCount: results.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, i) => constraints.maxWidth > 700
            ? Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: WikiPageCard(result: results[i], onTap: () => _openDetail(results[i])),
                ),
              )
            : WikiPageCard(result: results[i], onTap: () => _openDetail(results[i])),
      ),
    );
  }
}
