import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/notification_view/notification_controller/notification_controller.dart';
import 'package:focal_project/view/notification_view/widgets/filter_bottom_sheet.dart';
import 'package:focal_project/view/notification_view/widgets/notification_item.dart';
import 'package:get/get.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          padding: EdgeInsets.only(left: AppSpaces.widthLarge),
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryBlack),
        ),

        centerTitle: true,

        title: Text("Notifications", style: MyTextStyle.normalTitleText()),

        actions: [
          IconButton(
            padding: EdgeInsets.only(right: AppSpaces.widthLarge),
            onPressed: () {
              Get.bottomSheet(
                const FilterBottomSheet(),
                backgroundColor: AppColors.primaryWhite,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
              );
            },
            icon: const Icon(Icons.filter_list, color: AppColors.primaryBlack),
          ),
        ],
      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: AppSpaces.widthLarge),
        child: Obx(
          () => ListView(
            children: [
               SizedBox(height: AppSpaces.heightLarge),

              Text("Today", style: MyTextStyle.normalTitleText()),

               SizedBox(height: AppSpaces.heightExtraLarge),

              ...controller.notifications.map(
                (notification) => NotificationItem(notification: notification),
              ),

               SizedBox(height: AppSpaces.heightLarge),

              Text("Yesterday", style: MyTextStyle.normalTitleText()),

               SizedBox(height: AppSpaces.heightExtraLarge),

              ...controller.notifications.map(
                (notification) => NotificationItem(notification: notification),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
