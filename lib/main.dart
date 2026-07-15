import 'package:flutter/material.dart';
import 'package:focal_project/bindings/initialize_binding.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/view/home_view/home_view.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.lightBlueBg),
      debugShowCheckedModeBanner: false,
      initialBinding: InitializeBinding(),
      home: HomeView(),
    );
  }
}
