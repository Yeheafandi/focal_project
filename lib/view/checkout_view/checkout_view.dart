import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/checkout_view/checkout_controller/checkout_controller.dart';
import 'package:focal_project/view/checkout_view/checkout_widgets/checkout_info_card.dart';
import 'package:focal_project/view/checkout_view/checkout_widgets/promo_section_widget.dart';
import 'package:focal_project/widgets/recommended_hotel_card.dart';
import 'package:get/get.dart';

class CheckoutView extends StatelessWidget {
  final CheckoutController controller = Get.put(CheckoutController());

  CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryBlack,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Checkout',
          style: MyTextStyle.normalTitleText(
            size: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: AppColors.primaryBlack,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpaces.paddingLarge,
                vertical: AppSpaces.paddingNormal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecommendedHotelCard(
                    hotel: controller.bookingArgs.hotel,
                    underline: false,
                  ),
                  const SizedBox(height: AppSpaces.heightMedium),
                  CheckoutInfoCard(controller: controller),
                  const SizedBox(height: AppSpaces.heightLarge),
                  Obx(
                    () => PromoSectionWidget(
                      label: controller.promoLabel,
                      onTap: controller.showCouponBottomSheet,
                    ),
                  ),
                  const SizedBox(height: AppSpaces.heightExtraLarge),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpaces.paddingLarge,
              AppSpaces.paddingSmall,
              AppSpaces.paddingLarge,
              AppSpaces.paddingLarge,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: controller.selectPayment,
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
                  'Select Payment',
                  style: MyTextStyle.normalTitleText(
                    color: AppColors.primaryWhite,
                    size: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
