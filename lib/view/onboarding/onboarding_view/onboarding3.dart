import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
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
                subTitle(' Lorem Ipsum is simply dummy text of the printing and\n                            typesetting industry.', AppColors.textWhite,FontWeight.normal)
          
                ],
              ),
           Spacer()
              ,CustomeButton(text: 'Get Started',onPressed: (){
               Get.to(()=>SignupScreen());
              },),SizedBox(height: 24,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  subTitle('Don’t have an account? ', AppColors.textWhite,FontWeight.normal),
                  subTitle('Register', AppColors.primaryBlue,FontWeight.bold),
                ],
              ),SizedBox(height: 57,)
            ],
          ),
        )
      ],),
      
    );
  }
}