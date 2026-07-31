import 'package:focal_project/routes/routes.dart';
import 'package:get/get.dart';

import 'widgets/logout_dialog.dart';

class ProfileController extends GetxController {
  final RxString name = 'Brooklyn Simmons'.obs;
  final RxString username = '@Brooklyn'.obs;
  final RxString avatarUrl = 'https://i.pravatar.cc/150?img=12'.obs;
  final RxInt navIndex = 3.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    isLoading.value = true;
    try {
      // TODO: بدّل هاد بنداء API حقيقي يجيب بيانات المستخدم
      await Future.delayed(const Duration(milliseconds: 200));
    } finally {
      isLoading.value = false;
    }
  }

  void changeNavIndex(int index) {
    navIndex.value = index;
  }

  void goToCard() {
    Get.toNamed(Routes.cardscreen);
  }

  void goToPersonalInfo() {
    Get.toNamed(Routes.personalInfoScreen);
  }

  void goToSecurity() {
    Get.toNamed(Routes.securityScreen);
  }

  void goToNotifications() {
    Get.toNamed(Routes.notificationSettingsScreen);
  }

  void goToLanguage() {
    Get.toNamed(Routes.languageScreen);
  }

  void goToHelpSupport() {
    Get.toNamed(Routes.helpSupportScreen);
  }

  void goToLegalPolicies() {
    Get.toNamed(Routes.legalPoliciesScreen);
  }

  Future<void> logout() async {
    final confirmed = await LogoutDialog.show();
    if (confirmed != true) return;

    // TODO: امسحي التوكن/الجلسة ونادي API تسجيل الخروج، بعدين:
    // Get.offAllNamed(Routes.signinscreen);
  }
}