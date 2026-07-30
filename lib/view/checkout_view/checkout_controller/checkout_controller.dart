import 'package:flutter/material.dart';
import 'package:focal_project/core/class/status_classes.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/services/payment_service.dart';
import 'package:focal_project/model/booking_flow_args.dart';
import 'package:focal_project/model/coupon_model.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/view/checkout_view/checkout_widgets/my_coupon_bottom_sheet.dart';
import 'package:focal_project/view/checkout_view/checkout_widgets/payment_method_modal.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  late BookingFlowArgs bookingArgs;

  final double adminFee = 2.50;
  final String roomType = 'Queen Room';
  final String phone = '0214345646';

  final RxList<CouponModel> coupons = <CouponModel>[].obs;
  final Rxn<CouponModel> appliedCoupon = Rxn<CouponModel>();
  final paymentIsLoading = false.obs;

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
    _initCoupons();
  }

  void _initCoupons() {
    coupons.assignAll([
      CouponModel(
        id: '1',
        title: '50% Cashback',
        discountPercentage: 50,
        couponType: 'Cashback',
        expiryDays: 2,
        isSelected: true,
      ),
      CouponModel(
        id: '2',
        title: '15% Discount',
        discountPercentage: 15,
        couponType: 'Discount',
        expiryDays: 1,
      ),
      CouponModel(
        id: '3',
        title: '10% Cashback',
        discountPercentage: 10,
        couponType: 'Cashback',
        expiryDays: 7,
      ),
    ]);
  }

  int get nightCount {
    final nights = bookingArgs.checkOutDate
        .difference(bookingArgs.checkInDate)
        .inDays;
    return nights > 0 ? nights : 0;
  }

  double get price => nightCount * bookingArgs.hotel.pricePerNight;

  double get discountAmount {
    if (appliedCoupon.value == null) return 0;
    return price * (appliedCoupon.value!.discountPercentage / 100);
  }

  double get totalPrice => price + adminFee - discountAmount;

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

  void selectCoupon(String id) {
    for (final coupon in coupons) {
      coupon.isSelected = coupon.id == id;
    }
    coupons.refresh();
  }

  void useCoupon() {
    appliedCoupon.value = coupons.firstWhere((coupon) => coupon.isSelected);
    Get.back();
  }

  void showCouponBottomSheet() {
    if (appliedCoupon.value != null) {
      selectCoupon(appliedCoupon.value!.id);
    }

    Get.bottomSheet(
      const MyCouponBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: AppColors.black87.withOpacity(0.4),
    );
  }

  void selectPayment() {
    Get.bottomSheet(
      PaymentMethodModal(onConformAndPay: onConformAndPay),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: AppColors.black87.withOpacity(0.4),
    );
  }

  void onConformAndPay() async {
    Get.back();
    paymentIsLoading.value = true;

    final res = await PaymentService.pay(amount: totalPrice);

    paymentIsLoading.value = false;

    if (res == StatusClasses.success) {
      Get.toNamed(Routes.paymentComplete);
    } else {
      Get.snackbar("Warning!", res.message ?? res.type);
    }
  }
}
