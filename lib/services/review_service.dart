import 'dart:io';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Tracks positive usage events and requests an in-app review at the right
/// moment — after enough successful connections, and not more than once per
/// 60 days.
class ReviewService {
  ReviewService._();
  static final ReviewService instance = ReviewService._();

  static const _keyConnections = 'review_connection_count';
  static const _keyLastRequested = 'review_last_requested_ms';
  static const _threshold = 3; // connections before first prompt
  static const _cooldownDays = 60; // don't ask again within 60 days

  /// Call this every time the user successfully starts a relay broadcast.
  Future<void> onSuccessfulConnection() async {
    // Desktop platforms don't support in-app review
    if (!Platform.isIOS && !Platform.isAndroid) return;

    final prefs = await SharedPreferences.getInstance();

    // Respect cooldown
    final lastMs = prefs.getInt(_keyLastRequested) ?? 0;
    final daysSinceLast =
        DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(lastMs)).inDays;
    if (lastMs > 0 && daysSinceLast < _cooldownDays) return;

    // Increment counter
    final count = (prefs.getInt(_keyConnections) ?? 0) + 1;
    await prefs.setInt(_keyConnections, count);

    // Only prompt after reaching the threshold
    if (count < _threshold) return;

    final inAppReview = InAppReview.instance;
    if (!await inAppReview.isAvailable()) return;

    await inAppReview.requestReview();

    // Record when we last asked (reset counter so next cycle = another 3 connections)
    await prefs.setInt(_keyLastRequested, DateTime.now().millisecondsSinceEpoch);
    await prefs.setInt(_keyConnections, 0);
  }
}
