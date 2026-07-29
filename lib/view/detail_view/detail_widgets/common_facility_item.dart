import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class CommonFacilityItem extends StatelessWidget {
  final IconData? icon;
  final String label;
  final bool isLoading;

  const CommonFacilityItem({
    super.key,
    this.icon,
    required this.label,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AppColors.facilitiesColor, 
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                    ),
                  )
                : Icon(
                    icon,
                    color: AppColors.primaryBlack,
                    size: 24,
                  ),
          ),
        ),
        SizedBox(height: AppSpaces.heightVerySmall),
        Text(
          label,
          textAlign: TextAlign.center,
          style: MyTextStyle.smallTitleText(
            fontWeight: FontWeight.w500,
            color: AppColors.grey500, 
            size: 12,
          ),
        ),
      ],
    );
  }
}