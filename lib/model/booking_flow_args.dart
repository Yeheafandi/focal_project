import 'package:focal_project/model/hotel_model.dart';

class BookingFlowArgs {
  final HotelModel hotel;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int guestCount;
  final String paymentMethodName;
  final String paymentMethodNumber;

  const BookingFlowArgs({
    required this.hotel,
    required this.checkInDate,
    required this.checkOutDate,
    required this.guestCount,
    this.paymentMethodName = 'FastPayz',
    this.paymentMethodNumber = '******6587',
  });

  BookingFlowArgs copyWith({
    HotelModel? hotel,
    DateTime? checkInDate,
    DateTime? checkOutDate,
    int? guestCount,
    String? paymentMethodName,
    String? paymentMethodNumber,
  }) {
    return BookingFlowArgs(
      hotel: hotel ?? this.hotel,
      checkInDate: checkInDate ?? this.checkInDate,
      checkOutDate: checkOutDate ?? this.checkOutDate,
      guestCount: guestCount ?? this.guestCount,
      paymentMethodName: paymentMethodName ?? this.paymentMethodName,
      paymentMethodNumber: paymentMethodNumber ?? this.paymentMethodNumber,
    );
  }
}
