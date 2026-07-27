import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class PaymentDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const PaymentDetailRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? MyTextStyle.normalTitleText(
                  size: 18,
                  fontWeight: FontWeight.w500,
                )
              : MyTextStyle.smallTitleText(
                  color: AppColors.grey600,
                  size: 16,
                  fontWeight: FontWeight.w400,
                ),
        ),
        Text(
          value,
          style: isTotal
              ? MyTextStyle.normalTitleText(
                  size: 16,
                  fontWeight: FontWeight.w500,
                )
              : MyTextStyle.smallTitleText(
                  color: AppColors.black87,
                  size: 18,
                  fontWeight: FontWeight.w400,
                ),
        ),
      ],
    );
  }
}
