
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/routes/routes.dart';
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
        title: Text('Profile', style: MyTextStyle.normalTitleText(color: AppColors.titleColor)),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.name.value,
                            style: MyTextStyle.normalTitleText(color: AppColors.titleColor),
                          ),
                          SizedBox(height: AppSpaces.heightVerySmall / 2),
                          Text(
                            controller.username.value,
                            style: MyTextStyle.smallTitleText(color: AppColors.subtitleColor),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(AppSpaces.paddingVerySmall),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey200),
                        borderRadius: BorderRadius.circular(AppSpaces.radiusSmall),
                      ),
                      child: Icon(Icons.edit_outlined, size: 18, color: AppColors.titleColor),
                    ),
                  ],
                )),
            SizedBox(height: AppSpaces.heightExtraLarge),
            Text('Setting', style: MyTextStyle.smallTitleText(color: AppColors.subtitleColor)),
            SizedBox(height: AppSpaces.heightVerySmall),
            SettingsTile(icon: Icons.credit_card, title: 'Your Card', onTap: controller.goToCard),
            SettingsTile(icon: Icons.verified_user_outlined, title: 'Security', onTap: () {}),
            SettingsTile(icon: Icons.notifications_none, title: 'Notification', onTap: () {}),
            SettingsTile(icon: Icons.language, title: 'Languages', onTap: () {Get.toNamed(Routes.languages);}),
            SettingsTile(
              icon: Icons.help_outline,
              title: 'Help and Support',
              showDivider: false,
              onTap: () {},
            ),
            SizedBox(height: AppSpaces.heightExtraLarge),
            Center(
              child: TextButton(
                onPressed: controller.logout,
                child: Text('Logout', style: MyTextStyle.normalTitleText(color: AppColors.red, size: 15)),
              ),
            ),
            SizedBox(height: AppSpaces.heightSmall),
          ],
        ),
      ),
      //bottomNavigationBar: Obx(() => BottomNavBar(
        //    currentIndex: controller.navIndex.value,
          //  onTap: controller.changeNavIndex,
          );
    
  }
}