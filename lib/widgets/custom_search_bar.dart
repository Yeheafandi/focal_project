import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_images.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spaces.dart';
import '../../core/constants/text_style.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onFilterTap;
  final VoidCallback? onResetTap;
  final bool isFilterApplied;
  final String hintText;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onFilterTap,
    this.onResetTap,
    this.isFilterApplied = false,
    this.hintText = "Search...",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: AppSpaces.paddingNormal),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(30),

        border: Border.all(color: AppColors.grey300),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.grey500),
          SizedBox(width: AppSpaces.widthMedium),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: MyTextStyle.smallTitleText(
                  color: AppColors.grey500,
                  size: 14,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          if (onFilterTap != null)
            IconButton(
              icon: Image.asset(
                isFilterApplied
                    ? AppImages.filterOffOutlineIcon
                    : AppImages.filterIcon,
              ),
              onPressed: isFilterApplied ? onResetTap : onFilterTap,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
        ],
      ),
    );
  }
}
