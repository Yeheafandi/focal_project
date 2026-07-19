import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../search_filter_controller/search_filter_controller.dart';

class RecentSearchesList extends StatelessWidget {
  const RecentSearchesList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchFilterController>();

    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.recentSearches.length,
        itemBuilder: (context, index) {
          final item = controller.recentSearches[index];
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: AppColors.background,
              child: Icon(Icons.access_time, color: AppColors.grey500),
            ),
            title: Text(
              item,
              style: MyTextStyle.normalTitleText(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Clearwater, FL",
              style: MyTextStyle.normalTitleText(
                color: AppColors.grey400,
                size: 12,
              ),
            ),
            onTap: () {
              controller.searchTxtController.text = item;
              controller.executeSearchAndFilter();
            },
          );
        },
      ),
    );
  }
}
