
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool enabled;
  final TextInputType? keyboardType;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.enabled,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: MyTextStyle.normalTitleText(
            color: AppColors.titleColor,
            size: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSpaces.heightSmall),
        TextField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyboardType,
          style: MyTextStyle.normalTitleText(
            color: AppColors.subtitleColor,
            size: 14,
            fontWeight: FontWeight.normal,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.formFiled,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSpaces.paddingNormal,
              vertical: AppSpaces.paddingMedium,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}