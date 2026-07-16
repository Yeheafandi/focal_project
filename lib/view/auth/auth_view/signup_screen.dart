
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/view/auth/auth_controller/auth_controller.dart';
import 'package:focal_project/view/auth/widgets/custome_form_field.dart';
import 'package:focal_project/view/auth/widgets/custome_icon.dart';
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
      body: Column(spacing: 32,children: [mainTitle('Create Account', AppColors.titleColor), subTitle('Lorem ipsum dolor sit amet, consectetur',AppColors.subtitleColor,FontWeight.bold),
      Padding(
        padding: const EdgeInsets.all(AppSpaces.paddingExtraLarge),
        child: Column(spacing:8, crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[subTitle('Full Name', AppColors.titleColor,FontWeight.bold),
        CustomeFormField(type: TextInputType.text, hintText: 'Enter your  name'),
        subTitle('E-mail', AppColors.titleColor,FontWeight.bold),
        CustomeFormField( hintText: 'Enter your email',type: TextInputType.emailAddress),
        subTitle('Password', AppColors.titleColor,FontWeight.bold),
        CustomeFormField(isPassword:true,type: TextInputType.visiblePassword, hintText: 'Enter your password'),
        
            SizedBox(height: 32,),Align(alignment: Alignment.center,child:ElevatedButton(

        onPressed: (){},
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(327, 58),
    backgroundColor: AppColors.primaryBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ), child:  Text('Create An Account',style: const TextStyle(fontSize: 16,color:AppColors.textWhite),))),
         SizedBox(height: 24,), Align(alignment: Alignment.center,child: Column(
            children: [
             Image.asset(AppImages.signinWith,width: 239,height: 22,),SizedBox(height: AppSpaces.heightLarge,),
              Row(spacing: 48,mainAxisAlignment: MainAxisAlignment.center,children: [CustomeIcon(AppImages.google),CustomeIcon(AppImages.apple),
                CustomeIcon(AppImages.facebook)
              ],),
             
            ],
          )),
        ],),
      ), Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center,spacing: 3, children: [subTitle('By signing up you agree to our', AppColors.grey, FontWeight.normal),InkWell(child: subTitle('Terms', AppColors.black87, FontWeight.normal),)],),
                Row(mainAxisAlignment:MainAxisAlignment.center,spacing: 3,children: [subTitle('and', AppColors.grey, FontWeight.normal),InkWell(child: subTitle('Conditions of Use', AppColors.black87, FontWeight.normal),)],)],
              )],)
    );
  }
}