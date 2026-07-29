
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
            colorFilter: const ColorFilter.mode(AppColors.titleColor, BlendMode.srcIn),
          ),
          onPressed: () => Get.back(),
        ),
        title: Text('Notifications', style: MyTextStyle.normalTitleText(color: AppColors.titleColor)),
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(AppSpaces.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Messages Notifications',
                style: MyTextStyle.smallTitleText(color: AppColors.subtitleColor, size: 12),
              ),
              SizedBox(height: AppSpaces.heightSmall),
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppSpaces.paddingNormal),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey200),
                  borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
                ),
                child: Column(
                  children: [
                    ToggleTile(
                      label: 'New Event',
                      value: controller.newEvent.value,
                      onChanged: controller.toggleNewEvent,
                      bordered: false,
                      showDivider: true,
                    ),
                    ToggleTile(
                      label: 'Delivery',
                      value: controller.delivery.value,
                      onChanged: controller.toggleDelivery,
                      bordered: false,
                      showDivider: true,
                    ),
                    ToggleTile(
                      label: 'Message',
                      value: controller.message.value,
                      onChanged: controller.toggleMessage,
                      bordered: false,
                      showDivider: true,
                    ),
                    ToggleTile(
                      label: 'Payment',
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