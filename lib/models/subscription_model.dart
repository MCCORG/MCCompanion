class TrackerSlotInfo {
  final int total;
  final int used;
  final int remaining;

  const TrackerSlotInfo({
    required this.total,
    required this.used,
    required this.remaining,
  });

  factory TrackerSlotInfo.fromJson(Map<String, dynamic> json) => TrackerSlotInfo(
        total: json['total'] as int? ?? 1,
        used: json['used'] as int? ?? 0,
        remaining: json['remaining'] as int? ?? 1,
      );
}

class SubscriptionStatus {
  final bool active;
  final String? productId;
  final String? entitlement;
  final DateTime? expiresAt;
  final TrackerSlotInfo trackerSlots;

  const SubscriptionStatus({
    required this.active,
    required this.trackerSlots,
    this.productId,
    this.entitlement,
    this.expiresAt,
  });

  factory SubscriptionStatus.fromJson(Map<String, dynamic> json) => SubscriptionStatus(
        active: json['active'] as bool? ?? false,
        productId: json['productId'] as String?,
        entitlement: json['entitlement'] as String?,
        expiresAt: json['expiresAt'] != null
            ? DateTime.tryParse(json['expiresAt'] as String)
            : null,
        trackerSlots: TrackerSlotInfo.fromJson(
          json['trackerSlots'] as Map<String, dynamic>? ?? {},
        ),
      );

  static SubscriptionStatus get free => SubscriptionStatus(
        active: false,
        trackerSlots: const TrackerSlotInfo(total: 1, used: 0, remaining: 1),
      );
}
