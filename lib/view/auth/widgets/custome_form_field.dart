import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/view/auth/auth_controller/auth_controller.dart';
import 'package:get/get.dart';

class CustomeFormField extends StatelessWidget {
  const CustomeFormField(
      {super.key,
      required this.type,
      this.authController,
      this.isPassword,
      required this.hintText,
      this.validator});

  final TextInputType type;
  final String? Function(String?)? validator;
  final bool? isPassword;
  final String hintText;
  final TextEditingController? authController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) => TextFormField(
        validator: validator,
        obscureText: isPassword == true ? controller.isPasswordHidden : false,
        controller: authController,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.formFiled,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide.none),
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.hintColor,fontWeight: FontWeight.w600),
          suffixIcon: isPassword == true
              ? IconButton(
                  onPressed: controller.togglePasswordVisibility,
                  icon: Icon(
                    color: const Color(0xFF171725),
                    controller.isPasswordHidden
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                )
              : null,
        ),
        keyboardType: type,
      ),
    );
  }
}