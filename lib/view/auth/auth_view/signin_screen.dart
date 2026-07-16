import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/view/auth/widgets/custome_form_field.dart';
import 'package:focal_project/widgets/custom_text.dart';
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
                  Expanded(child: GetBuilder<AuthController>(builder: (authController)=> CheckboxListTile(activeColor: Colors.blue,controlAffinity: ListTileControlAffinity.leading,title: Text('Remember Me'),value: authController.isChecked, onChanged: (value){authController.toggleCheckbox();},))),
                InkWell(child: subTitle('Forgot Password  ', Colors.red, FontWeight.normal),)
                ],
              )

             , SizedBox(height: 32,),Align(alignment: Alignment.center,child:ElevatedButton(

                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(327, 58),
                    backgroundColor: AppColors.primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ), child:  Text('Sign In',style: const TextStyle(fontSize: 16,color:AppColors.textWhite),))),
              Row(spacing: 3,mainAxisAlignment: MainAxisAlignment.center,children: [subTitle('Don’t have an account? ', AppColors.grey, FontWeight.normal),InkWell(child: subTitle('Sign Up', AppColors.primaryBlue, FontWeight.bold),)],),
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