import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/notification_view/notification_controller/notification_controller.dart';
import 'package:get/get.dart';

class FilterOptionTile extends GetView<NotificationController> {
  const FilterOptionTile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CheckboxListTile(dense: true,
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
        value: controller.selectedFilters.contains(title),

        onChanged: (_) {
          controller.toggleFilter(title);
        },

        contentPadding: EdgeInsets.zero,

        activeColor: AppColors.primaryBlue,

        title: Text(
          title,
          style: MyTextStyle.smallTitleText(
            size: 14,
            color: AppColors.subtitleColor,
            fontWeight: FontWeight.w400,
          ),
        ),

        // controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}
