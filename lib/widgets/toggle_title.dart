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
        horizontal: bordered ? AppSpaces.paddingNormal : 4,
        vertical: AppSpaces.paddingSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: MyTextStyle.normalTitleText(
              color: AppColors.titleColor,
              size: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: AppColors.primaryBlue,
              activeTrackColor: AppColors.primaryBlue.withOpacity(0.15),
              inactiveThumbColor: AppColors.primaryBlue,
              inactiveTrackColor: AppColors.grey200.withOpacity(0.5),
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
            ),
          ),
        ],
      ),
    );

    if (!bordered) {
      return Column(
        children: [
          row,
          if (showDivider)
            Divider(
              height: 1,
              color: AppColors.grey200.withOpacity(0.4),
              indent: 4,
              endIndent: 4,
            ),
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
