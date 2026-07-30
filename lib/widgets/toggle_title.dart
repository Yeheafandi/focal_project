import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';



class ToggleTile extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool bordered;
  final bool showDivider;

  const ToggleTile({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.bordered = true,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    final row = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: bordered ? AppSpaces.paddingNormal : 0,
        vertical: AppSpaces.paddingSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: MyTextStyle.normalTitleText(
              color: AppColors.titleColor,
              size: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primaryWhite,
            activeTrackColor: AppColors.primaryBlue,
            inactiveThumbColor: AppColors.primaryWhite,
            inactiveTrackColor: AppColors.grey300,
          ),
        ],
      ),
    );

    if (!bordered) {
      return Column(
        children: [
          row,
          if (showDivider) Divider(height: 1, color: AppColors.grey200),
        ],
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: AppSpaces.paddingNormal),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey200),
        borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
      ),
      child: row,
    );
  }
}