import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';

class MyTextStyle {
  static TextStyle normalTitleText({
    Color? color,
    double? size,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: size ?? 16, 
      color: color ?? AppColors.primaryBlack,
      fontWeight: fontWeight ?? FontWeight.w600,
    );
  }

  static TextStyle smallTitleText({
    Color? color,
    double? size,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: size ?? 12,
      color: color ?? AppColors.grey600,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }

  static TextStyle priceText({
    Color? color,
    double? size,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: size ?? 14,
      color: color ?? AppColors.primary,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }
}