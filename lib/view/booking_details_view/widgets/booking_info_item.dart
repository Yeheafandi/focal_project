import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class BookingInfoItem extends StatelessWidget {
  const BookingInfoItem({
    super.key,
    required this.title,
    required this.value,
    required this.iconName,
  });

  final String title;
  final String value;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(iconName, width: 20, height: 20),
            SizedBox(width: AppSpaces.widthMedium),
            Text(
              title,
              style: MyTextStyle.smallTitleText(
                color: AppColors.titleColor,
                fontWeight: FontWeight.w400,
                size: 14,
              ),
            ),
          ],
        ),

        Text(
          value,
          style: MyTextStyle.smallTitleText(
            color: AppColors.titleColor,
            fontWeight: FontWeight.w500,
            size: 14,
          ),
        ),
      ],
    );
  }
}
