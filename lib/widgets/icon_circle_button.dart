import 'package:flutter/material.dart';
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
  });

  @override
  Widget build(BuildContext context) {
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
        ),
      ),
    );
  }
}