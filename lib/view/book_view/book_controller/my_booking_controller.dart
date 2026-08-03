import 'package:focal_project/core/constants/app_images.dart';
import 'package:get/get.dart';
import 'package:focal_project/model/booking_details_model.dart';

class MyBookingController extends GetxController {
  final RxInt selectedTabIndex = 0.obs;
  final RxList<BookingDetailsModel> bookings = <BookingDetailsModel>[].obs;
  final RxList<BookingDetailsModel> filteredBookings =
      <BookingDetailsModel>[].obs;

  final List<BookingDetailsModel>? _initialBookings;

  MyBookingController({List<BookingDetailsModel>? initialBookings})
    : _initialBookings = initialBookings;

  @override
  void onInit() {
    super.onInit();
    refreshTranslations();
  }

  void refreshTranslations() {
    final sourceBookings = _initialBookings ?? _defaultBookings;
    bookings.assignAll(sourceBookings);
    filteredBookings.assignAll(bookings);
  }

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  void onSearchChanged(String value) {
    filteredBookings.value = bookings
        .where((b) => b.hotelName.toLowerCase().contains(value.toLowerCase()))
        .toList();
    filteredBookings.refresh();
  }

  static List<BookingDetailsModel> get _defaultBookings => [
    BookingDetailsModel(
      id: 1,
      hotelName: 'my_bookings.hotel_1_name'.tr,
      hotelImage: AppImages.onBoarding2,
      location: 'my_bookings.hotel_1_location'.tr,
      rating: 4.7,
      price: 120,
      checkIn: 'my_bookings.hotel_1_check_in'.tr,
      checkOut: 'my_bookings.hotel_1_check_out'.tr,
      guests: 2,
      rooms: 1,
      roomType: 'my_bookings.hotel_1_room_type'.tr,
      phone: 'my_bookings.hotel_1_phone'.tr,
      barcode: 'my_bookings.hotel_1_barcode'.tr,
      latitude: 0,
      longitude: 0,
    ),
    BookingDetailsModel(
      id: 2,
      hotelName: 'my_bookings.hotel_2_name'.tr,
      hotelImage: AppImages.onBoarding1,
      location: 'my_bookings.hotel_2_location'.tr,
      rating: 4.0,
      price: 230,
      checkIn: 'my_bookings.hotel_2_check_in'.tr,
      checkOut: 'my_bookings.hotel_2_check_out'.tr,
      guests: 1,
      rooms: 1,
      roomType: 'my_bookings.hotel_2_room_type'.tr,
      phone: 'my_bookings.hotel_2_phone'.tr,
      barcode: 'my_bookings.hotel_2_barcode'.tr,
      latitude: 0,
      longitude: 0,
    ),
    BookingDetailsModel(
      id: 3,
      hotelName: 'my_bookings.hotel_3_name'.tr,
      hotelImage: AppImages.onBoarding3,
      location: 'my_bookings.hotel_3_location'.tr,
      rating: 3.8,
      price: 190,
      checkIn: 'my_bookings.hotel_3_check_in'.tr,
      checkOut: 'my_bookings.hotel_3_check_out'.tr,
      guests: 2,
      rooms: 1,
      roomType: 'my_bookings.hotel_3_room_type'.tr,
      phone: 'my_bookings.hotel_3_phone'.tr,
      barcode: 'my_bookings.hotel_3_barcode'.tr,
      latitude: 0,
      longitude: 0,
    ),
  ];
}
