import 'package:focal_project/view/profile_section/legal_policies/widgets/legal_sections.dart';
import 'package:get/get.dart';


class LegalPoliciesController extends GetxController {
  final RxList<LegalSection> sections = <LegalSection>[].obs;
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  @override
  void onInit() {
    super.onInit();
    fetchLegalContent();
  }

  Future<void> fetchLegalContent() async {
    isLoading.value = true;
    try {
      // TODO: بدّل هاد بنداء API حقيقي يجيب نصوص الشروط والسياسات الفعلية
      await Future.delayed(const Duration(milliseconds: 200));
      const lorem =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
          'Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. '
          'Sapien, consequat ultrices morbi orci semper sit nulla. '
          'Leo auctor et etiam est, amet aliquet ut vitae. Odio vulputate est id tincidunt fames.';

      sections.value = [
        LegalSection(title: 'Terms', body: lorem),
        LegalSection(title: '', body: lorem),
        LegalSection(title: 'Changes to the Service and/or Terms:', body: lorem),
        LegalSection(title: '', body: lorem),
      ];
      error.value = null;
    } catch (e) {
      error.value = 'Failed to load content';
    } finally {
      isLoading.value = false;
    }
  }
}