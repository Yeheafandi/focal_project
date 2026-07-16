import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';

class CustomeButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomeButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(

        onPressed: onPressed,
    style: ElevatedButton.styleFrom(
    overlayColor: AppColors.primaryBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ), child:  Text(text,style: const TextStyle(color:AppColors.textWhite),));
  }
}