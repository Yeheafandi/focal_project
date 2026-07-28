import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_spaces.dart';
import '../search_filter_controller/search_filter_controller.dart';
import 'category_tabs.dart';
import 'search_card_item.dart';

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchFilterController>();

    return Column(
      children: [
        const CategoryTabs(),
        Expanded(
          child: Obx(() {
            if (controller.searchResults.isEmpty) {
              return  Center(
                child: Text(
                  "No results found",
                  style: MyTextStyle.normalTitleText(size: 16, color: AppColors.grey),
                ),
              );
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: AppSpaces.paddingLarge),
              child: Column(
                children: [
                  SizedBox(height: AppSpaces.heightSmall),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.searchResults.length,
                    itemBuilder: (context, index) {
                      final hotel = controller.searchResults[index];
                      return SearchCardItem(hotel: hotel);
                    },
                  ),
                  SizedBox(height: AppSpaces.paddingLarge),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}