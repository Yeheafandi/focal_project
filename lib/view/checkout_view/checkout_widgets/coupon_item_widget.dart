import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/model/coupon_model.dart';

class CouponItemWidget extends StatelessWidget {
  final CouponModel coupon;
  final VoidCallback onTap;

  const CouponItemWidget({
    super.key,
    required this.coupon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpaces.heightMedium),
        padding: const EdgeInsets.all(AppSpaces.paddingNormal),
        decoration: BoxDecoration(
          color: coupon.isSelected ? AppColors.primaryWhite : AppColors.grey100,
          borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
          border: coupon.isSelected
              ? Border.all(color: AppColors.primary, width: 1.5)
              : null,
        ),
        child: Row(
          children: [
            Icon(
              Icons.local_offer_outlined,
              color: AppColors.primary,
              size: 28,
            ),
            const SizedBox(width: AppSpaces.widthMedium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coupon.title,
                    style: MyTextStyle.normalTitleText(
                      color: coupon.isSelected
                          ? AppColors.primary
                          : AppColors.primaryBlack,
                      size: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: AppSpaces.heightVerySmall),
                  Row(
                    children: [
                      Text(
                        coupon.expiryText,
                        style: MyTextStyle.smallTitleText(
                          color: AppColors.grey,
                          size: 12,
                        ),
                      ),
                      const SizedBox(width: AppSpaces.widthSmall),
                      Text(
                        'See Detail',
                        style: MyTextStyle.smallTitleText(
                          color: AppColors.primary,
                          size: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (coupon.isSelected)
              Icon(
                Icons.check,
                color: AppColors.primary,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }
}
