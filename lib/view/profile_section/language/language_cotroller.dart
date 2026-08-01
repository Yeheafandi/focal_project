import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  final RxString selectedLanguageKey = 'language_screen.languages.english'.obs;
  final RxBool isLoading = false.obs;

  final Map<String, Locale> supportedLocales = {
    'language_screen.languages.english': const Locale('en', 'US'),
    'language_screen.languages.arabic': const Locale('ar', 'SA'),
  };

  final RxList<String> suggestedLanguages = <String>[
    'language_screen.languages.english',
    'language_screen.languages.arabic',
  ].obs;

  final RxList<String> otherLanguages = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLanguages();
  }

  Future<void> fetchLanguages() async {
    isLoading.value = true;
    try {
      final currentLocale = Get.locale;
      if (currentLocale?.languageCode == 'ar') {
        selectedLanguageKey.value = 'language_screen.languages.arabic';
      } else {
        selectedLanguageKey.value = 'language_screen.languages.english';
      }
      await Future.delayed(const Duration(milliseconds: 200));
    } finally {
      isLoading.value = false;
    }
  }

  void selectLanguage(String langKey) {
    selectedLanguageKey.value = langKey;

    if (supportedLocales.containsKey(langKey)) {
      final targetLocale = supportedLocales[langKey]!;
      Get.updateLocale(targetLocale);
    }
  }
}
