import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  bool isPasswordHidden=true;
  bool isChecked=false;
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
   GlobalKey<FormState> formKey2 =GlobalKey<FormState>();
  final userController =TextEditingController();
  final passController =TextEditingController();
  final eController =TextEditingController();

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }
  void toggleCheckbox(){
    isChecked= !isChecked;
    update();
  }
}