import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class PaymentCompleteView extends StatelessWidget {
  const PaymentCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryBlack),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.primaryBlack),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpaces.paddingLarge),
        child: Column(
          children: [
            SizedBox(height: 72.h),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppIcons.illustration),
                  Text(
                    'Payment Complete',
                    textAlign: TextAlign.center,
                    style: MyTextStyle.normalTitleText(
                      size: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: AppSpaces.heightSmall),
                  Text(
                    'Etiam cras nec metus laoreet. Faucibus iaculis cras ut posuere.',
                    textAlign: TextAlign.center,
                    style: MyTextStyle.smallTitleText(
                      color: AppColors.grey500,
                      fontWeight: FontWeight.w400,
                      size: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
