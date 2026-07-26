import 'package:get/get.dart';

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
    Get.toNamed('/card');
  }

  Future<void> logout() async {
    // TODO: امسح التوكن/الجلسة ونادِ API تسجيل الخروج، بعدين:
    // Get.offAllNamed('/login');
  }
}