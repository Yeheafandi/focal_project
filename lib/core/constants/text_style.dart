import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';

class MyTextStyle {
  static TextStyle normalTitleText({
    Color? color,
    double? size,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: size ?? 20,
      color: color ?? AppColors.primaryBlack,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }

  static TextStyle smallTitleText({
    Color? color,
    double? size,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: size ?? 14,
      color: color ?? AppColors.grey,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }
}
