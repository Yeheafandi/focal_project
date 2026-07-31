import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/my_favorite_view/my_favorite_controller/my_favorite_controller.dart';
import 'package:get/get.dart';
import 'package:focal_project/core/constants/app_colors.dart';

class CategoryItem extends GetView<MyFavoriteController> {
  const CategoryItem({super.key, required this.title, required this.icon});

  final String title;
  final String ?icon;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.changeCategory(title);
        },

        child: Container(constraints: const BoxConstraints(
    minWidth: 60, 
  ),
          margin: EdgeInsets.only(right: 6),

          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),

          decoration: BoxDecoration(
            color: controller.selectedCategory.value == title
                ? AppColors.primaryBlue
                : AppColors.primaryWhite,

            borderRadius: BorderRadius.circular(24),
            border: controller.selectedCategory.value == title
                ? Border.all(width: 0)
                : Border.all(color: AppColors.formFiled),
          ),

          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            
            children: [if(icon!=null)...[
              CircleAvatar(
                radius: 14,
                child: SvgPicture.asset(icon!, width: 16, height: 16),
                backgroundColor: AppColors.grey100,
              ),
              SizedBox(width: AppSpaces.widthVerySmall),],
              Text(
                title,
                style: MyTextStyle.normalTitleText(
                  size: 14,
                  fontWeight: controller.selectedCategory.value == title
                      ? FontWeight.w500
                      : FontWeight.w400,
                  color: controller.selectedCategory.value == title
                      ? Colors.white
                      : AppColors.grey500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
