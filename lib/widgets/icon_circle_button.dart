import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';

class CustomCircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double size;
  final double iconSize;
  final Color iconColor;
  final Color backgroundColor;
  final bool hasBorder;
  final bool hasShadow;

  const CustomCircleIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 40.0,
    this.iconSize = 20.0,
    this.iconColor = AppColors.primaryBlack,
    this.backgroundColor = AppColors.primaryWhite,
    this.hasBorder = false,
    this.hasShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: hasBorder ? Border.all(color: AppColors.grey200) : null,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: AppColors.primaryBlack,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
      ),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: Icon(icon, color: iconColor, size: iconSize),
          onPressed: onPressed,
        ),
      ),
    );
  }
}