import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'user_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
}

class PushNotificationService {
  PushNotificationService._();

  static FirebaseMessaging get _fcm => FirebaseMessaging.instance;

  static Future<void> init({
    void Function(RemoteMessage message)? onNotificationTap,
  }) async {
    if (Platform.isWindows) return;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (Platform.isAndroid) {
      await _fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    await _registerToken();

    _fcm.onTokenRefresh.listen((newToken) {
      UserService.registerFcmToken(newToken);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      onNotificationTap?.call(message);
    });

    final initial = await _fcm.getInitialMessage();
    if (initial != null) {
      onNotificationTap?.call(initial);
    }
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
  String get notificationType =>
      data['type'] as String? ?? 'unknown';

  String? get senderUsername => data['senderUsername'] as String?;
  String? get friendUsername => data['friendUsername'] as String?;
  String? get serverAddress => data['serverAddress'] as String?;
}
