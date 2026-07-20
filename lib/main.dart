import 'package:flutter/material.dart';
import 'package:focal_project/bindings/initialize_binding.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/routes/app_routes.dart';
import 'package:focal_project/widgets/navigation_menu_view/navigation_menu_view.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(designSize: Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => 
     GetMaterialApp(
        theme: ThemeData(
        fontFamily: 'Jost'),
        
        debugShowCheckedModeBanner: false,
        initialBinding: InitializeBinding(),
        initialRoute: Routes.onboarding,
        getPages: AppRoutes.screens,
      ),
    );
  }
}
