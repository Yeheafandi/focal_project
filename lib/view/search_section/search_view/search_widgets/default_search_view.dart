import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spaces.dart';
import '../../../../core/constants/text_style.dart';
import '../search_filter_controller/search_filter_controller.dart';
import 'recent_searches_list.dart';
import 'recently_viewed_list.dart';

class DefaultSearchView extends StatelessWidget {
  const DefaultSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchFilterController>();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: AppSpaces.paddingLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSpaces.heightSmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
               'default_search_view.recent_searches'.tr,
                style: MyTextStyle.normalTitleText(
                  size: 16,
                  color: AppColors.primaryBlack,
                ),
              ),
              TextButton(
                onPressed: () => controller.recentSearches.clear(),
                child: Text(
                  'default_search_view.clear_all'.tr,
                  style: MyTextStyle.normalTitleText(
                    color: AppColors.red,
                    fontWeight: FontWeight.w500,
                    size: 12,
                  ),
                ),
              ),
            ],
          ),
          const RecentSearchesList(),
          SizedBox(height: AppSpaces.paddingExtraLarge32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'default_search_view.recently_viewed'.tr,
                style: MyTextStyle.normalTitleText(
                  size: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlack,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'default_search_view.see_all'.tr,
                  style: MyTextStyle.normalTitleText(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const RecentlyViewedList(),
          SizedBox(height: AppSpaces.paddingLarge),
        ],
      ),
    );
  }
}
