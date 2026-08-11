class ModerationStatus {
  const ModerationStatus({
    required this.isBan,
    this.reason,
    this.message,
    this.until,
    this.since,
  });

  final bool isBan;

  final String? reason;

  final String? message;

  final DateTime? until;

  final DateTime? since;

  static ModerationStatus? fromJson(Object? json) {
    if (json is! Map) return null;

    final error = json['error'];
    if (error != 'account_banned' && error != 'chat_restricted') return null;

    return ModerationStatus(
      isBan: error == 'account_banned',
      reason: json['reason'] as String?,
      message: json['message'] as String?,
      until: DateTime.tryParse('${json['until'] ?? ''}'),
      since: DateTime.tryParse('${json['since'] ?? ''}'),
    );
  }

  bool get isActive {
    if (isBan) return true;
    final ends = until;
    return ends == null || ends.isAfter(DateTime.now());
  }
}
