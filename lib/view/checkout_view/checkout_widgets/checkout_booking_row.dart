import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class CheckoutBookingRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const CheckoutBookingRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: AppSpaces.heightMedium),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: AppColors.primary,
          ),
           SizedBox(width: AppSpaces.widthMedium),
          Text(
            label,
            style: MyTextStyle.smallTitleText(
              color: AppColors.grey600,
              size: 14,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: MyTextStyle.normalTitleText(
              size: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
