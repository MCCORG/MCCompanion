import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'user_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
}

class PushNotificationService {
  PushNotificationService._();

  static FirebaseMessaging get _fcm => FirebaseMessaging.instance;

  static bool _initialized = false;
  static StreamSubscription<String>? _tokenRefreshSub;
  static StreamSubscription<RemoteMessage>? _messageOpenedSub;
  static StreamSubscription<RemoteMessage>? _foregroundSub;

  static final _localNotifications = FlutterLocalNotificationsPlugin();
  static const _androidChannel = AndroidNotificationChannel(
    'mccompanion_default',
    'MCCompanion',
    description: 'General MCCompanion notifications',
    importance: Importance.high,
  );

  static Future<void> init({
    void Function(RemoteMessage message)? onNotificationTap,
  }) async {
    if (Platform.isWindows) return;
    if (_initialized) return;
    _initialized = true;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    try {
      final settings = await _fcm.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      debugPrint('[FCM] Permission status: ${settings.authorizationStatus}');
    } catch (e) {
      debugPrint('[FCM] requestPermission error: $e');
    }

    if (Platform.isIOS) {
      await _fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    if (Platform.isAndroid) {
      await _localNotifications.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('@drawable/ic_notification'),
        ),
        onDidReceiveNotificationResponse: (details) {
        },
      );

      await _localNotifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(_androidChannel);

      _foregroundSub = FirebaseMessaging.onMessage.listen((message) {
        final notification = message.notification;
        final android = message.notification?.android;
        if (notification != null && android != null) {
          _localNotifications.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                _androidChannel.id,
                _androidChannel.name,
                channelDescription: _androidChannel.description,
                importance: Importance.high,
                priority: Priority.high,
                icon: '@drawable/ic_notification',
              ),
            ),
            payload: message.data['type'],
          );
        }
      });
    }

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
    await _foregroundSub?.cancel();
    _tokenRefreshSub = null;
    _messageOpenedSub = null;
    _foregroundSub = null;
    _initialized = false;
  }

  static Future<void> _registerToken() async {
    try {
      if (Platform.isIOS) {
        String? apns;
        for (int i = 0; i < 10; i++) {
          apns = await _fcm.getAPNSToken();
          if (apns != null) break;
          await Future.delayed(const Duration(seconds: 1));
        }
        if (apns == null) {
          return;
        }
      }

      final token = await _fcm.getToken();
      if (token != null) {
        await UserService.registerFcmToken(token);
      }
    } catch (e) {
      debugPrint('[FCM] registerToken error: $e');
    }
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
