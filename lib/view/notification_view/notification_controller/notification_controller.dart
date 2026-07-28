import 'package:get/get.dart';
import 'package:focal_project/model/notification_model.dart';
import 'package:focal_project/core/services/notification_service.dart';

class NotificationController extends GetxController {
  NotificationController({required NotificationService service})
    : _service = service;

  final NotificationService _service;

  final notifications = <NotificationModel>[].obs;

  final selectedFilters = <String>{}.obs;
  final List<String> filters = [
    "New Notification",
    "By Chat",
    "Longest",
    "Discounts",
  ];
  final allNotifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    allNotifications.assignAll(_service.getNotifications());
    notifications.assignAll(allNotifications);
  }

  void addNotification(NotificationModel notification) {
    allNotifications.insert(0, notification);
    notifications.insert(0, notification);
  }

  void toggleFilter(String value) {
    if (selectedFilters.contains(value)) {
      selectedFilters.remove(value);
    } else {
      selectedFilters.add(value);
    }
  }

  void applyFilter() {
    if (selectedFilters.isEmpty) {
      notifications.assignAll(allNotifications);
      return;
    }

    notifications.assignAll(
      allNotifications.where((e) => selectedFilters.contains(e.category)),
    );
  }
}
