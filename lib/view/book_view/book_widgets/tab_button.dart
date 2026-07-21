import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class TabButton extends StatelessWidget {
  final String title;
  final int index;
  final bool isSelected;
  final Function(int index) onTap;
  const TabButton({
    super.key,
    required this.title,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          height: 46,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryWhite : AppColors.grey100,
            borderRadius: BorderRadius.circular(AppSpaces.radiusExtraLarge),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.grey300,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: MyTextStyle.normalTitleText(
                size: 14,
                color: isSelected ? AppColors.primaryBlack : AppColors.grey600,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
