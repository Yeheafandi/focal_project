import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/checkout_view/checkout_controller/checkout_controller.dart';
import 'package:focal_project/view/checkout_view/checkout_widgets/coupon_item_widget.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get.dart';

class MyCouponBottomSheet extends StatelessWidget {
  const MyCouponBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckoutController>();

    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpaces.paddingExtraLarge,
        AppSpaces.paddingMedium,
        AppSpaces.paddingExtraLarge,
        AppSpaces.paddingExtraLarge,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpaces.radiusExtraExtraLarge28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: AppColors.grey300,
              borderRadius: BorderRadius.circular(AppSpaces.radiusSmall),
            ),
          ),
          SizedBox(height: AppSpaces.heightLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My Cupon', style: MyTextStyle.normalTitleText(size: 20)),
              GestureDetector(
                onTap: Get.back,
                child: Container(
                  padding: EdgeInsets.all(AppSpaces.paddingSmall),

                  child: SvgPicture.asset(AppIcons.close),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpaces.heightLarge),
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
          SizedBox(
            width: double.infinity,
            child: CustomeButton(
              text: "Use Cupon",
              onPressed: controller.useCoupon,
            ),
          ),
        ],
      ),
    );
  }
}
