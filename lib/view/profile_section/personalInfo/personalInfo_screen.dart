
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/profile_section/personalInfo/personalInfo_controller.dart';
import 'package:focal_project/view/profile_section/personalInfo/widgets/labeledTextField.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PersonalInfoScreen extends GetView<PersonalInfoController> {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PersonalInfoController());

    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            AppIcons.backArrow,
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(AppColors.titleColor, BlendMode.srcIn),
          ),
          onPressed: () => Get.back(),
        ),
        title: Text('personal_info'.tr, style: MyTextStyle.normalTitleText(color: AppColors.titleColor)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppSpaces.paddingNormal),
            child: Center(
              child: GestureDetector(
                onTap: controller.toggleEditing,
                child: Container(
                  padding: EdgeInsets.all(AppSpaces.paddingVerySmall),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey200),
                    borderRadius: BorderRadius.circular(AppSpaces.radiusSmall),
                  ),
                  child: Icon(Icons.edit_outlined, size: 18, color: AppColors.titleColor),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(AppSpaces.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabeledTextField(
                label: 'first_name'.tr,
                controller: controller.firstNameCtrl,
                enabled: controller.isEditing.value,
              ),
              SizedBox(height: AppSpaces.heightLarge),
              LabeledTextField(
                label: 'last_name'.tr,
                controller: controller.lastNameCtrl,
                enabled: controller.isEditing.value,
              ),
              SizedBox(height: AppSpaces.heightLarge),
              LabeledTextField(
                label: 'email'.tr,
                controller: controller.emailCtrl,
                enabled: controller.isEditing.value,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: AppSpaces.heightLarge),
              LabeledTextField(
                label: 'phone'.tr,
                controller: controller.phoneCtrl,
                enabled: controller.isEditing.value,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: AppSpaces.heightExtraLarge),
              // زر Save Changes - بيصير Active (أزرق) بس بوضع التعديل
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.isEditing.value ? controller.saveChanges : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.isEditing.value
                        ? AppColors.primaryBlue
                        : AppColors.formFiled,
                    disabledBackgroundColor: AppColors.formFiled,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: AppSpaces.paddingMedium),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
                    ),
                  ),
                  child: Text(
                    'save_changes'.tr,
                    style: MyTextStyle.normalTitleText(
                      color: controller.isEditing.value ? AppColors.primaryWhite : AppColors.grey400,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}