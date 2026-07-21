import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:focal_project/core/services/local_notification_service.dart';
import 'package:get/get.dart';

class NotificationFirebaseService extends GetxService {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<NotificationFirebaseService> init() async {
    await messaging.requestPermission();
    String? fcmToken = await messaging.getToken();
    log(fcmToken ?? 'null');
    FirebaseMessaging.onBackgroundMessage(handlerBackgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        Get.find<LocalNotificationService>().showNotification(message);
      }
    });
    return this;
  }

  static Future<void> handlerBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'No title');
  }
}
