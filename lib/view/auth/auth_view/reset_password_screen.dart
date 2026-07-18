import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/view/auth/widgets/custome_form_field.dart';
import 'package:focal_project/widgets/custom_text.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( leading: IconButton(onPressed: Get.back, icon: Icon(Icons.arrow_back)),),
      body: Padding(
        padding: const EdgeInsets.all(AppSpaces.paddingExtraLarge32),
        child: Center(
          child: Column(spacing: 8,
            children: [
              mainTitle('       Create a\n New Password',AppColors.primaryBlack),
            SizedBox(height: AppSpaces.heightMedium,),
              FittedBox(fit: BoxFit.scaleDown, child: subTitle('Enter your new password', AppColors.grey, FontWeight.normal)),
                  SizedBox(height: AppSpaces.heightExtraLarge,) , 
            Column(crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,  children: [subTitle('New Password', AppColors.black87, FontWeight.bold),
               CustomeFormField(isPassword:true,type: TextInputType.visiblePassword, hintText: 'Enter your password'),
               subTitle('Confirm Password', AppColors.black87, FontWeight.bold),
               CustomeFormField(isPassword:true,type: TextInputType.visiblePassword, hintText: 'Confirm your password'),],
            ),
            SizedBox(height: 40,),
           
            CustomeButton(text: 'Next',onPressed: () {Get.dialog(AlertDialog(backgroundColor: AppColors.textWhite,content: subTitle('    Your password is succesfully\n                    created', AppColors.hintColor, FontWeight.normal),title: Center(child: Column(
              children: [Image.asset(AppImages.check,width: 62,height: 62,),
                Text('Success'),
              ],
            )),actions: [CustomeButton(text: 'Continue',onPressed: () {
              
            },)],));},),]))));
  }
}