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

  @override
  void onInit() {
    super.onInit();

    notifications.assignAll(_service.getNotifications());
  }

  void toggleFilter(String value) {
    if (selectedFilters.contains(value)) {
      selectedFilters.remove(value);
    } else {
      selectedFilters.add(value);
    }
  }

  void applyFilter() {
    final all = _service.getNotifications();

    if (selectedFilters.isEmpty) {
      notifications.assignAll(all);

      return;
    }

    notifications.assignAll(
      all.where((e) => selectedFilters.contains(e.category)),
    );
  }
}
