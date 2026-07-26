import 'package:focal_project/core/services/my_services.dart';
import 'package:focal_project/core/services/notification_service.dart';
import 'package:focal_project/view/booking_details_view/booking_details_controller/booking_details_controller.dart';
import 'package:focal_project/view/notification_view/notification_controller/notification_controller.dart';
import 'package:focal_project/view/search_section/search_view/search_filter_controller/search_filter_controller.dart';
import 'package:focal_project/view/auth/auth_controller/auth_controller.dart';
import 'package:focal_project/core/services/booking_details_services.dart';
import 'package:focal_project/core/services/message_service.dart';
import 'package:focal_project/view/messages_view/messages_controller/messages_controller.dart';
import 'package:focal_project/core/services/chat_details_service.dart';
import 'package:get/get.dart';

class InitializeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(Crud());
    Get.lazyPut<SearchFilterController>(() => SearchFilterController());

    // Get.put(Crud());

    Get.lazyPut<BookingDetailsService>(() => BookingDetailsService());

    Get.lazyPut<BookingDetailsController>(
      () => BookingDetailsController(bookingId: 1, service: Get.find()),
    );
    Get.lazyPut<MessageService>(() => MessageService());

    Get.lazyPut<MessageController>(
      () => MessageController(service: Get.find()),
    );
    // Get.put(Crud());
    Get.lazyPut<ChatDetailsService>(() => ChatDetailsService());
    Get.lazyPut<NotificationService>(() => NotificationService());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<NotificationController>(
      () => NotificationController(service: Get.find()),
    );
  }
}
