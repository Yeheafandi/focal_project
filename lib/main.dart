import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:focal_project/bindings/initialize_binding.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/routes/app_routes.dart';
<<<<<<< HEAD
import 'package:focal_project/view/booking_details_view/booking_details_view/booking_details_view.dart';
import 'package:focal_project/view/messages_view/messages_screen/messages_screen.dart';
import 'package:focal_project/widgets/navigation_menu_view/navigation_menu_view.dart';
=======
import 'package:focal_project/view/auth/auth_view/signup_screen.dart';
>>>>>>> main
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
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.lightBlueBg,
        fontFamily: 'Jost',
      ),

      debugShowCheckedModeBanner: false,
      initialBinding: InitializeBinding(),
<<<<<<< HEAD
      home: MessageScreen(),
=======
      home: SignupScreen(),
>>>>>>> main
      getPages: AppRoutes.screens,
    );
  }
}
