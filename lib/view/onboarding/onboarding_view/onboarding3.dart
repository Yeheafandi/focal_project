import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/view/auth/auth_view/signin_screen.dart';
import 'package:focal_project/view/auth/auth_view/signup_screen.dart';
import 'package:focal_project/view/onboarding/onboarding_controller.dart/onboarding_controller.dart';
import 'package:focal_project/widgets/custom_text.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(AppImages.onBoarding3,fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
        Container(width: double.infinity,height: double.infinity,decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,colors: [Color(0x110C1D00),Colors.black.withValues(alpha: 0.8)])),)
            ,Align(alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 497,), Spacer(),
              Column(spacing: 8,
                children: [
                  mainTitle( 'Discover Your Dream\n  Hotel, Effortlessly', AppColors.textWhite),
                SubTitle(text:  ' Lorem Ipsum is simply dummy text of the printing and\n                            typesetting industry.',color:AppColors.boardingsub,fontWeight:FontWeight.w400)
          
                ],
              ),
           Spacer()
              ,CustomeButton(text: 'Get Started',onPressed: (){
               Get.toNamed(Routes.signinscreen);
              },),SizedBox(height: 24,),
              Row(mainAxisAlignment: MainAxisAlignment.center,spacing: 3,
                children: [
                  SubTitle(text:  'Don’t have an account? ',color:  AppColors.textWhite,fontWeight:  FontWeight.normal,size: 16,),
                  InkWell(onTap: () => Get.toNamed(Routes.signupscreen),child: SubTitle(text:'Register',color:AppColors.primaryBlue,fontWeight:FontWeight.w400)),
                ],
              ),SizedBox(height: 57,)
            ],
          ),
        )
      ],),
      
    );
  }
}