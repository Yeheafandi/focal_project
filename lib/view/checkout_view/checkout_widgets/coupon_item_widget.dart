import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
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
      // showModalBottomSheet(
      //   context: context,
      //   isScrollControlled: true,
      //   backgroundColor: Colors.transparent,
      //   builder: (_) => Container(
      //     margin: const EdgeInsets.only(top: 40),
      //     decoration: const BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      //     ),
      //     child: const PaymentMethodModal(),
      //   ),
      // );
      child: Container(
        margin: EdgeInsets.only(bottom: AppSpaces.heightNormal),
        padding: EdgeInsets.all(AppSpaces.paddingNormal),
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
          border: coupon.isSelected
              ? Border.all(color: AppColors.primary, width: 1)
              : null,
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.discountShape),
            SizedBox(width: AppSpaces.widthMedium),
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
                      size: 14,
                    ),
                  ),
                  SizedBox(height: AppSpaces.heightVerySmall),
                  Row(
                    children: [
                      Text(
                        coupon.expiryText,
                        style: MyTextStyle.smallTitleText(
                          color: AppColors.grey600,
                          size: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: AppSpaces.widthSmall),
                      Text(
                        'See Detail',
                        style: MyTextStyle.smallTitleText(
                          color: AppColors.primary,
                          size: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (coupon.isSelected)
              Icon(Icons.check, color: AppColors.primary, size: 20),
          ],
        ),
      ),
    );
  }
}
