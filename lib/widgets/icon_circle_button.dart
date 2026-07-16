import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../../core/constants/app_colors.dart';

class IconCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool hasCircle; 
  final double size;    
  final double iconSize;  

  const IconCircleButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.hasCircle = true,
    this.size = 42.0,     
    this.iconSize = 18.0,  
=======
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
>>>>>>> feat/home-view
  });

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: hasCircle ? size : null, 
        height: hasCircle ? size : null,
        alignment: Alignment.center, 
        decoration: hasCircle
            ? BoxDecoration(
                color: AppColors.primaryWhite,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlack, 
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              )
            : null, 
        child: Icon(
          icon, 
          color: AppColors.primaryBlack, 
          size: iconSize,
=======
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
>>>>>>> feat/home-view
        ),
      ),
    );
  }
}