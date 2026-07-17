import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
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
      padding: const EdgeInsets.all(AppSpaces.paddingNormal),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
        border: Border.all(color: AppColors.grey300),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.grey100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.account_balance_wallet_outlined,
              color: AppColors.grey600,
              size: 22,
            ),
          ),
          const SizedBox(width: AppSpaces.widthMedium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  methodName,
                  style: MyTextStyle.normalTitleText(
                    size: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpaces.heightVerySmall),
                Text(
                  accountNumber,
                  style: MyTextStyle.smallTitleText(
                    color: AppColors.grey,
                    size: 13,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onEdit,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpaces.paddingNormal,
                vertical: AppSpaces.paddingSmall,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSpaces.radiusSmall),
                border: Border.all(color: AppColors.primary),
              ),
              child: Text(
                'Edit',
                style: MyTextStyle.smallTitleText(
                  color: AppColors.primary,
                  size: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
