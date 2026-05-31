import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'user_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

class PushNotificationService {
  PushNotificationService._();

  static FirebaseMessaging get _fcm => FirebaseMessaging.instance;

  static bool _initialized = false;
  static StreamSubscription<String>? _tokenRefreshSub;
  static StreamSubscription<RemoteMessage>? _messageOpenedSub;

  static Future<void> init({
    void Function(RemoteMessage message)? onNotificationTap,
  }) async {
    if (Platform.isWindows) return;
    if (_initialized) return;
    _initialized = true;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    try {
      await _fcm.requestPermission(alert: true, badge: true, sound: true);
    } catch (_) {
    }

    if (Platform.isIOS) {
      await _fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    await _registerToken();

    _tokenRefreshSub = _fcm.onTokenRefresh.listen((newToken) {
      UserService.registerFcmToken(newToken);
    });

    _messageOpenedSub = FirebaseMessaging.onMessageOpenedApp.listen((message) {
      onNotificationTap?.call(message);
    });

    final initial = await _fcm.getInitialMessage();
    if (initial != null) {
      onNotificationTap?.call(initial);
    }
  }

  static Future<void> dispose() async {
    await _tokenRefreshSub?.cancel();
    await _messageOpenedSub?.cancel();
    _tokenRefreshSub = null;
    _messageOpenedSub = null;
    _initialized = false;
  }

  static Future<void> _registerToken() async {
    try {
      final token = await _fcm.getToken();
      if (token != null) {
        await UserService.registerFcmToken(token);
      }
    } catch (_) {}
  }

  static Future<void> onUserSignedIn() async {
    if (Platform.isWindows) return;
    await _registerToken();
  }

  static String getNotificationType(RemoteMessage message) {
    return message.data['type'] as String? ?? 'unknown';
  }

  static String? getSenderUsername(RemoteMessage message) {
    return message.data['senderUsername'] as String?;
  }
}

extension RemoteMessageX on RemoteMessage {
  String get notificationType => data['type'] as String? ?? 'unknown';

  String? get senderUsername => data['senderUsername'] as String?;
  String? get friendUsername => data['friendUsername'] as String?;
  String? get serverAddress => data['serverAddress'] as String?;
}
