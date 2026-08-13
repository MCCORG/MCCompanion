import 'displayable_name.dart';

class JavaAccount {
  final String javaUsername;
  final String javaUuid;

  const JavaAccount({required this.javaUsername, required this.javaUuid});

  factory JavaAccount.fromJson(Map<String, dynamic> json) => JavaAccount(
    javaUsername: json['javaUsername'] as String,
    javaUuid: json['javaUuid'] as String,
  );
}

class BedrockAccount {
  final String? xboxGamertag;
  final String xboxXuid;

  const BedrockAccount({this.xboxGamertag, required this.xboxXuid});

  factory BedrockAccount.fromJson(Map<String, dynamic> json) => BedrockAccount(
    xboxGamertag: json['xboxGamertag'] as String?,
    xboxXuid: json['xboxXuid'] as String,
  );
}

class UserModel with DisplayableName {
  @override
  final String username;
  @override
  final String? displayName;
  final String? avatarUrl;
  final String? bio;
  final String? createdAt;
  final String? lastSeenAt;
  final bool appearOffline;
  final bool shareServer;
  final String? xboxGamertag;
  final String? xboxXuid;
  final String? javaUsername;
  final String? javaUuid;
  final List<JavaAccount> javaAccounts;
  final List<BedrockAccount> bedrockAccounts;

  const UserModel({
    required this.username,
    this.displayName,
    this.avatarUrl,
    this.bio,
    this.createdAt,
    this.lastSeenAt,
    this.appearOffline = false,
    this.shareServer = false,
    this.xboxGamertag,
    this.xboxXuid,
    this.javaUsername,
    this.javaUuid,
    this.javaAccounts = const [],
    this.bedrockAccounts = const [],
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final javaList = (json['javaAccounts'] as List<dynamic>? ?? [])
        .map((e) => JavaAccount.fromJson(e as Map<String, dynamic>))
        .toList();
    final bedrockList = (json['bedrockAccounts'] as List<dynamic>? ?? [])
        .map((e) => BedrockAccount.fromJson(e as Map<String, dynamic>))
        .toList();
    return UserModel(
      username: json['username'] as String,
      displayName: json['displayName'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      bio: json['bio'] as String?,
      createdAt: json['createdAt'] as String?,
      lastSeenAt: json['lastSeenAt'] as String?,
      appearOffline: json['appearOffline'] as bool? ?? false,
      shareServer: json['shareServer'] as bool? ?? false,
      xboxGamertag: json['xboxGamertag'] as String?,
      xboxXuid: json['xboxXuid'] as String?,
      javaUsername: json['javaUsername'] as String?,
      javaUuid: json['javaUuid'] as String?,
      javaAccounts: javaList,
      bedrockAccounts: bedrockList,
    );
  }
}

class FriendSession {
  final String serverIp;
  final int serverPort;
  final String? startedAt;

  const FriendSession({
    required this.serverIp,
    required this.serverPort,
    this.startedAt,
  });

  factory FriendSession.fromJson(Map<String, dynamic> json) => FriendSession(
    serverIp: json['serverIp'] as String,
    serverPort: json['serverPort'] as int,
    startedAt: json['startedAt'] as String?,
  );
}

class FriendModel with DisplayableName {
  final String firebaseUid;
  @override
  final String username;
  @override
  final String? displayName;
  final String? avatarUrl;
  final bool online;
  final FriendSession? session;
  final String? lastSeenAt;
  final bool isAdmin;

  const FriendModel({
    required this.firebaseUid,
    required this.username,
    this.displayName,
    this.avatarUrl,
    required this.online,
    this.session,
    this.lastSeenAt,
    this.isAdmin = false,
  });

  factory FriendModel.fromJson(Map<String, dynamic> json) => FriendModel(
    firebaseUid: json['firebaseUid'] as String? ?? '',
    username: json['username'] as String,
    displayName: json['displayName'] as String?,
    avatarUrl: json['avatarUrl'] as String?,
    online: json['online'] as bool? ?? false,
    session: json['session'] != null
        ? FriendSession.fromJson(json['session'] as Map<String, dynamic>)
        : null,
    lastSeenAt: json['lastSeenAt'] as String?,
  );
}

class FriendRequest {
  final int id;
  final String requesterUsername;
  final String? requesterDisplayName;
  final String? requesterAvatarUrl;
  final String? createdAt;

  const FriendRequest({
    required this.id,
    required this.requesterUsername,
    this.requesterDisplayName,
    this.requesterAvatarUrl,
    this.createdAt,
  });

  factory FriendRequest.fromJson(Map<String, dynamic> json) {
    final requester = json['requester'] as Map<String, dynamic>;
    return FriendRequest(
      id: json['id'] as int,
      requesterUsername: requester['username'] as String,
      requesterDisplayName: requester['displayName'] as String?,
      requesterAvatarUrl: requester['avatarUrl'] as String?,
      createdAt: json['createdAt'] as String?,
    );
  }

  String get displayLabel => requesterDisplayName?.isNotEmpty == true
      ? requesterDisplayName!
      : requesterUsername;

  String get initials {
    final label = displayLabel;
    final parts = label.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return label.substring(0, label.length.clamp(0, 2)).toUpperCase();
  }
}
