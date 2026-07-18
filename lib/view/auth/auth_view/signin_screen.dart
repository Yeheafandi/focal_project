import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/view/auth/widgets/custome_form_field.dart';
import 'package:focal_project/widgets/custom_text.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get.dart';


import '../auth_controller/auth_controller.dart';
import '../widgets/custome_icon.dart';

class SigninScreen extends StatefulWidget {
   SigninScreen({super.key});
final AuthController authController=Get.put(AuthController());
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),

        ),
        body: Column(spacing: 32,children: [mainTitle('Let’s Sign you in', AppColors.titleColor), subTitle('Lorem ipsum dolor sit amet, consectetur',AppColors.subtitleColor,FontWeight.bold),
          Padding(
            padding: const EdgeInsets.all(AppSpaces.paddingExtraLarge),
            child: Column(spacing:8, crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[

              subTitle('E-mail', AppColors.titleColor,FontWeight.bold),
              CustomeFormField( hintText: 'Enter your email',type: TextInputType.emailAddress),
              subTitle('Password', AppColors.titleColor,FontWeight.bold),
              CustomeFormField(isPassword:true,type: TextInputType.visiblePassword, hintText: 'Enter your password'),
              Row(
                children: [
                  Expanded(child: GetBuilder<AuthController>(builder: (authController)=> CheckboxListTile(checkboxScaleFactor: 1.5,side: BorderSide(width:1,color: AppColors.grey ),checkboxShape: const CircleBorder(), activeColor: Colors.blue,controlAffinity: ListTileControlAffinity.leading,title: subTitle('Remember Me',AppColors.hintColor,FontWeight.normal),value: authController.isChecked, onChanged: (value){authController.toggleCheckbox();},))),
                InkWell(onTap: () =>  Get.toNamed(Routes.resetrequest),child: subTitle('Forgot Password  ', Colors.red, FontWeight.normal),)
                ],
              )

             , SizedBox(height: 32,),Align(alignment: Alignment.center,child:CustomeButton(text: 'Sign In', onPressed: () => Get.toNamed(Routes.homeview),)
                  ),
              Row(spacing: 3,mainAxisAlignment: MainAxisAlignment.center,children: [subTitle('Don’t have an account? ', AppColors.grey, FontWeight.normal),InkWell(onTap:()=> Get.toNamed(Routes.signupscreen),child: subTitle('Sign Up', AppColors.primaryBlue, FontWeight.bold),)],),
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
//