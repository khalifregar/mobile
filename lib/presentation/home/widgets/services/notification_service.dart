import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const android = AndroidInitializationSettings('notif_icon');
    const iOS = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: iOS);

    await _notifications.initialize(settings);
  }

  static Future<void> showNotification({
    int id = 0,
    String title = 'Notifikasi',
    String body = '',
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'propedia_channel_id',
      'Propedia Notifikasi',
      channelDescription: 'Channel untuk notifikasi properti',
      importance: Importance.max,
      priority: Priority.high,
      icon: 'notif_icon',
      playSound: false,
      enableVibration: true,
      styleInformation: BigTextStyleInformation(''),
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: false,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.show(id, title, body, notificationDetails);
  }
}
