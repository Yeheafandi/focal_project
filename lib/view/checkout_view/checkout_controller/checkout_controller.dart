import 'package:focal_project/model/booking_flow_args.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  late BookingFlowArgs bookingArgs;

  final double adminFee = 2.50;
  final String roomType = 'Queen Room';
  final String phone = '0214345646';

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
    bookingArgs = Get.arguments as BookingFlowArgs;
  }

  int get nightCount {
    final nights = bookingArgs.checkOutDate
        .difference(bookingArgs.checkInDate)
        .inDays;
    return nights > 0 ? nights : 0;
  }

  double get price => nightCount * bookingArgs.hotel.pricePerNight;

  double get totalPrice => price + adminFee;

  String get datesRange {
    final checkIn = bookingArgs.checkInDate;
    final checkOut = bookingArgs.checkOutDate;
    final month = _months[checkIn.month - 1];

    if (checkIn.month == checkOut.month && checkIn.year == checkOut.year) {
      return '${checkIn.day} - ${checkOut.day} $month ${checkIn.year}';
    }

    final checkOutMonth = _months[checkOut.month - 1];
    return '${checkIn.day} $month - ${checkOut.day} $checkOutMonth ${checkOut.year}';
  }

  String get guestLabel =>
      '${bookingArgs.guestCount} Guest${bookingArgs.guestCount > 1 ? 's' : ''} (1 Room)';

  String formatPrice(double amount) => '\$${amount.toStringAsFixed(2)}';

  void selectPayment() {
    //لسا ما عملت هي
  }
}
