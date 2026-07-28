import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/services/local_notification_service.dart';
import 'package:focal_project/model/notification_model.dart';
import 'package:focal_project/view/notification_view/notification_controller/notification_controller.dart';
import 'package:get/get.dart';

class NotificationFirebaseService extends GetxService {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? fcmToken;
  Future<NotificationFirebaseService> init() async {
    await messaging.requestPermission();
    fcmToken = await messaging.getToken();
    log(fcmToken ?? 'null');
    FirebaseMessaging.onBackgroundMessage(handlerBackgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        Get.find<LocalNotificationService>().showNotification(message);
        final controller = Get.find<NotificationController>();

        controller.addNotification(
          NotificationModel(
            id: DateTime.now().millisecondsSinceEpoch,
            assetIcon: AppIcons.paymentIcon,
            title: message.notification!.title ?? "",
            time: "Now",
            category: "New Notification",
            section: "Today",
          ),
        );
      }
    });
    return this;
  }

  static Future<void> handlerBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'No title');
  }
}
