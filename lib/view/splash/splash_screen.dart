
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: AppColors.primaryWhite.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  'g',
                  style: TextStyle(
                    fontSize: 52,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryWhite,
                    fontFamily: 'cursive',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Grand Hotel',
              style: MyTextStyle.onBoarding(color: AppColors.textWhite),
            ),
            const SizedBox(height: 8),
            Text(
              'Find Your Perfect Stay, Anytime, Anywhere',
              textAlign: TextAlign.center,
              style: MyTextStyle.smallTitleText(
                color: AppColors.primaryWhite.withOpacity(0.7),
                size: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}