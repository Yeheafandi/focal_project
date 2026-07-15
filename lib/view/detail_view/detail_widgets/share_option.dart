import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class ShareOption extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onTap;
  const ShareOption(
      {super.key,
      required this.icon,
      required this.color,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: AppSpaces.heightExtraLarge * 2 - 4,
            height: AppSpaces.heightExtraLarge * 2 - 4,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primaryWhite, size: 28),
          ),
          const SizedBox(height: AppSpaces.heightSmall),
          Text(label,
              style: MyTextStyle.smallTitleText(color: AppColors.black87)),
        ],
      ),
    );
  }
}
