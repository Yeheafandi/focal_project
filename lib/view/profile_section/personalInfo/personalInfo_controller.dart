import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoController extends GetxController {
  // منستخدم TextEditingController عادي (مش Rx) لأنه TextField بيتحكم فيه مباشرة
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  // بتحدد إذا الحقول enabled (قابلة للتعديل) أو لسا بوضع العرض بس
  final RxBool isEditing = false.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPersonalInfo();
  }

  Future<void> fetchPersonalInfo() async {
    isLoading.value = true;
    try {
      // TODO: بدّل هاد بنداء API حقيقي يجيب بيانات المستخدم
      await Future.delayed(const Duration(milliseconds: 200));
      firstNameCtrl.text = 'Gustavo';
      lastNameCtrl.text = 'Lipshutz';
      emailCtrl.text = 'Gustavolipshutz@gmail.com';
      phoneCtrl.text = '+1 9003430';
    } finally {
      isLoading.value = false;
    }
  }

  // لما يدوس أيقونة القلم فوق، منفعّل وضع التعديل
  void toggleEditing() {
    isEditing.value = !isEditing.value;
  }

  Future<void> saveChanges() async {
    if (!isEditing.value) return; // الزر disabled أصلاً بوضع العرض

    isLoading.value = true;
    try {
      // TODO: نداء API لحفظ التعديلات (firstNameCtrl.text, lastNameCtrl.text ...)
      await Future.delayed(const Duration(milliseconds: 300));
      isEditing.value = false; // بعد الحفظ منرجع لوضع العرض
      Get.snackbar('Success', 'Your changes have been saved');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    super.onClose();
  }
}