
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
            colorFilter: const ColorFilter.mode(AppColors.titleColor, BlendMode.srcIn),
          ),
          onPressed: () => Get.back(),
        ),
        title: Text('Security', style: MyTextStyle.normalTitleText(color: AppColors.titleColor)),
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(AppSpaces.paddingLarge),
          child: Column(
            children: [
              ToggleTile(
                label: 'Face ID',
                value: controller.faceId.value,
                onChanged: controller.toggleFaceId,
              ),
              ToggleTile(
                label: 'Remember Password',
                value: controller.rememberPassword.value,
                onChanged: controller.toggleRememberPassword,
              ),
              ToggleTile(
                label: 'Touch ID',
                value: controller.touchId.value,
                onChanged: controller.toggleTouchId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}