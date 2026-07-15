import 'package:focal_project/view/auth/auth_controller/auth_controller.dart';
import 'package:get/get.dart';


class InitializeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
   // Get.put(Crud());
   
  }
}