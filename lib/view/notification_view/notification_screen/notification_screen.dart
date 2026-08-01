import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
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

        title: Text(
          "notification.title".tr,
          style: MyTextStyle.normalTitleText(),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: InkWell(
              child: SvgPicture.asset(AppIcons.sort),
              onTap: () {
                Get.bottomSheet(
                  const FilterBottomSheet(),
                  backgroundColor: Colors.transparent,
                  barrierColor: Colors.black.withOpacity(0.2),
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpaces.widthLarge),
        child: Obx(() {
          final today = controller.notifications
              .where((e) => e.section == "Today")
              .toList();
          final yesterday = controller.notifications
              .where((e) => e.section == "Yesterday")
              .toList();
          return ListView(
            children: [
              SizedBox(height: AppSpaces.heightLarge),

              Text(
                "notification.today".tr,
                style: MyTextStyle.normalTitleText(),
              ),

              SizedBox(height: AppSpaces.heightExtraLarge),

              ...List.generate(
                today.length,
                (index) => NotificationItem(
                  notification: today[index],
                  showDivider: index != today.length - 1,
                ),
              ),

              SizedBox(height: AppSpaces.heightSmall),

              Text(
                "notification.yesterday".tr,
                style: MyTextStyle.normalTitleText(),
              ),

              SizedBox(height: AppSpaces.heightExtraLarge),

              ...List.generate(
                yesterday.length,
                (index) => NotificationItem(
                  notification: yesterday[index],
                  showDivider: index != yesterday.length - 1,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}