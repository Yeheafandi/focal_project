
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:get/get.dart';

import 'widgets/settings_tile.dart';
import 'profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('profile'.tr, style: MyTextStyle.normalTitleText(fontWeight: FontWeight.w600,size: 18,color: AppColors.titleColor)),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: AppSpaces.paddingLarge),
          children: [
            SizedBox(height: AppSpaces.heightSmall),
            Obx(() => Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(controller.avatarUrl.value),
                    ),
                    SizedBox(width: AppSpaces.widthMedium),
                    Expanded(
                      child: Column(spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.name.value,
                            style: MyTextStyle.normalTitleText(size: 18,color: AppColors.titleColor),
                          ),
                          SizedBox(height: AppSpaces.heightVerySmall / 2),
                          Text(
                            controller.username.value,
                            style: MyTextStyle.smallTitleText(size: 14,color: AppColors.userColor, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.goToPersonalInfo,
                      child: Container(
                        padding: EdgeInsets.all(AppSpaces.paddingVerySmall),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey200),
                          borderRadius: BorderRadius.circular(AppSpaces.radiusSmall),
                        ),
                        child: ImageIcon(AssetImage(AppIcons.edit), size: 18, color: AppColors.titleColor),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: AppSpaces.heightExtraLarge),
            Text('setting'.tr, style: MyTextStyle.smallTitleText(size: 18,color: AppColors.hintColor,fontWeight: FontWeight.w500)),
            SizedBox(height: AppSpaces.heightVerySmall),
           Column(spacing: 28, children: [ SettingsTile(icon: AppIcons.wallet, title: 'your_card'.tr, onTap: controller.goToCard),
            SettingsTile(icon: AppIcons.security, title: 'security'.tr, onTap: controller.goToSecurity),
            SettingsTile(icon: AppIcons.notify, title: 'notifications'.tr, onTap: controller.goToNotifications),
            SettingsTile(icon: AppIcons.language, title: 'languages'.tr, onTap: controller.goToLanguage),
            SettingsTile(
              icon: AppIcons.help,
              title: 'help_and_support'.tr,
              
              onTap: controller.goToHelpSupport,
            ),], ),
            SizedBox(height: AppSpaces.heightExtraLarge),
            Center(
              child: TextButton(
                onPressed: controller.logout,
                child: Text('Logout'.tr, style: MyTextStyle.normalTitleText(color: AppColors.red, size: 16)),
              ),
            ),
            SizedBox(height: AppSpaces.heightSmall),
          ],
        ),
      ),   
          );
    
  }
}