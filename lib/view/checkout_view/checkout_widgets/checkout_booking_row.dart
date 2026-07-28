import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class CheckoutBookingRow extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  final bool isLast;

  const CheckoutBookingRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom:isLast ? 0: AppSpaces.heightMedium ),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: AppSpaces.widthMedium),
          Text(
            label,
            style: MyTextStyle.smallTitleText(
              color: AppColors.black87,
              size: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: MyTextStyle.normalTitleText(
              size: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
