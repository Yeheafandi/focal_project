import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/checkout_view/checkout_controller/checkout_controller.dart';
import 'package:focal_project/view/checkout_view/checkout_widgets/coupon_item_widget.dart';
import 'package:get/get.dart';

class MyCouponBottomSheet extends StatelessWidget {
  const MyCouponBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckoutController>();

    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpaces.paddingLarge,
        AppSpaces.paddingMedium,
        AppSpaces.paddingLarge,
        AppSpaces.paddingLarge,
      ),
      decoration: const BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpaces.radiusExtraLarge),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.grey300,
              borderRadius: BorderRadius.circular(AppSpaces.radiusSmall),
            ),
          ),
          const SizedBox(height: AppSpaces.heightLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Cupon',
                style: MyTextStyle.normalTitleText(
                  size: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: Get.back,
                child: Container(
                  padding: const EdgeInsets.all(AppSpaces.paddingSmall),
                  decoration: BoxDecoration(
                    color: AppColors.grey100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: AppSpaces.widthMedium,
                    color: AppColors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpaces.heightLarge),
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.coupons.length,
              itemBuilder: (context, index) {
                final coupon = controller.coupons[index];
                return CouponItemWidget(
                  coupon: coupon,
                  onTap: () => controller.selectCoupon(coupon.id),
                );
              },
            ),
          ),
          const SizedBox(height: AppSpaces.heightMedium),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: controller.useCoupon,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.primaryWhite,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppSpaces.radiusMedium,
                  ),
                ),
              ),
              child: Text(
                'Use Cupon',
                style: MyTextStyle.normalTitleText(
                  color: AppColors.primaryWhite,
                  size: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
