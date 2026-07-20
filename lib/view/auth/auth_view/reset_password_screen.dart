import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/view/auth/widgets/custome_form_field.dart';
import 'package:focal_project/widgets/custom_text.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(Icons.arrow_back, size: 24.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSpaces.paddingExtraLarge32.r),
          child: Center(
            child: Column(
              spacing: 8.h,
              children: [
                mainTitle('      Create a\n New Password', AppColors.primaryBlack),
                SizedBox(height: AppSpaces.heightMedium.h),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: subTitle('Enter your new password', AppColors.grey,
                      FontWeight.normal),
                ),
                SizedBox(height: AppSpaces.heightExtraLarge.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8.h,
                  children: [
                    subTitle('New Password', AppColors.black87, FontWeight.bold),
                    const CustomeFormField(
                      isPassword: true,
                      type: TextInputType.visiblePassword,
                      hintText: 'Enter your password',
                    ),
                    subTitle(
                        'Confirm Password', AppColors.black87, FontWeight.bold),
                    const CustomeFormField(
                      isPassword: true,
                      type: TextInputType.visiblePassword,
                      hintText: 'Confirm your password',
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                CustomeButton(
                  text: 'Next',
                  onPressed: () {
                    Get.dialog(
                      AlertDialog(
                        backgroundColor: AppColors.textWhite,
                        content: subTitle(
                            'Your password is successfully\ncreated',
                            AppColors.hintColor,
                            FontWeight.normal),
                        title: Center(
                          child: Column(
                            children: [
                              Image.asset(
                                AppImages.check,
                                width: 62.w,
                                height: 62.h,
                              ),
                              Text('Success', style: TextStyle(fontSize: 18.sp)),
                            ],
                          ),
                        ),
                        actions: [
                          CustomeButton(
                            text: 'Continue',
                            onPressed: () {
                              Get.back();
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
