import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/widgets/toggle_title.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'notifications_controller.dart';

class NotificationsScreen extends GetView<NotificationsController> {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());

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
            colorFilter: const ColorFilter.mode(
              AppColors.titleColor,
              BlendMode.srcIn,
            ),
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'notifications'.tr,
          style: MyTextStyle.normalTitleText(
            color: AppColors.titleColor,
            size: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpaces.paddingLarge,
            vertical: AppSpaces.paddingNormal,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(AppSpaces.paddingNormal),
                decoration: BoxDecoration(
                  color: AppColors.primaryWhite,
                  border: Border.all(color: AppColors.grey200.withOpacity(0.6)),
                  borderRadius: BorderRadius.circular(
                    AppSpaces.radiusExtraLarge,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        bottom: 12.0,
                        left: 4.0,
                      ),
                      child: Text(
                        'messages_notifications'.tr,
                        style: MyTextStyle.smallTitleText(
                          color: AppColors.subtitleColor.withOpacity(0.7),
                          size: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ToggleTile(
                      label: 'new_event'.tr,
                      value: controller.newEvent.value,
                      onChanged: controller.toggleNewEvent,
                      bordered: false,
                      showDivider: true,
                    ),
                    ToggleTile(
                      label: 'delivery'.tr,
                      value: controller.delivery.value,
                      onChanged: controller.toggleDelivery,
                      bordered: false,
                      showDivider: true,
                    ),
                    ToggleTile(
                      label: 'message'.tr,
                      value: controller.message.value,
                      onChanged: controller.toggleMessage,
                      bordered: false,
                      showDivider: true,
                    ),
                    ToggleTile(
                      label: 'payment'.tr,
                      value: controller.payment.value,
                      onChanged: controller.togglePayment,
                      bordered: false,
                      showDivider: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
