import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class GuestCounterWidget extends StatelessWidget {
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const GuestCounterWidget({
    super.key,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _CounterButton(
          icon: Icons.remove,
          backgroundColor: AppColors.lightBlueBg,
          iconColor: AppColors.primary,
          onTap: onDecrement,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpaces.paddingNormal,
          ),
          child: Text(
            '$count',
            style: MyTextStyle.normalTitleText(
              size: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _CounterButton(
          icon: Icons.add,
          backgroundColor: AppColors.primary,
          iconColor: AppColors.primaryWhite,
          onTap: onIncrement,
        ),
      ],
    );
  }
}

class _CounterButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onTap;

  const _CounterButton({
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18,
          color: iconColor,
        ),
      ),
    );
  }
}
