import 'package:get/get.dart';

class LanguageController extends GetxController {
  final RxString selectedLanguage = 'English (UK)'.obs;
  final RxBool isLoading = false.obs;

  final RxList<String> suggestedLanguages = <String>[
    'English (UK)',
    'English',
    'Bahasa Indonesia',
  ].obs;

  final RxList<String> otherLanguages = <String>[
    'Chinese',
    'Croatian',
    'Czech',
    'Danish',
    'Filipino',
    'Finland',
  ].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLanguages();
  }

  Future<void> fetchLanguages() async {
    isLoading.value = true;
    try {
      // TODO: بدّل هاد بنداء API حقيقي يجيب اللغة المحفوظة وقائمة اللغات المتاحة
      await Future.delayed(const Duration(milliseconds: 200));
    } finally {
      isLoading.value = false;
    }
  }

  void selectLanguage(String language) {
    selectedLanguage.value = language;
    // TODO: نداء API لحفظ اللغة المختارة، وممكن كمان تحديث لغة التطبيق مباشرة
    // Get.updateLocale(...)
  }
}