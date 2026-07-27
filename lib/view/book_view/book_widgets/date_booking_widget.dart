import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
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
        padding: EdgeInsets.all(AppSpaces.paddingNormal),
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Icon(
                //   Icons.calendar_month_outlined,
                //   size: 20,
                //   color: AppColors.black87,
                // ),
                SvgPicture.asset(AppIcons.calendar2),
                SizedBox(width: AppSpaces.widthSmall),
                Text(
                  label,
                  style: MyTextStyle.normalTitleText(
                    color: AppColors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpaces.heightNormal),
            Text(
              dateText,
              style: MyTextStyle.normalTitleText(
                color: AppColors.grey600,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
