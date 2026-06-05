class BotModel {
  final String gamertag;
  final int? friendCount;
  final int maxFriends;
  final String region; 

  const BotModel({
    required this.gamertag,
    required this.friendCount,
    required this.maxFriends,
    required this.region,
  });

  factory BotModel.fromJson(Map<String, dynamic> json, String region) {
    return BotModel(
      gamertag: json['gamertag'] as String,
      friendCount: json['friendCount'] as int?,
      maxFriends: (json['maxFriends'] as int?) ?? 2000,
      region: region,
    );
  }

  bool get isOnline => friendCount != null;
  bool get isFull => friendCount != null && friendCount! >= maxFriends;
  double get capacityFraction =>
      friendCount == null ? 0 : friendCount! / maxFriends;
}
