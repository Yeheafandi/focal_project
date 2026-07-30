import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/helpful_functions/helpful_functions.dart';
import 'package:focal_project/view/auth/auth_controller/auth_controller.dart';
import 'package:focal_project/view/auth/widgets/custome_form_field.dart';
import 'package:focal_project/view/auth/widgets/custome_icon.dart';
import 'package:focal_project/widgets/custom_text.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
              authController.clearFields() ;
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(spacing: 8,
            
            children: [mainTitle('Create Account', AppColors.titleColor),
          SubTitle(text: 'Lorem ipsum dolor sit amet, consectetur',
             color:AppColors.subtitleColor,fontWeight:FontWeight.w400),
            Padding(
            padding: EdgeInsets.all(AppSpaces.paddingExtraLarge),
            child: Form(
              key: authController.formKey,
              child: Column(
                spacing: 8.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  CustomeFormField(text:  'Full Name',color:  AppColors.titleColor,fontWeight:FontWeight.w600,
                      authController: authController.userController,
                      validator: (val) => Validator.validateUserName(val),
                      type: TextInputType.text,
                      hintText: 'Enter your name'),
                  
                  CustomeFormField(text:'E-mail',color:AppColors.titleColor,fontWeight:FontWeight.w600,
                      authController: authController.eController,
                      validator: (val) => Validator.validateEmail(val),
                      hintText: 'Enter your email',
                      type: TextInputType.emailAddress),
                  
                  CustomeFormField(text: 'Password',color:AppColors.titleColor,fontWeight:FontWeight.w600,
                      authController: authController.passController,
                      validator: (val) => Validator.validatePassword(val),
                      isPassword: true,
                      type: TextInputType.visiblePassword,
                      hintText: 'Enter your password'),
                  SizedBox(
                    height: 32.h,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: CustomeButton(
                        text: 'Create An Account',
                        onPressed: () {
                          if (authController.formKey.currentState!
                              .validate()) {
                            Get.toNamed(Routes.otpscreen);
                          }
                        },
                      )),
                  SizedBox(
                    height: 24.h,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Image.asset(
                            AppImages.signinWith,
                            width: 239.w,
                            height: 22.h,
                          ),
                          SizedBox(
                            height: AppSpaces.heightLarge,
                          ),
                          Row(
                            spacing: 48.w,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomeIcon(AppImages.google),
                              CustomeIcon(AppImages.apple),
                              CustomeIcon(AppImages.facebook)
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
             SizedBox(height: 34,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3.w,
                    children: [
                      SubTitle(text: 'By signing up you agree to our',color:  AppColors.grey,
                         fontWeight: FontWeight.w400),
                      InkWell(
                        child: SubTitle(
                           text:  'Terms',color:  AppColors.black87,fontWeight:  FontWeight.w400),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3.w,
                    children: [
                      SubTitle(text: 'and',color:  AppColors.grey,fontWeight: FontWeight.w400),
                      InkWell(
                        child: SubTitle(text:  'Conditions of Use',color:  AppColors.black87,
                           fontWeight:FontWeight.w400),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}

 