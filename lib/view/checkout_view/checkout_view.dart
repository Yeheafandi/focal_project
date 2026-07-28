import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/checkout_view/checkout_controller/checkout_controller.dart';
import 'package:focal_project/view/checkout_view/checkout_widgets/checkout_info_card.dart';
import 'package:focal_project/view/checkout_view/checkout_widgets/promo_section_widget.dart';
import 'package:focal_project/widgets/custome_button.dart';
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
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryBlack),
          onPressed: () => Get.back(),
        ),
        title: Text('Checkout', style: MyTextStyle.normalTitleText(size: 18)),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.primaryBlack),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
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
                  SizedBox(height: AppSpaces.heightSmall),
                  CheckoutInfoCard(controller: controller),
                  SizedBox(height: AppSpaces.heightLarge),
                  PromoSectionWidget(onTap: controller.showCouponBottomSheet),
                  SizedBox(height: AppSpaces.heightExtraLarge),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpaces.paddingLarge,
              AppSpaces.paddingSmall,
              AppSpaces.paddingLarge,
              AppSpaces.paddingLarge,
            ),
            child: SizedBox(
              width: double.infinity,
              child: CustomeButton(
                text: "Select Payment",
                onPressed: controller.selectPayment,
              ),
             
            ),
          ),
        ],
      ),
    );
  }
}
