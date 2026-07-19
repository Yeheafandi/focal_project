import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class PaymentMethodModal extends StatefulWidget {
  const PaymentMethodModal({super.key});

  @override
  State<PaymentMethodModal> createState() => _PaymentMethodModalState();
}

class _PaymentMethodModalState extends State<PaymentMethodModal> {
  String selected = 'Master Card';

  Widget _methodTile(String label, Widget? leading, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (leading != null) leading,
          if (leading != null) SizedBox(width: AppSpaces.widthMedium),
          Expanded(
            child: Text(
              label,
              style: MyTextStyle.normalTitleText(
                color: AppColors.primaryBlack,
                size: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.primaryWhite,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.grey100),
            ),
            child: isSelected
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : null,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Method',
                  style: MyTextStyle.normalTitleText(
                    color: AppColors.primaryBlack,
                    size: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            SizedBox(height: AppSpaces.heightMedium),
            _methodTile(
              'Master Card',
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(width: 6),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              selected == 'Master Card',
            ),
            _methodTile(
              'Visa',
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text(
                  'VISA',
                  style: MyTextStyle.normalTitleText(
                    color: AppColors.primary,
                    size: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              selected == 'Visa',
            ),
            _methodTile(
              'Add Debit Card',
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.grey100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.add, color: AppColors.primary),
              ),
              false,
            ),
            SizedBox(height: AppSpaces.heightLarge),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Confirm and Pay',
                  style: MyTextStyle.normalTitleText(
                    color: AppColors.primaryWhite,
                    size: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSpaces.heightSmall),
          ],
        ),
      ),
    );
  }
}
