import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/checkout_view/checkout_controller/checkout_controller.dart';
import 'package:focal_project/view/checkout_view/checkout_widgets/checkout_booking_row.dart';
import 'package:focal_project/view/checkout_view/checkout_widgets/checkout_dashed_divider.dart';
import 'package:focal_project/view/checkout_view/checkout_widgets/checkout_price_row.dart';
import 'package:get/get.dart';

class CheckoutInfoCard extends StatelessWidget {
  final CheckoutController controller;

  const CheckoutInfoCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpaces.paddingNormal),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpaces.radiusMedium + 2),
        border: Border.all(color: AppColors.grey300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'checkout.your_booking'.tr,
            style: MyTextStyle.normalTitleText(
              color: AppColors.primary,
              size: 14,
            ),
          ),
          SizedBox(height: AppSpaces.heightSmall),
          CheckoutBookingRow(
            icon: AppIcons.calendar,
            label: 'checkout.dates'.tr,
            value: controller.datesRange,
          ),
          CheckoutBookingRow(
            icon: AppIcons.person,
            label: 'checkout.guest'.tr,
            value: controller.guestLabel,
          ),
          CheckoutBookingRow(
            icon: AppIcons.building,
            label: 'checkout.room_type'.tr,
            value: controller.roomType,
          ),
          CheckoutBookingRow(
            icon: AppIcons.call,
            label: 'checkout.phone'.tr,
            value: controller.phone,
            isLast: true,
          ),
          SizedBox(height: AppSpaces.heightNormal),
          const CheckoutDashedDivider(),
          SizedBox(height: AppSpaces.heightNormal),
          Text(
            'checkout.price_details'.tr,
            style: MyTextStyle.normalTitleText(
              color: AppColors.primary,
              size: 14,
            ),
          ),
          SizedBox(height: AppSpaces.heightSmall),
          Obx(
            () => Column(
              children: [
                CheckoutPriceRow(
                  label: 'checkout.price'.tr,
                  value: controller.formatPrice(controller.price),
                ),
                CheckoutPriceRow(
                  label: 'checkout.admin_fee'.tr,
                  value: controller.formatPrice(controller.adminFee),
                ),
                if (controller.appliedCoupon.value != null)
                  CheckoutPriceRow(
                    label: controller.appliedCoupon.value!.title,
                    value:
                        '-${controller.formatPrice(controller.discountAmount)}',
                  ),
                CheckoutPriceRow(
                  label: 'checkout.total_price'.tr,
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