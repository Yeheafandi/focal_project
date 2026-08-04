
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';


class SettingsTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final bool showDivider;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.textColor,
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
              children: [
                ImageIcon(AssetImage(icon), size: 20, color: textColor ?? AppColors.titleColor),
                SizedBox(width: AppSpaces.widthMedium),
                Expanded(
                  child: Text(
                    title,
                    style: MyTextStyle.normalTitleText(
                      color: textColor ?? AppColors.titleColor,
                      size: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (showDivider) Divider(height: 1, color: AppColors.grey200),
        ],
      ),
    );
  }
}
