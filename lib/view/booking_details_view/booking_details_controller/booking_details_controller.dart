import 'package:focal_project/core/services/booking_details_services.dart';
import 'package:focal_project/model/booking_details_model.dart';
import 'package:get/get.dart';

class BookingDetailsController extends GetxController {
  BookingDetailsController({
    required this.bookingId,
    required BookingDetailsService service,
  }) : _service = service;

  final int bookingId;

  final BookingDetailsService _service;

  late BookingDetailsModel booking;

  @override
  void onInit() {
    super.onInit();
    booking = _service.getBooking(bookingId);
  }
}
