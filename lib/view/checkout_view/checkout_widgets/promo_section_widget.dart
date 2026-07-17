import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class PromoSectionWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const PromoSectionWidget({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Promo',
          style: MyTextStyle.normalTitleText(
            size: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppSpaces.heightMedium),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpaces.paddingNormal,
              vertical: AppSpaces.paddingMedium,
            ),
            decoration: BoxDecoration(
              color: AppColors.lightBlueBg,
              borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.local_offer_outlined,
                  color: AppColors.primary,
                  size: 22,
                ),
                const SizedBox(width: AppSpaces.widthMedium),
                Text(
                  'Select',
                  style: MyTextStyle.normalTitleText(
                    color: AppColors.primary,
                    size: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.chevron_right,
                  color: AppColors.primary,
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
