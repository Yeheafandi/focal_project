import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/widgets/custom_text.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( leading: IconButton(onPressed: Get.back, icon: Icon(Icons.arrow_back)),),
      body: Padding(
        padding:  EdgeInsets.all(AppSpaces.paddingExtraLarge32),
        child: Center(
          child: Column(spacing: 8,
            children: [
              mainTitle('Enter OTP',AppColors.primaryBlack),
            SizedBox(height: AppSpaces.heightMedium,),
              FittedBox(fit: BoxFit.scaleDown, child: SubTitle(text: 'We have just sent you 4 digit code via your email',color:AppColors.grey,fontWeight:  FontWeight.w400)),
              SubTitle(text:  'example@gmail.com',color:  AppColors.black87,fontWeight:FontWeight.w400)
        ,SizedBox(height: AppSpaces.heightExtraLarge,)
           , OtpTextField(fieldHeight: 56,fieldWidth: 56,focusedBorderColor: AppColors.primaryBlue,borderWidth: 1,
              numberOfFields: 4,margin: EdgeInsets.all(10),
              borderColor: AppColors.textWhite,borderRadius: BorderRadius.circular(24),
              showFieldAsBox: true,
            ),SizedBox(height: 40,),
            CustomeButton(text: 'Continue',onPressed: () =>Get.offNamed( Routes.navigationMenuView ),),SizedBox(height: AppSpaces.heightLarge,),
            Row(spacing: 3,mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SubTitle(text:'Didn’t receive code? ',color: AppColors.hintColor,fontWeight:FontWeight.w600),
              InkWell(child: SubTitle(text: 'Resend Code',color: AppColors.primaryBlue,fontWeight: FontWeight.w600))
              ],
            ), 
            ],
          ),
        ),
      ),
    );
  }
}
