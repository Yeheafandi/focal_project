import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:get/get.dart';

class PromoSectionWidget extends StatelessWidget {
  final String? label;
  final VoidCallback? onTap;

  const PromoSectionWidget({super.key, this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'checkout.promo'.tr,
          style: MyTextStyle.normalTitleText(
            size: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: AppSpaces.heightMedium),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpaces.paddingNormal,
              vertical: AppSpaces.paddingMedium,
            ),
            decoration: BoxDecoration(
              color: AppColors.lightBlueBg,
              borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
            ),
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.discountShape),
                SizedBox(width: AppSpaces.widthMedium),
                Text(
                  label ?? 'checkout.select_promo'.tr,
                  style: MyTextStyle.normalTitleText(
                    color: AppColors.primary,
                    size: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(AppIcons.arrowRight),
              ],
            ),
          ),
        ),
      ],
    );
  }
}