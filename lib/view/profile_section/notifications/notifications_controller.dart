import 'package:get/get.dart';

class NotificationsController extends GetxController {
  final RxBool newEvent = true.obs;
  final RxBool delivery = true.obs;
  final RxBool message = true.obs;
  final RxBool payment = true.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSettings();
  }

  Future<void> fetchSettings() async {
    isLoading.value = true;
    try {
      // TODO: بدّل هاد بنداء API حقيقي يجيب إعدادات الإشعارات المحفوظة
      await Future.delayed(const Duration(milliseconds: 200));
    } finally {
      isLoading.value = false;
    }
  }

  void toggleNewEvent(bool value) {
    newEvent.value = value;
    _saveSettings();
  }

  void toggleDelivery(bool value) {
    delivery.value = value;
    _saveSettings();
  }

  void toggleMessage(bool value) {
    message.value = value;
    _saveSettings();
  }

  void togglePayment(bool value) {
    payment.value = value;
    _saveSettings();
  }

  Future<void> _saveSettings() async {
    // TODO: نداء API لحفظ التغيير فوراً
  }
}