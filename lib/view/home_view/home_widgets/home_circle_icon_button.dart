import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';

class HomeCircleIconButton extends StatelessWidget {
  final Image icon;
  final VoidCallback onPressed;

  const HomeCircleIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.grey200),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon:icon,
        onPressed: onPressed,
      ),
    );
  }
}