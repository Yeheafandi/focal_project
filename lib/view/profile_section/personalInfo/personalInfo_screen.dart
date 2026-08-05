import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/profile_section/personalInfo/personalInfo_controller.dart';
import 'package:focal_project/view/profile_section/personalInfo/widgets/labeledTextField.dart';
import 'package:focal_project/widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInfoScreen extends GetView<PersonalInfoController> {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PersonalInfoController());

    return Scaffold(
      backgroundColor: AppColors.primaryWhite,

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppSpaces.widthLarge),
        children: [
          CustomAppBar(
            title: 'personal_info'.tr,
            action: GestureDetector(
              onTap: controller.toggleEditing,
              child: SvgPicture.asset(AppIcons.editIcon),
            ),
          ),
          SizedBox(height: AppSpaces.heightLarge),
          Obx(
            () => Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabeledTextField(
                      label: 'first_name'.tr,
                      controller: controller.firstNameCtrl,
                      enabled: controller.isEditing.value,
                    ),
                    SizedBox(height: AppSpaces.heightNormal),
                    LabeledTextField(
                      label: 'last_name'.tr,
                      controller: controller.lastNameCtrl,
                      enabled: controller.isEditing.value,
                    ),
                    SizedBox(height: AppSpaces.heightNormal),
                    LabeledTextField(
                      label: 'email'.tr,
                      controller: controller.emailCtrl,
                      enabled: controller.isEditing.value,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: AppSpaces.heightNormal),
                    LabeledTextField(
                      label: 'phone'.tr,
                      controller: controller.phoneCtrl,
                      enabled: controller.isEditing.value,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 56),
                    // زر Save Changes - بيصير Active (أزرق) بس بوضع التعديل
                    SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.isEditing.value
                            ? controller.saveChanges
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.isEditing.value
                              ? AppColors.primaryBlue
                              : AppColors.formFiled,
                          disabledBackgroundColor: AppColors.formFiled,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            vertical: AppSpaces.paddingMedium,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppSpaces.radiusMedium,
                            ),
                          ),
                        ),
                        child: Text(
                          'save_changes'.tr,
                          style: MyTextStyle.normalTitleText(
                            color: controller.isEditing.value
                                ? AppColors.primaryWhite
                                : AppColors.grey400,
                            size: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
