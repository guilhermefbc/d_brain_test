import 'dart:isolate';
import 'dart:ui';

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
        }
        // selectNotificationSubject.add(payload);
      },
      // backgroundHandler: notificationTapBackground,
    );
  }

  // static void notificationTapBackground(NotificationActionDetails details) {
  //   print('notification(${details.id}) action tapped: ${details.actionId} with payload: ${details.payload}');
  //   if (details.input?.isNotEmpty ?? false) {
  //     // ignore: avoid_print
  //     print('notification action tapped with input: ${details.input}');
  //   }
  //
  //   final SendPort? send = IsolateNameServer.lookupPortByName(_portName);
  //   send?.send(details);
  // }

  static Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('dBrainTest255', 'dBrainTest',
        channelDescription: 'Notification to pending vouchers',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
        1,
        'Vouches pending',
        'There are tasks waiting to be uploaded',
        platformChannelSpecifics,
        payload: 'item x'
    );
  }
}

// class NotificationActionDetails {
//   /// Constructs an instance of [NotificationActionDetails]
//   NotificationActionDetails({
//     required this.id,
//     required this.actionId,
//     required this.input,
//     required this.payload,
//   });
//
//   /// The notification's id.
//   final int id;
//
//   /// The id of the action that was triggered.
//   final String actionId;
//
//   /// The value of the input field if the notification action had an input field.
//   final String? input;
//
//   /// The notification's payload
//   final String? payload;
// }