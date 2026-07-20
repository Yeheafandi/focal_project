import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
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
            SizedBox(height: AppSpaces.heightExtraLarge * 2),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 320,
                          decoration: BoxDecoration(
                            color: AppColors.primaryWhite,
                            borderRadius: BorderRadius.circular(
                              AppSpaces.radiusExtraExtraLarge28,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryBlack.withOpacity(0.08),
                                blurRadius: 24,
                                offset: const Offset(0, 12),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 28,
                          child: Container(
                            width: 272,
                            height: 212,
                            decoration: BoxDecoration(
                              color: AppColors.lightBlueBg,
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 20,
                                  top: 22,
                                  child: Container(
                                    width: 64,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE9F6EC),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Color(0xFF2CAF63),
                                      size: 32,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 16,
                                  top: 26,
                                  child: Container(
                                    width: 44,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryWhite,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 110,
                                  child: Container(
                                    width: 160,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 142,
                                  child: Container(
                                    width: 212,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryBlue.withOpacity(
                                        0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 172,
                                  child: Container(
                                    width: 120,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryWhite.withOpacity(
                                        0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 28,
                          child: Container(
                            width: 130,
                            height: 14,
                            decoration: BoxDecoration(
                              color: AppColors.grey100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpaces.heightExtraLarge),
                    Text(
                      'Payment Complete',
                      textAlign: TextAlign.center,
                      style: MyTextStyle.normalTitleText(
                        size: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: AppSpaces.heightLarge),
                    Text(
                      'Etiam cras nec metus laoreet. Faucibus iaculis cras ut posuere.',
                      textAlign: TextAlign.center,
                      style: MyTextStyle.smallTitleText(
                        color: AppColors.grey,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
