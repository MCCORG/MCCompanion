class DirectoryServer {
  const DirectoryServer({
    required this.slug,
    required this.host,
    required this.name,
    required this.port,
    required this.edition,
    required this.crossplay,
    required this.tags,
    required this.claimed,
    required this.featured,
    required this.avgPlayers,
    required this.peakPlayers,
    required this.uptime,
    required this.votesMonth,
    required this.votesAllTime,
    this.motd,
    this.description,
    this.version,
    this.iconUrl,
    this.bannerUrl,
    this.websiteUrl,
    this.discordUrl,
  });

  final String slug;
  final String host;
  final String name;
  final int port;
  final String edition;
  final bool crossplay;
  final List<String> tags;
  final bool claimed;
  final bool featured;
  final double avgPlayers;
  final int peakPlayers;
  final int uptime;
  final int votesMonth;
  final int votesAllTime;
  final String? motd;
  final String? description;
  final String? version;
  final String? iconUrl;
  final String? bannerUrl;
  final String? websiteUrl;
  final String? discordUrl;

  String get connectAddress =>
      port == 19132 ? host : '$host:$port';

  String? get blurb {
    final own = description?.trim();
    if (own != null && own.isNotEmpty) return own;
    final broadcast = motd?.trim();
    return (broadcast != null && broadcast.isNotEmpty) ? broadcast : null;
  }

  ServerEdition get editionBadge {
    if (crossplay) return ServerEdition.crossplay;
    return edition == 'java' ? ServerEdition.java : ServerEdition.bedrock;
  }
  String? get usefulVersion {
    final clean = version?.trim();
    if (clean == null || clean.isEmpty) return null;
    return RegExp(r'^v?[01](\.0+)?$').hasMatch(clean) ? null : clean;
  }

  factory DirectoryServer.fromJson(Map<String, dynamic> json) {
    double toDouble(dynamic value) =>
        value is num ? value.toDouble() : double.tryParse('$value') ?? 0;
    int toInt(dynamic value) =>
        value is num ? value.toInt() : int.tryParse('$value') ?? 0;

    return DirectoryServer(
      slug: json['slug'] as String? ?? '',
      host: json['host'] as String? ?? '',
      name: json['name'] as String? ?? json['host'] as String? ?? '',
      port: toInt(json['port'] ?? 19132),
      edition: json['edition'] as String? ?? 'MCPE',
      crossplay: json['crossplay'] as bool? ?? false,
      tags: (json['tags'] as List<dynamic>? ?? const [])
          .map((tag) => '$tag')
          .toList(growable: false),
      claimed: json['claimed'] as bool? ?? false,
      featured: json['featured'] as bool? ?? false,
      avgPlayers: toDouble(json['avgPlayers']),
      peakPlayers: toInt(json['peakPlayers']),
      uptime: toInt(json['uptime']),
      votesMonth: toInt(json['votesMonth']),
      votesAllTime: toInt(json['votesAllTime']),
      motd: json['motd'] as String?,
      description: json['description'] as String?,
      version: json['version'] as String?,
      iconUrl: json['iconUrl'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      websiteUrl: json['websiteUrl'] as String?,
      discordUrl: json['discordUrl'] as String?,
    );
  }
}

enum ServerEdition { java, bedrock, crossplay }

class DirectoryPage {
  const DirectoryPage({required this.servers, required this.total});

  final List<DirectoryServer> servers;
  final int total;

  static const empty = DirectoryPage(servers: [], total: 0);
}

class ServerTag {
  const ServerTag({required this.tag, required this.count});

  final String tag;
  final int count;

  factory ServerTag.fromJson(Map<String, dynamic> json) => ServerTag(
    tag: json['tag'] as String? ?? '',
    count: (json['servers'] as num?)?.toInt() ?? 0,
  );
}

class VoteCounts {
  const VoteCounts({required this.month, required this.allTime});

  final int month;
  final int allTime;

  static const zero = VoteCounts(month: 0, allTime: 0);

  factory VoteCounts.fromJson(Map<String, dynamic>? json) {
    if (json == null) return zero;
    int toInt(dynamic value) =>
        value is num ? value.toInt() : int.tryParse('$value') ?? 0;
    return VoteCounts(
      month: toInt(json['month']),
      allTime: toInt(json['allTime']),
    );
  }
}

class VoteResult {
  const VoteResult({
    required this.ok,
    this.delivered = false,
    this.votes,
    this.error,
    this.message,
  });

  final bool ok;
  final bool delivered;
  final VoteCounts? votes;
  final String? error;
  final String? message;
}
