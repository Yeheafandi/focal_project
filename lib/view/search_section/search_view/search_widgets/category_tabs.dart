import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spaces.dart';
import '../search_filter_controller/search_filter_controller.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchFilterController>();
    final categories = ["All", "Villas", "Hotels", "Apartments"];

    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSpaces.paddingLarge),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          return Obx(() {
            bool isSelected = controller.selectedCategory.value == cat;
            return GestureDetector(
              onTap: () {
                controller.selectedCategory.value = cat;
                controller.executeSearchAndFilter();
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryBlue
                      : AppColors.primaryWhite,
                  borderRadius: BorderRadius.circular(AppSpaces.radiusSmall),
                  border: Border.all(color: AppColors.grey200),
                ),
                child: Center(
                  child: Text(
                    cat,
                    style: MyTextStyle.normalTitleText(
                      color: isSelected
                          ? AppColors.primaryWhite
                          : AppColors.grey600,
                      fontWeight: FontWeight.w500,
                      size: 14,
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
