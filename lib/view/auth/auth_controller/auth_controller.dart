import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  bool isPasswordHidden=true;
  bool isChecked=false;
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 =GlobalKey<FormState>();
  GlobalKey<FormState> formKey3 =GlobalKey<FormState>();
  final userController =TextEditingController();
  final passController =TextEditingController();
  final passConfirmController=TextEditingController();
  final eController =TextEditingController();

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }
  void toggleCheckbox(){
    isChecked= !isChecked;
    update();
  }
 void clearFields(){
  eController.clear();
  passController.clear();
 }
  bool checkMatch(){
    if (formKey3.currentState!.validate()){
    
   Get.snackbar('CHECK MATCHING', 'matched');
   return true;
    }else{
    Get.snackbar('check match password', "dosen't match");
    return false;
    }
  }
}