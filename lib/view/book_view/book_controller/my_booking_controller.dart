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
    bookings.assignAll(_initialBookings ?? _defaultBookings);
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

  static final List<BookingDetailsModel> _defaultBookings = [
    BookingDetailsModel(
      id: 1,
      hotelName: 'The Aston Vill Hotel',
      hotelImage: 'assets/images/first.jpg',
      location: 'Veum Point, Michikoton',
      rating: 4.7,
      price: 120,
      checkIn: '12 Nov 2024',
      checkOut: '14 Nov 2024',
      guests: 2,
      rooms: 1,
      roomType: 'Deluxe Room',
      phone: '+1 234 567 890',
      barcode: 'ABC12345',
      latitude: 0,
      longitude: 0,
    ),
    BookingDetailsModel(
      id: 2,
      hotelName: 'Mystic Palms',
      hotelImage: 'assets/images/second.jpg',
      location: 'Palm Springs, CA',
      rating: 4.0,
      price: 230,
      checkIn: '20 Nov 2024',
      checkOut: '25 Nov 2024',
      guests: 1,
      rooms: 1,
      roomType: 'Standard Room',
      phone: '+1 987 654 321',
      barcode: 'XYZ98765',
      latitude: 0,
      longitude: 0,
    ),
    BookingDetailsModel(
      id: 3,
      hotelName: 'Elysian Suites',
      hotelImage: 'assets/images/third.jpg',
      location: 'San Diego, CA',
      rating: 3.8,
      price: 190,
      checkIn: '01 Dec 2024',
      checkOut: '05 Dec 2024',
      guests: 2,
      rooms: 1,
      roomType: 'Suite Room',
      phone: '+1 555 123 456',
      barcode: 'ELYS1234',
      latitude: 0,
      longitude: 0,
    ),
  ];
}
