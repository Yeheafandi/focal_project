
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/profile_section/legal_policies/legal_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LegalPoliciesScreen extends GetView<LegalPoliciesController> {
  const LegalPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LegalPoliciesController());

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
        title: Text('Legal and Policies', style: MyTextStyle.normalTitleText(color: AppColors.titleColor)),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.error.value != null) {
          return Center(child: Text(controller.error.value!));
        }
        return ListView.builder(
          padding: EdgeInsets.all(AppSpaces.paddingLarge),
          itemCount: controller.sections.length,
          itemBuilder: (context, index) {
            final section = controller.sections[index];
            return Padding(
              padding: EdgeInsets.only(bottom: AppSpaces.heightLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (section.title.isNotEmpty) ...[
                    Text(
                      section.title,
                      style: MyTextStyle.normalTitleText(
                        color: AppColors.titleColor,
                        size: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: AppSpaces.heightSmall),
                  ],
                  Text(
                    section.body,
                    style: MyTextStyle.smallTitleText(
                      color: AppColors.subtitleColor,
                      size: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}