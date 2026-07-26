
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/model/payment_card_model.dart';

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
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(AppSpaces.paddingLarge),
          decoration: BoxDecoration(
            gradient: _isVisa
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.primaryBlue, AppColors.primary],
                  )
                : null,
            color: _isVisa ? null : AppColors.primaryBlack,
            borderRadius: BorderRadius.circular(AppSpaces.radiusLarge),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Current Balance',
                    style: MyTextStyle.smallTitleText(color: AppColors.grey300),
                  ),
                  _CardLogo(isVisa: _isVisa),
                ],
              ),
              SizedBox(height: AppSpaces.heightVerySmall),
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
                  Text(card.cardNumber, style: MyTextStyle.smallTitleText(color: AppColors.grey300)),
                  Text(card.expiryDate, style: MyTextStyle.smallTitleText(color: AppColors.grey300)),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpaces.heightSmall),
        Row(
          children: [
            Checkbox(
              value: isDefault,
              onChanged: onDefaultChanged,
              shape: const CircleBorder(),
              activeColor: AppColors.primary,
            ),
            Text(
              'Use as default payment method',
              style: MyTextStyle.smallTitleText(color: AppColors.titleColor, size: 13),
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
      return Text(
        'VISA',
        style: MyTextStyle.normalTitleText(
          color: AppColors.primaryWhite,
          size: 16,
          fontWeight: FontWeight.bold,
        ).copyWith(fontStyle: FontStyle.italic),
      );
    }
    return SizedBox(
      width: 36,
      height: 22,
      child: Stack(
        children: [
          Positioned(left: 0, child: CircleAvatar(radius: 11, backgroundColor: AppColors.red400)),
          Positioned(left: 14, child: CircleAvatar(radius: 11, backgroundColor: AppColors.amber)),
        ],
      ),
    );
  }
}