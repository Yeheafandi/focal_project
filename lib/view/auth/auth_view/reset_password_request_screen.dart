import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/view/auth/widgets/custome_form_field.dart';
import 'package:focal_project/widgets/custom_text.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get.dart';


class ResetPasswordRequestScreen extends StatelessWidget {
  const ResetPasswordRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar( leading: IconButton(onPressed: Get.back, icon: Icon(Icons.arrow_back)),),
      body: Padding(
        padding: const EdgeInsets.all(AppSpaces.paddingExtraLarge32),
        child: Center(
          child: Column(spacing: 8,
            children: [
              mainTitle('Forgot Password',AppColors.primaryBlack),
            SizedBox(height: AppSpaces.heightMedium,),
              FittedBox(fit: BoxFit.scaleDown, child: subTitle('Recover your account password', AppColors.grey, FontWeight.normal)),
                  SizedBox(height: AppSpaces.heightExtraLarge,) , 
            Column(crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,  children: [subTitle('Email', AppColors.black87, FontWeight.bold),
              CustomeFormField(type: TextInputType.emailAddress, hintText: 'Enter your email')],
            ),
            SizedBox(height: 40,),
           
           CustomeButton(text: 'Next',onPressed: () => Get.toNamed(Routes.resetpassword),)
            ,]))));
  }
}