import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/notification_view/notification_controller/notification_controller.dart';
import 'package:focal_project/view/notification_view/widgets/filter_option_tile.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends GetView<NotificationController> {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(AppSpaces.paddingLarge),

      decoration: const BoxDecoration(
        color: AppColors.primaryWhite,

        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),

      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Container(
              height: 5,
              width: 60,
              decoration: BoxDecoration(color: AppColors.grey200),
            ), SizedBox(height: AppSpaces.heightNormal),
            Text("notification.filter_by".tr, style: MyTextStyle.normalTitleText().copyWith(fontWeight: FontWeight.w300,fontSize: 18)),

             SizedBox(height: AppSpaces.heightExtraLarge),

            ...controller.filters.map(
              (filter) => FilterOptionTile(title: filter),
            ),

             SizedBox(height: AppSpaces.heightExtraLarge),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                onPressed: () {
                  controller.applyFilter();

                  Get.back();
                },

                child: Text(
                  "notification.apply".tr,
                  style: MyTextStyle.normalTitleText().copyWith(
                    color: AppColors.textWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
