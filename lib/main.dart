import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focal_project/bindings/initialize_binding.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/services/local_notification_service.dart';
import 'package:focal_project/core/services/my_services.dart';
import 'package:focal_project/core/services/notification_firebase_service.dart';
import 'package:focal_project/routes/app_routes.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Get.putAsync<LocalNotificationService>(
    () => LocalNotificationService().init(),
  );
  await Get.putAsync(() => MyServices().remembered());
  await Get.putAsync<NotificationFirebaseService>(
    () => NotificationFirebaseService().init(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final serv = Get.find<MyServices>();
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'Jost',
          scaffoldBackgroundColor: AppColors.backgroundPrimaryWhite,
        ),
        debugShowCheckedModeBanner: false,
        initialBinding: InitializeBinding(),
        initialRoute: Routes.messageScreen,
        getPages: AppRoutes.screens,
      ),
    );
  }
}
