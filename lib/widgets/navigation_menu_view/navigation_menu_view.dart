import 'package:flutter/material.dart';
import 'package:focal_project/widgets/navigation_menu_view/navigation_menu_controller/navigation_menu_controller.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class NavigationMenuView extends StatelessWidget {
  NavigationMenuView({super.key});

  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),

      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.transparent, 
            elevation: 15,
            shadowColor: AppColors.primaryBlack,
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                  color: AppColors.primaryBlue, 
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                );
              }
              return  TextStyle(
                color: AppColors.grey500,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              );
            }),
          ),

          child: NavigationBar(
            backgroundColor: AppColors.primaryWhite,
            height: 98,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.changeIndex(index),
            destinations: [
              NavigationDestination(
                icon: Image.asset(AppImages.homeIcon, width: 24, height: 24, color: AppColors.grey500),
                selectedIcon: Image.asset(AppImages.homeIconFill, width: 24, height: 24, color: AppColors.primaryBlue),
                label: 'home'.tr,
              ),
              NavigationDestination(
                icon: Image.asset(AppImages.bookingIcon, width: 24, height: 24, color: AppColors.grey500),
                selectedIcon: Image.asset(AppImages.bookingIconFill, width: 24, height: 24, color: AppColors.primaryBlue),
                label: 'my_booking'.tr,
              ),
              NavigationDestination(
                icon: Image.asset(AppImages.favoriteIcon, width: 24, height: 24, color: AppColors.grey500),
                selectedIcon: Image.asset(AppImages.favoriteIconFill, width: 24, height: 24, color: AppColors.primaryBlue),
                label: 'my_favorite_nav'.tr,
              ),
              NavigationDestination(
                icon: Image.asset(AppImages.messageIcon, width: 24, height: 24, color: AppColors.grey500),
                selectedIcon: Image.asset(AppImages.messageIconFill, width: 24, height: 24, color: AppColors.primaryBlue),
                label: 'message'.tr,
              ),
              NavigationDestination(
                icon: Image.asset(AppImages.profileIcon, width: 24, height: 24, color: AppColors.grey500),
                selectedIcon: Image.asset(AppImages.profileIconFill, width: 24, height: 24, color: AppColors.primaryBlue),
                label: 'profile'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}