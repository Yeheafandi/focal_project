import 'package:focal_project/view/search_section/search_view/search_filter_controller/search_filter_controller.dart';
import 'package:focal_project/view/auth/auth_controller/auth_controller.dart';
import 'package:get/get.dart';


class InitializeBinding extends Bindings {
  @override
  void dependencies() {
   // Get.put(Crud());
   Get.lazyPut<SearchFilterController>(() => SearchFilterController());
    Get.put(AuthController());
   // Get.put(Crud());
   
  }
}