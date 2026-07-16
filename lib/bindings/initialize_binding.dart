import 'package:focal_project/core/services/message_service.dart';
import 'package:focal_project/view/booking_details_view/booking_details_controller/booking_details_controller.dart';
import 'package:focal_project/view/messages_view/messages_controller/messages_controller.dart';

import 'package:focal_project/core/services/booking_details_services.dart';
import 'package:get/get.dart';

class InitializeBinding extends Bindings {
  @override
  void dependencies() {
   // Get.put(Crud());
   Get.lazyPut<BookingDetailsService>(
      () => BookingDetailsService(),
    );

    Get.lazyPut<BookingDetailsController>(
      () => BookingDetailsController(
        bookingId: 1,
        service: Get.find(),
      ),
    );
    Get.lazyPut<MessageService>(
      () => MessageService(),
    );

    Get.lazyPut<MessageController>(
      () => MessageController(
        service: Get.find(),
      ),
    );
  }
}
