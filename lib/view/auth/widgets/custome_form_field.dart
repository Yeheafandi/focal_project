import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/view/auth/auth_controller/auth_controller.dart';
import 'package:get/get.dart';

class CustomeFormField extends StatelessWidget {
  final AuthController controller=Get.put(AuthController());
   CustomeFormField({super.key, required this.type, this.isPassword, required this.hintText});
  final TextInputType type;

  final bool? isPassword; 
final String hintText;


  @override
  Widget build(BuildContext context) {
    return
       GetBuilder<AuthController>(builder: (controller)=>
          TextFormField(
          obscureText:isPassword==true? controller.isPasswordHidden:false ,
          controller: null,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.formFiled,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.hintColor),
            suffixIcon: isPassword == true
                ? IconButton(
                    onPressed: controller.togglePasswordVisibility,
                    icon: Icon(
                      controller.isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.hintColor,
                    ),
                  )
                : null,
          ),
          keyboardType: type,

             ),
       );
  }
}