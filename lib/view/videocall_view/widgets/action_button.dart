import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:get/get.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.state,
    this.isToggle = true,
    this.backgroundColor,
    this.iconColor,
  });

  final IconData icon;
  final RxBool? state;
  final VoidCallback onTap;
  final bool isToggle;

  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
   
    if (state != null) {
      return Obx(
        () => _button(
          color: backgroundColor ?? AppColors.grey300,
          iconColor: (isToggle && state!.value)
              ? AppColors.red
              : iconColor ?? AppColors.primaryBlack,
        ),
      );
    }

   
    return _button(
      color: backgroundColor ?? AppColors.grey300,
      iconColor: iconColor ?? AppColors.primaryBlack,
    );
  }


  Widget _button({
    required Color color,
    required Color iconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: AppSpaces.radiusExtraExtraLarge28,
        backgroundColor: color,
        child: Icon(
          icon,
          color: iconColor,
          size: 28,
        ),
      ),
    );
  }
}