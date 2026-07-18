import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/checkout_view/checkout_controller/checkout_controller.dart';
import 'package:focal_project/view/checkout_view/checkout_widgets/checkout_booking_row.dart';
import 'package:focal_project/view/checkout_view/checkout_widgets/checkout_dashed_divider.dart';
import 'package:focal_project/view/checkout_view/checkout_widgets/checkout_price_row.dart';
import 'package:get/get.dart';

class CheckoutInfoCard extends StatelessWidget {
  final CheckoutController controller;

  const CheckoutInfoCard({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpaces.paddingNormal),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
        border: Border.all(color: AppColors.grey300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Booking',
            style: MyTextStyle.normalTitleText(
              color: AppColors.primary,
              size: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpaces.heightMedium),
          CheckoutBookingRow(
            icon: Icons.calendar_today_outlined,
            label: 'Dates',
            value: controller.datesRange,
          ),
          CheckoutBookingRow(
            icon: Icons.person_outline,
            label: 'Guest',
            value: controller.guestLabel,
          ),
          CheckoutBookingRow(
            icon: Icons.description_outlined,
            label: 'Room type',
            value: controller.roomType,
          ),
          CheckoutBookingRow(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: controller.phone,
          ),
          const CheckoutDashedDivider(),
          const SizedBox(height: AppSpaces.heightMedium),
          Text(
            'Price Details',
            style: MyTextStyle.normalTitleText(
              color: AppColors.primary,
              size: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpaces.heightMedium),
          Obx(
            () => Column(
              children: [
                CheckoutPriceRow(
                  label: 'Price',
                  value: controller.formatPrice(controller.price),
                ),
                CheckoutPriceRow(
                  label: 'Admin fee',
                  value: controller.formatPrice(controller.adminFee),
                ),
                if (controller.appliedCoupon.value != null)
                  CheckoutPriceRow(
                    label: controller.appliedCoupon.value!.title,
                    value: '-${controller.formatPrice(controller.discountAmount)}',
                  ),
                CheckoutPriceRow(
                  label: 'Total price',
                  value: controller.formatPrice(controller.totalPrice),
                  isTotal: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
