import 'package:get/get.dart';

class RequestToBookController extends GetxController {
  final Rx<DateTime> checkInDate = DateTime(2024, 11, 12).obs;
  final Rx<DateTime> checkOutDate = DateTime(2024, 11, 14).obs;
  final RxInt guestCount = 1.obs;

  final double pricePerNight = 200;
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

  int get nightCount {
    final nights = checkOutDate.value.difference(checkInDate.value).inDays;
    return nights > 0 ? nights : 0;
  }

  double get nightsTotal => nightCount * pricePerNight;

  double get totalPayment => nightsTotal + cleaningFee + serviceFee;

  String formatDate(DateTime date) {
    return '${_months[date.month - 1]} ${date.day}, ${date.year}';
  }

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
    
  }
}
