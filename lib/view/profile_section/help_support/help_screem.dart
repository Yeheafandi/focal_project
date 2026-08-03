
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/profile_section/help_support/help_controller.dart';
import 'package:focal_project/view/profile_section/help_support/widgets/faq_title.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HelpSupportScreen extends GetView<HelpSupportController> {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HelpSupportController());

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
        title: Text('help_and_support'.tr, style: MyTextStyle.normalTitleText(color: AppColors.titleColor)),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSpaces.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حقل البحث
            TextField(
              onChanged: controller.search,
              style: MyTextStyle.normalTitleText(
                color: AppColors.titleColor,
                size: 14,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                hintText:'search_hint'.tr,
                hintStyle: MyTextStyle.smallTitleText(color: AppColors.hintColor, size: 14),
                prefixIcon: Icon(Icons.search, color: AppColors.hintColor, size: 20),
                filled: true,
                fillColor: AppColors.primaryWhite,
                contentPadding: EdgeInsets.symmetric(vertical: AppSpaces.paddingMedium),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
                  borderSide: BorderSide(color: AppColors.grey200),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
                  borderSide: BorderSide(color: AppColors.grey200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
                  borderSide: BorderSide(color: AppColors.primaryBlue),
                ),
              ),
            ),
            SizedBox(height: AppSpaces.heightNormal),
            // قائمة الأسئلة القابلة للطي
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.error.value != null) {
                  return Center(child: Text(controller.error.value!));
                }
                return ListView.builder(
                  itemCount: controller.filteredFaqs.length,
                  itemBuilder: (context, index) {
                    final faq = controller.filteredFaqs[index];
                    return FaqTile(
                      faq: faq,
                      isExpanded: controller.expandedIndex.value == index,
                      onTap: () => controller.toggleExpand(index),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}