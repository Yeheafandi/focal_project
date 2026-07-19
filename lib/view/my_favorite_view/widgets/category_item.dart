import 'package:flutter/material.dart';
import 'package:focal_project/view/my_favorite_view/my_favorite_controller/my_favorite_controller.dart';
import 'package:get/get.dart';
import 'package:focal_project/core/constants/app_colors.dart';

class CategoryItem extends GetView<MyFavoriteController> {
  const CategoryItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.changeCategory(title);
        },

        child: Container(
          margin: const EdgeInsets.only(right: 12),

          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 10,
          ),

          decoration: BoxDecoration(
            color: controller.selectedCategory.value == title
                ? AppColors.primary
                : AppColors.grey100,

            borderRadius: BorderRadius.circular(30),
          ),

          child: Text(
            title,
            style: TextStyle(
              color: controller.selectedCategory.value == title
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}