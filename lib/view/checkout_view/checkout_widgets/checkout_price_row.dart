import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class CheckoutPriceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const CheckoutPriceRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isTotal ? 0 : AppSpaces.heightMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal
                ? MyTextStyle.normalTitleText(
                    size: 14,
                    fontWeight: FontWeight.w600,
                  )
                : MyTextStyle.smallTitleText(
                    color: AppColors.black87,
                    size: 14,
                    fontWeight: FontWeight.w400,
                  ),
          ),
          Text(
            value,
            style: isTotal
                ? MyTextStyle.normalTitleText(
                    size: 15,
                    fontWeight: FontWeight.w600,
                  )
                : MyTextStyle.smallTitleText(
                    color: AppColors.primaryBlack,
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
          ),
        ],
      ),
    );
  }
}
