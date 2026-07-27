import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class PaymentMethodCard extends StatelessWidget {
  final String methodName;
  final String accountNumber;
  final VoidCallback? onEdit;

  const PaymentMethodCard({
    super.key,
    required this.methodName,
    required this.accountNumber,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpaces.paddingSmall,
        vertical: AppSpaces.paddingSmall - 1,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(AppSpaces.radiusLarge),
        border: Border.all(color: AppColors.grey300),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSpaces.paddingMedium),
            decoration: BoxDecoration(
              color: AppColors.grey100,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AppIcons.emptyWallet),
          ),
          SizedBox(width: AppSpaces.widthVerySmall + 1),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  methodName,
                  style: MyTextStyle.normalTitleText(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: AppSpaces.heightVerySmall),
                Text(
                  accountNumber,
                  style: MyTextStyle.smallTitleText(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,

                    size: 14,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onEdit,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpaces.paddingNormal - 2,
                vertical: AppSpaces.paddingSmall,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppSpaces.radiusExtraExtraLarge28,
                ),
                border: Border.all(color: AppColors.primary),
              ),
              child: Text(
                'Edit',
                style: MyTextStyle.smallTitleText(
                  color: AppColors.primary,
                  size: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
