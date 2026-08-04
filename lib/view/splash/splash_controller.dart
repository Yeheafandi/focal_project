import 'package:focal_project/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _goNext();
  }

  Future<void> _goNext() async {
    await Future.delayed(const Duration(seconds: 2));
    // لما تجهز شاشة الدخول أو الهوم، فك التعليق وحط اسم الروت الصح
    Get.offAllNamed(Routes.onboarding);
  }
}