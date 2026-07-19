import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/view/search_section/search_view/search_widgets/default_search_view.dart';
import 'package:focal_project/view/search_section/search_view/search_widgets/search_results_view.dart';
import 'package:get/get.dart';
import 'search_filter_controller/search_filter_controller.dart';
import 'filter_bottom_sheet.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spaces.dart';
import '../../../core/constants/text_style.dart';
import '../../../widgets/icon_circle_button.dart';
import '../../../widgets/custom_search_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchFilterController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomCircleIconButton(
            icon: Icons.arrow_back_sharp,
            onPressed: () => Get.back(),
          ),
        ),
        title: Text(
          'Search',
          style: MyTextStyle.normalTitleText(
            size: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlack,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(AppImages.notificationIcon),
            onPressed: () {},
          ),
           SizedBox(width: AppSpaces.paddingSmall),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpaces.paddingLarge,
              vertical: AppSpaces.paddingSmall,
            ),
            child: Obx(
              () => CustomSearchBar(
                controller: controller.searchTxtController,
                isFilterApplied: controller.isFilterApplied.value,
                onChanged: (query) {
                  if (query.isEmpty) {
                    controller.isSearchActive.value = false;
                  }
                },
                onSubmitted: (query) {
                  if (query.isNotEmpty) {
                    controller.executeSearchAndFilter();
                  }
                },
                onFilterTap: () {
                  Get.bottomSheet(
                    const FilterBottomSheet(),
                    isScrollControlled: true,
                    ignoreSafeArea: false,
                  );
                },
                onResetTap: () => controller.resetFilters(),
              ),
            ),
          ),

          Expanded(
            child: Obx(() {
              return controller.isSearchActive.value
                  ? const SearchResultsView()
                  : const DefaultSearchView();
            }),
          ),
        ],
      ),
    );
  }
}
