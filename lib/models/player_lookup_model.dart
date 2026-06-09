class JavaProfile {
  final String username;
  final String uuid;
  final String? skinUrl;
  final String? headUrl;

  const JavaProfile({
    required this.username,
    required this.uuid,
    this.skinUrl,
    this.headUrl,
  });

  factory JavaProfile.fromJson(Map<String, dynamic> json) => JavaProfile(
        username: json['username'] as String,
        uuid: json['uuid'] as String,
        skinUrl: json['skinUrl'] as String?,
        headUrl: json['headUrl'] as String?,
      );
}

class CombinedProfile {
  final JavaProfile? java;
  final BedrockProfile? bedrock;
  final bool linked;

  const CombinedProfile({this.java, this.bedrock, this.linked = false});

  factory CombinedProfile.fromJson(Map<String, dynamic> json) => CombinedProfile(
        java: json['java'] != null
            ? JavaProfile.fromJson(json['java'] as Map<String, dynamic>)
            : null,
        bedrock: json['bedrock'] != null
            ? BedrockProfile.fromJson(json['bedrock'] as Map<String, dynamic>)
            : null,
        linked: json['linked'] as bool? ?? false,
      );
}

class BedrockProfile {
  final String? gamertag;
  final String xuid;
  final String? skinUrl;
  final int? gamerscore;
  final String? tier;
  final String? gamerpicUrl;

  const BedrockProfile({
    this.gamertag,
    required this.xuid,
    this.skinUrl,
    this.gamerscore,
    this.tier,
    this.gamerpicUrl,
  });

  factory BedrockProfile.fromJson(Map<String, dynamic> json) => BedrockProfile(
        gamertag: json['gamertag'] as String?,
        xuid: json['xuid'] as String,
        skinUrl: json['skinUrl'] as String?,
        gamerscore: json['gamerscore'] as int?,
        tier: json['tier'] as String?,
        gamerpicUrl: json['gamerpicUrl'] as String?,
      );

  String get floodgateUuid {
    final xuidInt = BigInt.tryParse(xuid);
    if (xuidInt == null) return '';
    final hex = xuidInt.toRadixString(16).padLeft(16, '0').padLeft(32, '0');
    return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-'
        '${hex.substring(12, 16)}-${hex.substring(16, 20)}-${hex.substring(20)}';
  }

  String get displayName => gamertag ?? xuid;
}
