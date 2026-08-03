import 'package:focal_project/model/payment_card_model.dart';
import 'package:get/get.dart';


class CardController extends GetxController {
  final RxList<PaymentCardModel> cards = <PaymentCardModel>[].obs;
  final RxInt defaultCardIndex = 0.obs;
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  @override
  void onInit() {
    super.onInit();
    fetchCards();
  }

  Future<void> fetchCards() async {
    isLoading.value = true;
    try {
      // TODO: بدّل هاد الجزء بنداء API حقيقي زي fetchProducts عندك
      // final response = await http.get(Uri.parse(AppUrls.cards));
      await Future.delayed(const Duration(milliseconds: 300));
      cards.value = [
        PaymentCardModel(
          balance: 3242.23,
          cardNumber: '9865 3567 4563 4235',
          expiryDate: '12/24',
          type: 'visa',
        ),
        PaymentCardModel(
          balance: 4570.80,
          cardNumber: '5294 2436 4789 9568',
          expiryDate: '12/24',
          type: 'mastercard',
        ),
      ];
      error.value = null;
    } catch (e) {
      error.value = 'failed_to_load_cards'.tr;
    } finally {
      isLoading.value = false;
    }
  }

  void setDefaultCard(int index) {
    defaultCardIndex.value = index;
  }

  void addCard() {
    // TODO: فتح شاشة إضافة بطاقة جديدة أو نداء API إضافة
  }
}