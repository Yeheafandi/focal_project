import 'package:focal_project/core/services/booking_details_services.dart';
import 'package:focal_project/view/booking_details_view/booking_details_controller.dart';
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
  }
}