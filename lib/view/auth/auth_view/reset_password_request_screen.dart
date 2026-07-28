import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/helpful_functions/helpful_functions.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/view/auth/auth_controller/auth_controller.dart';
import 'package:focal_project/view/auth/widgets/custome_form_field.dart';
import 'package:focal_project/widgets/custom_text.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get.dart';


class ResetPasswordRequestScreen extends StatelessWidget {
   ResetPasswordRequestScreen({super.key});
final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar( leading: IconButton(onPressed: Get.back, icon: Icon(Icons.arrow_back)),),
      body: Padding(
        padding:  EdgeInsets.all(AppSpaces.paddingExtraLarge32),
        child: Form(key: authController.formKey,
          child: Center(
            child: Column(
              children: [
                mainTitle('Forgot Password',AppColors.primaryBlack),
              SizedBox(height: AppSpaces.heightMedium,),
                FittedBox(fit: BoxFit.scaleDown, child: SubTitle(text:  'Recover your account password',color:AppColors.subtitleColor,fontWeight:FontWeight.normal)),
                    SizedBox(height: AppSpaces.heightExtraLarge,) , 
              Column(crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,  children: [SubTitle(text: 'E-mail',color:AppColors.black87,fontWeight:FontWeight.bold),
                CustomeFormField(validator: (value) =>Validator.validateEmail(value) 
                ,authController: authController.eController,type: TextInputType.emailAddress, hintText: 'Enter your email')],
              ),
              SizedBox(height: 40,),
             
             CustomeButton(text: 'Next',onPressed: () {
               if (authController.formKey.currentState!
                                    .validate()) {
                                  Get.toNamed(Routes.resetpassword);
                                }
              })
              ,])),
        )));
  }
}