
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/model/faq_Item.dart';


class FaqTile extends StatelessWidget {
  final FaqItem faq;
  final bool isExpanded;
  final VoidCallback onTap;

  const FaqTile({
    super.key,
    required this.faq,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpaces.paddingMedium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    faq.question,
                    style: MyTextStyle.normalTitleText(
                      color: isExpanded ? AppColors.primaryBlue : AppColors.titleColor,
                      size: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: isExpanded ? AppColors.primaryBlue : AppColors.grey500,
                ),
              ],
            ),
          ),
          if (isExpanded)
            Padding(
              padding: EdgeInsets.only(bottom: AppSpaces.paddingMedium),
              child: Text(
                faq.answer,
                style: MyTextStyle.smallTitleText(color: AppColors.subtitleColor, size: 12.5),
              ),
            ),
          Divider(height: 1, color: AppColors.grey200),
        ],
      ),
    );
  }
}