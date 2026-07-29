
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/profile_section/language/language_cotroller.dart';
import 'package:focal_project/view/profile_section/language/widgets/language_title.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';



class LanguageScreen extends GetView<LanguageController> {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
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
        title: Text('Language', style: MyTextStyle.normalTitleText(color: AppColors.titleColor)),
      ),
      body: Obx(
        () => ListView(
          padding: EdgeInsets.all(AppSpaces.paddingLarge),
          children: [
            Text(
              'Suggested Languages',
              style: MyTextStyle.smallTitleText(color: AppColors.subtitleColor, size: 12),
            ),
            SizedBox(height: AppSpaces.heightSmall),
            _LanguageCard(
              children: controller.suggestedLanguages.map((lang) {
                final isLast = lang == controller.suggestedLanguages.last;
                return LanguageTile(
                  label: lang,
                  isSelected: controller.selectedLanguage.value == lang,
                  onTap: () => controller.selectLanguage(lang),
                  showDivider: !isLast,
                );
              }).toList(),
            ),
            SizedBox(height: AppSpaces.heightLarge),
            Text(
              'Other Languages',
              style: MyTextStyle.smallTitleText(color: AppColors.subtitleColor, size: 12),
            ),
            SizedBox(height: AppSpaces.heightSmall),
            _LanguageCard(
              children: controller.otherLanguages.map((lang) {
                final isLast = lang == controller.otherLanguages.last;
                return LanguageTile(
                  label: lang,
                  isSelected: controller.selectedLanguage.value == lang,
                  onTap: () => controller.selectLanguage(lang),
                  showDivider: !isLast,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

/// صندوق أبيض بحواف دائرية يلف مجموعة لغات (Suggested / Other)
class _LanguageCard extends StatelessWidget {
  final List<Widget> children;
  const _LanguageCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpaces.paddingNormal),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
      ),
      child: Column(children: children),
    );
  }
}