import 'package:get/get.dart';

class HotelDetailController extends GetxController {
  final RxBool isLoadingFacilities = true.obs;

  @override
  void onInit() {
    super.onInit();
    _simulateLoadingFacilities();
  }

  void _simulateLoadingFacilities() {
    Future.delayed(const Duration(seconds: 3), () {
      isLoadingFacilities.value = false;
    });
  }

  var isDescriptionExpanded = false.obs;

  void toggleDescription() {
    isDescriptionExpanded.value = !isDescriptionExpanded.value;
  }
}
