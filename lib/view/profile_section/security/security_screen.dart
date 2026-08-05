import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/widgets/toggle_title.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'security_controller.dart';

class SecurityScreen extends GetView<SecurityController> {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SecurityController());

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
            colorFilter:
                const ColorFilter.mode(AppColors.titleColor, BlendMode.srcIn),
          ),
          onPressed: () => Get.back(),
        ),
        title: Text('security'.tr,
            style: MyTextStyle.normalTitleText(
                color: AppColors.titleColor, size: 18)),
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(AppSpaces.paddingLarge),
          child: Container(
            padding: EdgeInsets.all( AppSpaces.paddingVerySmall),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
                border: Border.all(color: AppColors.grey300)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ToggleTile(
                  bordered: false,
                  label: 'face_id'.tr,
                  value: controller.faceId.value,
                  onChanged: controller.toggleFaceId,
                ),
                Divider(
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                  color: AppColors.grey300,
                ),
                ToggleTile(
                  bordered: false,
                  label: 'remember_password'.tr,
                  value: controller.rememberPassword.value,
                  onChanged: controller.toggleRememberPassword,
                ),
                Divider(
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                  color: AppColors.grey300,
                ),
                ToggleTile(
                  bordered: false,
                  label: 'touch_id'.tr,
                  value: controller.touchId.value,
                  onChanged: controller.toggleTouchId,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
