import 'package:get/get.dart';

class SecurityController extends GetxController {
  final RxBool faceId = true.obs;
  final RxBool rememberPassword = true.obs;
  final RxBool touchId = true.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSettings();
  }

  Future<void> fetchSettings() async {
    isLoading.value = true;
    try {
      // TODO: بدّل هاد بنداء API حقيقي يجيب إعدادات الأمان المحفوظة للمستخدم
      await Future.delayed(const Duration(milliseconds: 200));
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFaceId(bool value) {
    faceId.value = value;
    _saveSettings();
  }

  void toggleRememberPassword(bool value) {
    rememberPassword.value = value;
    _saveSettings();
  }

  void toggleTouchId(bool value) {
    touchId.value = value;
    _saveSettings();
  }

  Future<void> _saveSettings() async {
    // TODO: نداء API لحفظ التغيير فوراً (Face ID / Remember Password / Touch ID)
  }
}