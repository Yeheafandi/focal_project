import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/helpful_functions/helpful_functions.dart';
import 'package:focal_project/view/auth/auth_controller/auth_controller.dart';
import 'package:focal_project/view/auth/widgets/custome_form_field.dart';
import 'package:focal_project/widgets/custom_text.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({super.key});
final AuthController authController = Get.find<AuthController>();
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
          child: Form(key: authController.formKey3,
            child: Center(
              child: Column(
                
                children: [
                  mainTitle('      Create a\n New Password', AppColors.primaryBlack),
                  SizedBox(height: AppSpaces.heightMedium),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SubTitle(text:  'Enter your new password',color:  AppColors.subtitleColor,
                       fontWeight:FontWeight.normal),
                  ),
                  SizedBox(height: AppSpaces.heightExtraLarge),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 24.h,
                    children: [
                      
                       CustomeFormField(authController: authController.passController,text:  'New Password',color:  AppColors.black87,fontWeight: FontWeight.w600,
                        isPassword: true,
                        validator: (value)=>Validator.validatePassword(value),
                        type: TextInputType.visiblePassword,
                        hintText: 'Enter your password',
                      ),
                      
                       CustomeFormField( text:  'Confirm Password',color:  AppColors.black87,fontWeight:FontWeight.w600
                        ,authController: authController.passConfirmController,
                        isPassword: true,
                        type: TextInputType.visiblePassword,
                        hintText: 'Confirm your password',validator: (value) =>Validator.validatePasswordConfirm(value) ,
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  CustomeButton(
                    text: 'Next',
                    onPressed: () {if (authController.checkMatch()) {
                              Get.dialog(
                        AlertDialog(insetPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 24.0),
                          backgroundColor: AppColors.textWhite,contentPadding: const EdgeInsets.fromLTRB(32,4, 32, 12),
                          content: SubTitle(text: 
                              '   Your password is successfully\n                   created',
                            color:   AppColors.hintColor,
                             fontWeight:  FontWeight.w600),
                          title: Center(
                            child: Column(spacing: AppSpaces.heightMedium,
                              children: [
                                Image.asset(
                                  AppImages.check,
                                  width: 62.w,
                                  height: 62.h,
                                ),
                                Text('Success', style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          actions: [
                           Center(
                             child: ElevatedButton(
                             
                                     onPressed: ()=>null,
                                 style: ElevatedButton.styleFrom(
                                   fixedSize: const Size(123, 46),
                                 backgroundColor: AppColors.primaryBlue,
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(8),
                                   ),
                                   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                 ), child:  Text('Continue',style: const TextStyle(fontSize: 16,color:AppColors.textWhite),)),
                           )
                          ],
                        ),
                      );
                    }
                     
                        
                   
                         
                      
                     
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
