import 'package:flutter/material.dart';
import 'package:focal_project/bindings/initialize_binding.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/view/auth/auth_view/signin_screen.dart';
import 'package:focal_project/view/auth/auth_view/signup_screen.dart';
import 'package:focal_project/view/onboarding/onboarding_view/onboarding.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.lightBlueBg,
      fontFamily: 'Jost'),
      
      debugShowCheckedModeBanner: false,
      initialBinding: InitializeBinding(),
      home: SigninScreen(),
    );
  }
}
