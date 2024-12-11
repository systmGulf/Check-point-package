import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();
  static ontap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  static Future init() async {
    InitializationSettings initializationSettings =
        const InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'),
            iOS: DarwinInitializationSettings());
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: ontap,
        onDidReceiveBackgroundNotificationResponse: ontap);
  }

  static showbasicNotification(
      {required String massBody, required String title}) async {
    NotificationDetails notificationDetails = const NotificationDetails(
      iOS: DarwinNotificationDetails(),
      android: AndroidNotificationDetails('channel_id', 'channel_name',
          priority: Priority.high, importance: Importance.max),
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      massBody,
      notificationDetails,
    );
  }

  static showReapetedNotification() async {
    NotificationDetails notificationDetails = const NotificationDetails(
      iOS: DarwinNotificationDetails(),
      android: AndroidNotificationDetails('channel_id', 'channel_name',
          priority: Priority.high, importance: Importance.max),
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
        1, '', "", RepeatInterval.hourly, notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }

  static void delectNotification(int id) {
    flutterLocalNotificationsPlugin.cancel(id);
  }
}
