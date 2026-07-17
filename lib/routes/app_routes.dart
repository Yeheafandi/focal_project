
import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/view/auth/auth_view/otp_screen.dart';
import 'package:focal_project/view/auth/auth_view/reset_password_request_screen.dart';
import 'package:focal_project/view/auth/auth_view/reset_password_screen.dart';
import 'package:focal_project/view/auth/auth_view/signin_screen.dart';
import 'package:focal_project/view/auth/auth_view/signup_screen.dart';
import 'package:focal_project/view/home_view/home_view.dart';
import 'package:focal_project/view/onboarding/onboarding_view/onboarding.dart';
import 'package:focal_project/view/onboarding/onboarding_view/onboarding3.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../view/onboarding/onboarding_view/onboarding1.dart';

class AppRoutes {
  static final screens = [
  GetPage(name: Routes.homeview, page: () =>  HomeView()),
  GetPage(name: Routes.resetrequest, page: () =>  ResetPasswordRequestScreen()),
    GetPage(name: Routes.resetpassword, page: () =>  ResetPasswordScreen()),
  GetPage(name: Routes.signinscreen , page: () =>  SigninScreen()),
   GetPage(name: Routes.signupscreen , page: () =>  SignupScreen()),
    GetPage(name: Routes.onboarding , page: () =>  Onboarding()),
    GetPage(name: Routes.onboarding3 , page: () =>  Onboarding3()),
    GetPage(name: Routes.onboarding1 , page: () =>  Onboarding1()),
     GetPage(name: Routes.otpscreen , page: () =>  OtpScreen())
  ];
}