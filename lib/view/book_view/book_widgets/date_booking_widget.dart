import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class DateBookingWidget extends StatelessWidget {
  final String label;
  final String dateText;
  final VoidCallback? onTap;

  const DateBookingWidget({
    super.key,
    required this.label,
    required this.dateText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpaces.paddingNormal),
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: AppColors.grey600,
                ),
                const SizedBox(width: AppSpaces.widthSmall),
                Text(
                  label,
                  style: MyTextStyle.smallTitleText(
                    color: AppColors.grey600,
                    size: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpaces.heightSmall),
            Text(
              dateText,
              style: MyTextStyle.normalTitleText(
                color: AppColors.grey600,
                size: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
