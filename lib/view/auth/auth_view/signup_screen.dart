
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/view/auth/auth_controller/auth_controller.dart';
import 'package:focal_project/view/auth/widgets/custome_form_field.dart';
import 'package:focal_project/widgets/custom_text.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
final bool isPassword = true;
  final AuthController  authController=Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.arrow_back),
          ),

      ),
      body: Column(spacing: 32,children: [mainTitle('Create Account'), subTitle('Lorem ipsum dolor sit amet, consectetur',AppColors.subtitleColor),
      Column(spacing:8, crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[subTitle('Full Name', AppColors.titleColor),
      CustomeFormField(type: TextInputType.text, hintText: 'Enter your  name'),
      subTitle('E-mail', AppColors.titleColor),
      CustomeFormField( hintText: 'Enter your email',type: TextInputType.emailAddress),
      subTitle('Password', AppColors.titleColor),
      CustomeFormField(isPassword:true,type: TextInputType.visiblePassword, hintText: 'Enter your password'),

    Align(alignment: Alignment.center,child: CustomeButton(text: 'Create An Account ')),
        Align(alignment: Alignment.center,child: Column(
          children: [
            subTitle('Or Sign In With',AppColors.hintColor),
            Row(spacing: 50,mainAxisAlignment: MainAxisAlignment.center,children: [Image.asset(AppImages.google),
              Image.asset(AppImages.apple),
              Image.asset(AppImages.facebook)
            ],)
          ],
        )),
      ],)],)
    );
  }
}