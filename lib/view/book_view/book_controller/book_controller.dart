import 'package:focal_project/model/booking_flow_args.dart';
import 'package:focal_project/model/hotel_model.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:get/get.dart';

class RequestToBookController extends GetxController {
  final Rx<DateTime> checkInDate = DateTime(2024, 11, 12).obs;
  final Rx<DateTime> checkOutDate = DateTime(2024, 11, 14).obs;
  final RxInt guestCount = 1.obs;
  late HotelModel hotel;

  final double cleaningFee = 5;
  final double serviceFee = 5;

  final RxString paymentMethodName = 'FastPayz'.obs;
  final RxString paymentMethodNumber = '******6587'.obs;

  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  void onInit() {
    super.onInit();
    _initFromArguments();
  }

  void _initFromArguments() {
    final args = Get.arguments;

    if (args is BookingFlowArgs) {
      hotel = args.hotel;
      checkInDate.value = args.checkInDate;
      checkOutDate.value = args.checkOutDate;
      guestCount.value = args.guestCount;
      paymentMethodName.value = args.paymentMethodName;
      paymentMethodNumber.value = args.paymentMethodNumber;
    } else if (args is HotelModel) {
      hotel = args;
    } else {
      hotel = _defaultHotel;
    }
  }

  static final HotelModel _defaultHotel = HotelModel(
    id: '1',
    name: 'The Aston Vill Hotel',
    location: 'Veum Point, Michikoton',
    pricePerNight: 120,
    rating: 4.7,
    imageUrl:
        'https://images.unsplash.com/photo-1540555700478-4be289fbecef',
  );

  double get pricePerNight => hotel.pricePerNight;

  int get nightCount {
    final nights = checkOutDate.value.difference(checkInDate.value).inDays;
    return nights > 0 ? nights : 0;
  }

  double get nightsTotal => nightCount * pricePerNight;

  double get totalPayment => nightsTotal + cleaningFee + serviceFee;

  String formatDate(DateTime date) {
    return '${_months[date.month - 1]} ${date.day}, ${date.year}';
  }

  BookingFlowArgs get bookingArgs => BookingFlowArgs(
        hotel: hotel,
        checkInDate: checkInDate.value,
        checkOutDate: checkOutDate.value,
        guestCount: guestCount.value,
        paymentMethodName: paymentMethodName.value,
        paymentMethodNumber: paymentMethodNumber.value,
      );

  void incrementGuest() {
    guestCount.value++;
  }

  void decrementGuest() {
    if (guestCount.value > 1) {
      guestCount.value--;
    }
  }

  void setCheckInDate(DateTime date) {
    checkInDate.value = date;
    if (!checkOutDate.value.isAfter(date)) {
      checkOutDate.value = date.add(const Duration(days: 1));
    }
  }

  void setCheckOutDate(DateTime date) {
    if (date.isAfter(checkInDate.value)) {
      checkOutDate.value = date;
    }
  }

  void checkout() {
    Get.toNamed(
      Routes.checkout,
      arguments: bookingArgs,
    );
  }
}
