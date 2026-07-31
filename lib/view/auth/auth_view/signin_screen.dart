import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/helpful_functions/helpful_functions.dart';
import 'package:focal_project/core/services/my_services.dart';
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
  final serv =Get.find<MyServices>();
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
            spacing: 30,
            children: [ Column(spacing: 8,
              children: [
                mainTitle('Let’s Sign you in', AppColors.titleColor),
                SubTitle(text: 'Lorem ipsum dolor sit amet, consectetur',
                  color:  AppColors.subtitleColor,fontWeight:  FontWeight.w400),
              ],
            ),
              
              Column(
                children: [
               Padding(
                padding: EdgeInsets.all(AppSpaces.paddingExtraLarge),
                child: Form(
                  key: authController.formKey2,
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      CustomeFormField(text: 'Email Address',color:  AppColors.titleColor,fontWeight:  FontWeight.w600,
                          validator: (value) => Validator.validateEmail(value),
                          authController: authController.eController,
                          hintText: 'Enter your email address',
                          type: TextInputType.emailAddress),
                      
                      CustomeFormField(text: 'Password',color:  AppColors.titleColor,fontWeight:  FontWeight.w600,
                          authController: authController.passController,
                          validator: (value) => Validator.validatePassword(value),
                          isPassword: true,
                          type: TextInputType.visiblePassword,
                          hintText: 'Enter your password'),
                      Row(
                        children: [
                          Expanded(
                            child: Obx(() => CheckboxListTile(
                                checkboxScaleFactor: 1.2.r,
                                side: BorderSide(
                                    width: 1.w, color: AppColors.boardingsub),
                                checkboxShape: const CircleBorder(),
                                activeColor: Colors.blue,
                                controlAffinity:
                                ListTileControlAffinity.leading,
                                title: SubTitle(text: 'Remember Me',
                                    color:  AppColors.hintColor,fontWeight:  FontWeight.w400),
                                value: serv.isRemembered.value,
                                onChanged: (value) async{
                                  await serv.setRemember(value!);
                                  authController.toggleCheckbox();
                                })),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.resetrequest);
                              authController.eController.clear();},
                            child: SubTitle(text:  'Forgot Password  ',color:  AppColors.red,
                                fontWeight:  FontWeight.w400),
                          )
                        ],
                      ),
                    
                    ],
                  ),
                ),
              ),  
                      CustomeButton(
                          text: 'Sign In',
                          onPressed: () {
                            if (authController.formKey2.currentState!
                                .validate()) {
                              Get.toNamed(Routes.navigationMenuView);
                            }
                          }),
                              SizedBox(height:AppSpaces.heightLarge ,),
                      Row(
                        spacing: 3.w,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SubTitle( text: 'Don’t have an account? ',color:  AppColors.grey,
                              fontWeight:  FontWeight.w600),
                          InkWell(
                            onTap: () { Get.toNamed(Routes.signupscreen);
                            authController.clearFields();},
                            child: SubTitle(text:  'Sign Up',color:  AppColors.primaryBlue,
                                fontWeight:  FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24,
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
                                spacing: 24,
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
        
              SizedBox(height: 46,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3.w,
                    children: [
                      SubTitle(text:  'By signing up you agree to our',color:  AppColors.grey,
                          fontWeight:  FontWeight.normal),
                      InkWell(
                        child: SubTitle(text: 'Terms',color:  AppColors.black87,fontWeight:  FontWeight.normal),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3.w,
                    children: [
                      SubTitle(text:  'and',color:  AppColors.grey,fontWeight:  FontWeight.normal),
                      InkWell(
                        child: SubTitle(text:  'Conditions of Use',color:  AppColors.black87,
                            fontWeight:  FontWeight.normal),
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