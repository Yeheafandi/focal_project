import 'package:focal_project/core/services/booking_details_services.dart';
import 'package:focal_project/model/booking_details_model.dart';
import 'package:get/get.dart';

class BookingDetailsController extends GetxController {
  final int bookingId = 1;

  final BookingDetailsService _service = BookingDetailsService();

  late BookingDetailsModel booking;

  @override
  void onInit() {
    super.onInit();
    _initBooking();
  }

  void _initBooking() {
    final args = Get.arguments;

    if (args is BookingDetailsModel) {
      booking = args;
    } else {
      booking = _service.getBooking(bookingId);
    }
  }
}
