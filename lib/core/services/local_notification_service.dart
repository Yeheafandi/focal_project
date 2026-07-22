import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:get/get.dart';

class LocalNotificationService extends GetxService {
  static void _handleNotificationTap(NotificationResponse details) {
    Get.toNamed(Routes.notificationScreen);
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  InitializationSettings settings = InitializationSettings(
    android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    iOS: DarwinInitializationSettings(),
  );
  Future<LocalNotificationService> init() async {
    await flutterLocalNotificationsPlugin.initialize(
      settings: settings,
      onDidReceiveBackgroundNotificationResponse: _handleNotificationTap,
      onDidReceiveNotificationResponse: _handleNotificationTap,
    );
    return this;
  }

  Future<void> showNotification(RemoteMessage message) async {
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'Notification',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
    await flutterLocalNotificationsPlugin.show(
      id: 0,
      title: message.notification?.title,
      body: message.notification?.body,
      notificationDetails: notificationDetails,
    );
  }
}
