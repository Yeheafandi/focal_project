import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get.dart';

class PaymentMethodModal extends StatefulWidget {
  final VoidCallback onConformAndPay;
  const PaymentMethodModal({super.key, required this.onConformAndPay});

  @override
  State<PaymentMethodModal> createState() => _PaymentMethodModalState();
}

class _PaymentMethodModalState extends State<PaymentMethodModal> {
  String selected = 'Master Card';

  Widget _methodTile(
    String label,
    Widget? leading,
    bool isSelected, {
    // required Function(String val) onTab,
    bool hasCheck = true,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: hasCheck
          ? EdgeInsets.all(AppSpaces.paddingLarge - 2)
          : EdgeInsets.fromLTRB(
              AppSpaces.paddingMedium,
              AppSpaces.paddingLarge,
              AppSpaces.paddingMedium,
              AppSpaces.paddingNormal,
            ),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(AppSpaces.radiusLarge),
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
          leading ?? SizedBox.shrink(),
          if (leading != null) SizedBox(width: AppSpaces.widthMedium),
          Expanded(
            child: Text(
              label,
              style: MyTextStyle.normalTitleText(
                color: AppColors.primaryBlack,
                size: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          hasCheck
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = label;
                    });
                  },
                  child: Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.primaryWhite,
                      borderRadius: BorderRadius.circular(6),
                      border: !isSelected
                          ? Border.all(color: AppColors.grey400, width: 1.5)
                          : null,
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.white, size: 20)
                        : null,
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpaces.paddingExtraLarge,
        AppSpaces.paddingMedium,
        AppSpaces.paddingExtraLarge,
        AppSpaces.paddingExtraLarge,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpaces.radiusExtraExtraLarge28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: AppColors.grey300,
              borderRadius: BorderRadius.circular(AppSpaces.radiusSmall),
            ),
          ),
          SizedBox(height: AppSpaces.heightLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Method',
                style: MyTextStyle.normalTitleText(
                  color: AppColors.primaryBlack,
                  size: 20,
                ),
              ),
              GestureDetector(
                onTap: Get.back,
                child: Container(
                  padding: EdgeInsets.all(AppSpaces.paddingSmall),
                  child: SvgPicture.asset(AppIcons.close),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpaces.heightExtraLarge),
          _methodTile(
            'Master Card',
            SvgPicture.asset(AppIcons.mastercard),
            selected == 'Master Card',
          ),
          _methodTile(
            'Visa',
            SvgPicture.asset(AppIcons.visaLogo),
            selected == 'Visa',
          ),
          _methodTile(
            'Add Debit Card',
            GestureDetector(child: SvgPicture.asset(AppIcons.iconAdd)),

            false,
            hasCheck: false,
          ),
          SizedBox(height: AppSpaces.heightLarge),
          SizedBox(
            width: double.infinity,
            child: CustomeButton(
              text: "Confirm and Pay",
              onPressed: widget.onConformAndPay,
            ),
          ),

          SizedBox(height: AppSpaces.heightSmall),
        ],
      ),
    );
  }
}
