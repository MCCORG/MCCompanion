class TrackedServer {
  final String id;
  final String firebaseUid;
  final String name;
  final String ip;
  final int port;
  final String platform;
  final String lastStatus;
  final bool notificationsEnabled;
  final DateTime? lastCheckedAt;
  final DateTime createdAt;

  final int? players;
  final int? maxPlayers;
  final String? version;
  final String? gameMode;

  const TrackedServer({
    required this.id,
    required this.firebaseUid,
    required this.name,
    required this.ip,
    required this.port,
    required this.platform,
    required this.lastStatus,
    this.notificationsEnabled = true,
    this.lastCheckedAt,
    required this.createdAt,
    this.players,
    this.maxPlayers,
    this.version,
    this.gameMode,
  });

  factory TrackedServer.fromJson(Map<String, dynamic> json) {
    return TrackedServer(
      id: json['id'].toString(),
      firebaseUid: json['firebase_uid'] as String,
      name: json['name'] as String,
      ip: json['ip'] as String,
      port: json['port'] as int,
      platform: json['platform'] as String,
      lastStatus: json['last_status'] as String,
      notificationsEnabled: json['notifications_enabled'] as bool? ?? true,
      lastCheckedAt: json['last_checked_at'] != null
          ? DateTime.parse(json['last_checked_at'] as String)
          : null,
      createdAt: DateTime.parse(json['created_at'] as String),
      players:    json['players']     as int?,
      maxPlayers: json['max_players'] as int?,
      version:    json['version']     as String?,
      gameMode:   json['game_mode']   as String?,
    );
  }

  TrackedServer copyWith({
    String? name,
    String? ip,
    int? port,
    String? platform,
    String? lastStatus,
    bool? notificationsEnabled,
    DateTime? lastCheckedAt,
    int? players,
    int? maxPlayers,
    String? version,
    String? gameMode,
  }) {
    return TrackedServer(
      id: id,
      firebaseUid: firebaseUid,
      name: name ?? this.name,
      ip: ip ?? this.ip,
      port: port ?? this.port,
      platform: platform ?? this.platform,
      lastStatus: lastStatus ?? this.lastStatus,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      lastCheckedAt: lastCheckedAt ?? this.lastCheckedAt,
      createdAt: createdAt,
      players:    players    ?? this.players,
      maxPlayers: maxPlayers ?? this.maxPlayers,
      version:    version    ?? this.version,
      gameMode:   gameMode   ?? this.gameMode,
    );
  }
}
