import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:get/get.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.iconName,
    required this.onTap,
    this.state,
    this.isToggle = true,
    this.backgroundColor,
    this.iconColor,
    this.width=24.0,
    this.height=24.0,
    this.radius=28.0,
  });
  final double width;
  final double height;
  final String iconName;
  final RxBool? state;
  final VoidCallback onTap;
  final bool isToggle;
  final double radius;
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

  Widget _button({required Color color, required Color iconColor}) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: color,
        child: SvgPicture.asset(
          iconName,
          width: width,
          height: height,
          color: iconColor,
        ),
      ),
    );
  }
}
