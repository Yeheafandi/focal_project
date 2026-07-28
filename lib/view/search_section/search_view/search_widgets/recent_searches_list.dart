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
          final String title = item["title"] ?? "";
          final String location = item["location"] ?? "";

          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: AppColors.background,
              child: Icon(Icons.access_time, color: AppColors.grey500),
            ),
            title: Text(
              title, 
              style: MyTextStyle.normalTitleText(size: 14),
            ),
            subtitle: Text(
              location,
              style: MyTextStyle.normalTitleText(
                fontWeight: FontWeight.w400,
                color: AppColors.grey400,
                size: 12,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.close, size: 18, color: AppColors.grey400),
              onPressed: () {
                controller.recentSearches.removeAt(index);
              },
            ),
            onTap: () {
              controller.searchTxtController.text = title;
              controller.executeSearchAndFilter();
            },
          );
        },
      ),
    );
  }
}