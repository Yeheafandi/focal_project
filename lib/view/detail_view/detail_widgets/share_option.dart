import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class ShareOption extends StatelessWidget {
  final String icon;
  final Color color;
  final String label;
  final VoidCallback onTap;
  const ShareOption({
    super.key,
    required this.icon,
    required this.color,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            width: 54.h,
            height: 54.h,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: SvgPicture.asset(icon, width: 10, height: 10),
            // child: Icon(icon, color: AppColors.primaryWhite, size: 28),
          ),
          SizedBox(height: AppSpaces.heightMedium),
          Text(
            label,
            style: MyTextStyle.smallTitleText(
              color: AppColors.black87,
              size: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
