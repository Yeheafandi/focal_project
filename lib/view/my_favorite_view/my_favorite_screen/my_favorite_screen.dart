import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/my_favorite_view/my_favorite_controller/my_favorite_controller.dart';
import 'package:focal_project/view/my_favorite_view/widgets/category_item.dart';
import 'package:focal_project/view/my_favorite_view/widgets/favorite_item.dart';
import 'package:focal_project/view/my_favorite_view/widgets/my_favorite_shimmer.dart';
import 'package:focal_project/widgets/custom_app_bar.dart';
import 'package:focal_project/widgets/custom_search_bar.dart';
import 'package:get/get.dart';

class MyFavoriteScreen extends GetView<MyFavoriteController> {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("======================== MyFavoriteScreen build");return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpaces.widthLarge),
          child: Column(
            children: [
              CustomAppBar(
                title: 'my_favorite.title'.tr,
                action: InkWell(child: SvgPicture.asset(AppIcons.sort)),
                showBackButton: false,
              ),
              SizedBox(height: AppSpaces.heightExtraLarge),
              CustomSearchBar(onFilterTap: () => ''),
              SizedBox(height: AppSpaces.heightNormal),
              SizedBox(
                height: 48,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  itemBuilder: (_, index) {
                    final categoryKey = controller.categories[index];
                    return CategoryItem(
                      title: controller.categories[index],
                      icon: controller.categoriesIcons[index],

                    );
                  },
                ),
              ),
              SizedBox(height: AppSpaces.heightVerySmall),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const MyFavoriteShimmer();
                  }
                  if (controller.favorites.isEmpty) {
                    return Center(
                      child: Text(
                        "my_favorite.no_favorites".tr,
                        style: MyTextStyle.smallTitleText(
                          color: AppColors.subtitleColor,
                          fontWeight: FontWeight.w400,
                          size: 14,
                        ),
                      ),
                    );
                  }
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 0,
                      childAspectRatio: 0.62,
                    ),
                    itemCount: controller.displayedFavorites.length,
                    itemBuilder: (_, index) {
                      return FavoriteItem(
                        hotel: controller.displayedFavorites[index],
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}