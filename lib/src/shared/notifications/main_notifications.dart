import 'package:d_brain_test/src/shared/sharedPreferences/my_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MainNotifications {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static const String _portName = 'notification_send_port';


  static initNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        if (payload != null) {
          debugPrint('notification payload: $payload');
          MySharedPreferences.restartSharedId();
        }
        // selectNotificationSubject.add(payload);
      },
      // backgroundHandler: notificationTapBackground,
    );
  }

  static Future<void> showNotification() async {
    int counter = await MySharedPreferences.getSharedId();

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('dBrainTest255', 'dBrainTest',
        channelDescription: 'Notification to pending vouchers',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
        counter,
        'Vouches pending',
        'You need to upload the latest scanned documents',
        platformChannelSpecifics,
        payload: 'item x'
    );
  }
}
