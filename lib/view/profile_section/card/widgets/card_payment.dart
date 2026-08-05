import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/model/payment_card_model.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

/// ويدجت البطاقة - منستقبل PaymentCardModel وبنبني الشكل حسب النوع (visa/mastercard)
class PaymentCard extends StatelessWidget {
  final PaymentCardModel card;
  final bool isDefault;
  final ValueChanged<bool?> onDefaultChanged;

  const PaymentCard({
    super.key,
    required this.card,
    required this.isDefault,
    required this.onDefaultChanged,
  });

  bool get _isVisa => card.type == 'visa';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSpaces.radiusLarge),
          child: Stack(
            children: [
              Container(
                // height: 160.h,
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: AppSpaces.paddingLarge,
                    vertical: AppSpaces.paddingExtraLarge),
                decoration: BoxDecoration(
                  color: _isVisa ? AppColors.darkBlue : AppColors.primaryBlack,
                  borderRadius: BorderRadius.circular(AppSpaces.radiusLarge),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'current_balance'.tr,
                          style: MyTextStyle.normalTitleText(
                              size: 14, color: AppColors.primaryWhite),
                        ),
                        _CardLogo(isVisa: _isVisa),
                      ],
                    ),
                    // SizedBox(height: AppSpaces.heightVerySmall),
                    Text(
                      '\$${card.balance.toStringAsFixed(2).replaceFirst('.', ',')}',
                      style: MyTextStyle.normalTitleText(
                        color: AppColors.primaryWhite,
                        size: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: AppSpaces.heightExtraLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(card.cardNumber,
                            style: MyTextStyle.smallTitleText(
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryWhite)),
                        Text(card.expiryDate,
                            style: MyTextStyle.smallTitleText(
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryWhite)),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: -40,
                top: -65,
                child: Container(
                  width: 160.w,
                  height: 160.h,
                  decoration: BoxDecoration(
                      color: _isVisa
                          ? AppColors.lightBlueBg.withOpacity(0.1)
                          : AppColors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
              Positioned(
                left: -35,
                bottom: -30,
                child: Container(
                  width: 160.w,
                  height: 160.h,
                  decoration: BoxDecoration(
                      color: _isVisa
                          ? AppColors.lightBlueBg.withOpacity(0.1)
                          : AppColors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpaces.heightSmall),
        Row(
          children: [
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                side: BorderSide(color: AppColors.grey300),
                value: isDefault,
                onChanged: onDefaultChanged,
                shape: const CircleBorder(),
                activeColor: AppColors.primary,
              ),
            ),
            Text(
              'use_as_default'.tr,
              style: MyTextStyle.normalTitleText(
                  color: AppColors.grey600, size: 14),
            ),
          ],
        ),
      ],
    );
  }
}

class _CardLogo extends StatelessWidget {
  final bool isVisa;
  const _CardLogo({required this.isVisa});

  @override
  Widget build(BuildContext context) {
    if (isVisa) {
      return SvgPicture.asset(AppIcons.visaDebit);
    }
    return Column(
      children: [
        SvgPicture.asset(AppIcons.mastercard),
        Text(
          'mastercard',
          style: MyTextStyle.normalTitleText(
            color: AppColors.primaryWhite,
            size: 8,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
