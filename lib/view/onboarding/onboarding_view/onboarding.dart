import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/view/onboarding/onboarding_controller.dart/onboarding_controller.dart';
import 'package:focal_project/view/onboarding/onboarding_view/onboarding1.dart';
import 'package:focal_project/view/onboarding/onboarding_view/onboarding2.dart';
import 'package:focal_project/view/onboarding/onboarding_view/onboarding3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
       return Scaffold(
        body:Stack(
          children: [PageView(controller: OnboardingController.pageController,
            children: [
              Onboarding1(),
              Onboarding2(),
             
            ],
            
          ), Positioned(bottom: 160,left: 159,right: 159,
            child: SmoothPageIndicator(controller: OnboardingController.pageController,
               count: 3,effect: const ExpandingDotsEffect(dotWidth: 8,dotHeight: 8,activeDotColor: AppColors.primaryBlue,dotColor: AppColors.dotColor),),
          )],
        )
       );
  }
}