import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';

import 'package:focal_project/view/onboarding/onboarding_controller.dart/onboarding_controller.dart';
import 'package:focal_project/widgets/custom_text.dart';
import 'package:focal_project/widgets/custome_button.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(AppImages.onBoarding1,fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
        Container(width: double.infinity,height: double.infinity,decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,colors: [Color(0x110C1D00),Colors.black.withValues(alpha: 0.8)])),)
        ,Align(alignment: Alignment.center,
          child: Column(spacing: 5,mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 450,), Spacer(),
              Column(spacing: 8,
                children: [
                  mainTitle( ' Luxury and Comfort,\n     Just a Tap Away ', AppColors.textWhite),
                 SubTitle(text: '    Semper in cursus magna et eu varius\nnunc adipiscing. Elementum justo,laoreet \n                       id sem . ',color:AppColors.boardingsub,fontWeight: FontWeight.w400)
                ],
              ),
         
           Spacer()
              ,CustomeButton(text: 'Continue',onPressed: (){
                OnboardingController.pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
              },)
              ,SizedBox(height: 55,)
            ],
          ),
        )
      ],),
    );
  }
}