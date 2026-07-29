import 'package:focal_project/model/faq_Item.dart';
import 'package:get/get.dart';


class HelpSupportController extends GetxController {
  final RxList<FaqItem> _allFaqs = <FaqItem>[].obs;
  final RxList<FaqItem> filteredFaqs = <FaqItem>[].obs;
  final RxInt expandedIndex = 2.obs;
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  @override
  void onInit() {
    super.onInit();
    fetchFaqs();
  }

  Future<void> fetchFaqs() async {
    isLoading.value = true;
    try {
      // TODO: بدّل هاد بنداء API حقيقي زي fetchProducts عندك
      await Future.delayed(const Duration(milliseconds: 200));
      _allFaqs.value = List.generate(
        5,
        (_) => FaqItem(
          question: 'Lorem ipsum dolor sit amet',
          answer:
              'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. '
              'Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
        ),
      );
      filteredFaqs.value = _allFaqs;
      error.value = null;
    } catch (e) {
      error.value = 'Failed to load FAQs';
    } finally {
      isLoading.value = false;
    }
  }

  void search(String query) {
    filteredFaqs.value = query.isEmpty
        ? _allFaqs
        : _allFaqs
            .where((f) => f.question.toLowerCase().contains(query.toLowerCase()))
            .toList();
  }

  void toggleExpand(int index) {
    expandedIndex.value = expandedIndex.value == index ? -1 : index;
  }
}