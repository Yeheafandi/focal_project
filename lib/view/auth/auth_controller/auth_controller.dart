import 'package:get/get.dart';

class AuthController extends GetxController{
  bool isPasswordHidden=true;
  bool isChecked=false;
  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }
  void toggleCheckbox(){
    isChecked= !isChecked;
    update();
  }
}