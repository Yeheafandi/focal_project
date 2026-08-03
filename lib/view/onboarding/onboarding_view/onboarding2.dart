import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/view/onboarding/onboarding_controller.dart/onboarding_controller.dart';
import 'package:focal_project/widgets/custom_text.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get.dart';

import 'onboarding3.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(AppImages.onBoarding2,fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
        Container(width: double.infinity,height: double.infinity,decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,colors: [Color(0x110C1D00),Colors.black.withValues(alpha: 0.8)])),)
        ,Align(alignment: Alignment.center,
          child: Column(spacing: 5,mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 450,), Spacer(),
              Column(spacing: 8,
                children: [
                  mainTitle( ' Book with Ease, Stay\n          with Style ', AppColors.textWhite),
               SubTitle(text:  '   Semper in cursus magna et eu varius\nnunc adipiscing. Elementum justo,laoreet \n                       id sem . ',color:AppColors.boardingsub,fontWeight:FontWeight.w400)
          
                ],
              ),
           Spacer()
              ,CustomeButton(text: 'Continue',onPressed: (){
              Get.offNamed(Routes.onboarding3);
              },),SizedBox(height: 55,)
      ],),
    )]));
  }
}