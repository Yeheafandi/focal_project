
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
class LanguageTile extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showDivider;

  const LanguageTile({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpaces.paddingMedium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: MyTextStyle.normalTitleText(
                    color: isSelected ? AppColors.primaryBlue : AppColors.titleColor,
                    size: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (isSelected)
                  Icon(Icons.check, size: 18, color: AppColors.primaryBlue),
              ],
            ),
          ),
          if (showDivider) Divider(height: 1, color: AppColors.grey200),
        ],
      ),
    );
  }
}