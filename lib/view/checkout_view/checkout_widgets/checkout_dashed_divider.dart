import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';

class CheckoutDashedDivider extends StatelessWidget {
  const CheckoutDashedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dashWidth = 6.0;
        const dashSpace = 4.0;
        final dashCount =
            (constraints.maxWidth / (dashWidth + dashSpace)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return Container(
              width: dashWidth,
              height: 1,
              color: AppColors.grey300,
            );
          }),
        );
      },
    );
  }
}
