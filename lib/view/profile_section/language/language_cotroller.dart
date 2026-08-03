import 'package:flutter/material.dart';
import 'package:focal_project/core/services/favorite_service.dart';
import 'package:focal_project/view/book_view/book_controller/my_booking_controller.dart';
import 'package:focal_project/view/home_view/home_controller/home_controller.dart';
import 'package:focal_project/view/my_favorite_view/my_favorite_controller/my_favorite_controller.dart';
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
      Get.forceAppUpdate();

      if (Get.isRegistered<HomeController>()) {
        Get.find<HomeController>().fetchAllData();
      }

      if (Get.isRegistered<MyFavoriteService>()) {
        Get.find<MyFavoriteService>().refreshTranslations();
      }

      if (Get.isRegistered<MyFavoriteController>()) {
        Get.find<MyFavoriteController>().loadFavorites();
      }

      if (Get.isRegistered<MyBookingController>()) {
        Get.find<MyBookingController>().refreshTranslations();
      }
    }
  }
}
