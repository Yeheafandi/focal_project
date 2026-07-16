import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:focal_project/bindings/initialize_binding.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/routes/app_routes.dart';
import 'package:focal_project/view/auth/auth_view/signup_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.lightBlueBg,
      fontFamily: 'Jost'),
      
      debugShowCheckedModeBanner: false,
      initialBinding: InitializeBinding(),
      home: SignupScreen(),
      getPages: AppRoutes.screens,
    );
  }
}
