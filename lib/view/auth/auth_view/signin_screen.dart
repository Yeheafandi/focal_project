import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/helpful_functions/helpful_functions.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/view/auth/widgets/custome_form_field.dart';
import 'package:focal_project/widgets/custom_text.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get.dart';

import '../auth_controller/auth_controller.dart';
import '../widgets/custome_icon.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 24.sp,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            spacing: 32.h,
            children: [
              mainTitle('Let’s Sign you in', AppColors.titleColor),
              subTitle('Lorem ipsum dolor sit amet, consectetur',
                  AppColors.subtitleColor, FontWeight.bold),
              Padding(
                padding: EdgeInsets.all(AppSpaces.paddingExtraLarge.r),
                child: Form(
                  key: authController.formKey2,
                  child: Column(
                    spacing: 8.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      subTitle('E-mail', AppColors.titleColor, FontWeight.bold),
                      CustomeFormField(
                          validator: (value) => Validator.validateEmail(value),
                          authController: authController.eController,
                          hintText: 'Enter your email',
                          type: TextInputType.emailAddress),
                      subTitle('Password', AppColors.titleColor, FontWeight.bold),
                      CustomeFormField(
                          authController: authController.passController,
                          validator: (value) => Validator.validatePassword(value),
                          isPassword: true,
                          type: TextInputType.visiblePassword,
                          hintText: 'Enter your password'),
                      Row(
                        children: [
                          Expanded(
                              child: GetBuilder<AuthController>(
                                  builder: (authController) => CheckboxListTile(
                                      checkboxScaleFactor: 1.2.r,
                                      side: BorderSide(
                                          width: 1.w, color: AppColors.grey),
                                      checkboxShape: const CircleBorder(),
                                      activeColor: Colors.blue,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: subTitle('Remember Me',
                                          AppColors.hintColor, FontWeight.normal),
                                      value: authController.isChecked,
                                      onChanged: (value) {
                                        authController.toggleCheckbox();
                                      }))),
                          InkWell(
                            onTap: () => Get.toNamed(Routes.resetrequest),
                            child: subTitle('Forgot Password  ', Colors.red,
                                FontWeight.normal),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: CustomeButton(
                              text: 'Sign In',
                              onPressed: () {
                                if (authController.formKey2.currentState!
                                    .validate()) {
                                  Get.toNamed(Routes.homeview);
                                }
                              })),
                      Row(
                        spacing: 3.w,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          subTitle('Don’t have an account? ', AppColors.grey,
                              FontWeight.normal),
                          InkWell(
                            onTap: () => Get.toNamed(Routes.signupscreen),
                            child: subTitle('Sign Up', AppColors.primaryBlue,
                                FontWeight.bold),
                          )
                        ],
                      ),
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
                                height: AppSpaces.heightLarge.h,
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3.w,
                    children: [
                      subTitle('By signing up you agree to our', AppColors.grey,
                          FontWeight.normal),
                      InkWell(
                        child: subTitle(
                            'Terms', AppColors.black87, FontWeight.normal),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3.w,
                    children: [
                      subTitle('and', AppColors.grey, FontWeight.normal),
                      InkWell(
                        child: subTitle('Conditions of Use', AppColors.black87,
                            FontWeight.normal),
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
