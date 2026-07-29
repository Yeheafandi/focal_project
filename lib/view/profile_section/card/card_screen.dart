
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/profile_section/card/widgets/card_payment.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'card_controller.dart';


class CardScreen extends GetView<CardController> {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CardController());

    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            AppIcons.backArrow,
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(AppColors.titleColor, BlendMode.srcIn),
          ),
          onPressed: () => Get.back(),
        ),
        title: Text('Your Card', style: MyTextStyle.normalTitleText(color: AppColors.titleColor)),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.error.value != null) {
          return Center(child: Text(controller.error.value!));
        }
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpaces.paddingLarge,
            vertical: AppSpaces.paddingSmall,
          ),
          child: ListView.separated(
            itemCount: controller.cards.length,
            separatorBuilder: (_, __) => SizedBox(height: AppSpaces.heightLarge),
            itemBuilder: (context, index) {
              final card = controller.cards[index];
              return PaymentCard(
                card: card,
                isDefault: controller.defaultCardIndex.value == index,
                onDefaultChanged: (_) => controller.setDefaultCard(index),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: controller.addCard,
        child: Icon(Icons.add, color: AppColors.primaryWhite),
      ),
    );
  }
}