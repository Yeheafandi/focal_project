import 'package:flutter/material.dart';
import 'package:focal_project/view/my_favorite_view/my_favorite_controller/my_favorite_controller.dart';
import 'package:focal_project/view/my_favorite_view/widgets/my_favorite_shimmer.dart';
import 'package:focal_project/widgets/custom_search_bar.dart';
import 'package:focal_project/widgets/custom_shimmer.dart';
import 'package:get/get.dart';

import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

import 'package:focal_project/view/my_favorite_view/widgets/category_item.dart';
import 'package:focal_project/view/my_favorite_view/widgets/favorite_item.dart';
import 'package:focal_project/view/my_favorite_view/widgets/search_widget.dart';
import 'package:shimmer/shimmer.dart';

class MyFavoriteScreen extends GetView<MyFavoriteController> {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpaces.widthLarge),
        child: Column(
          children: [
            SizedBox(height: 56),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(Icons.arrow_back, color: AppColors.primaryBlack),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Text("My Favorite", style: MyTextStyle.normalTitleText()),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(Icons.filter_list, color: AppColors.primaryBlack),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
            const SizedBox(height: AppSpaces.heightLarge),
            CustomSearchBar(),

            const SizedBox(height: AppSpaces.heightNormal),

            SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                itemBuilder: (_, index) {
                  return CategoryItem(title: controller.categories[index]);
                },
              ),
            ),

            const SizedBox(height: AppSpaces.heightLarge),

            Expanded(
              child: Obx(() {
                print("isLoading = ${controller.isLoading.value}");
                if (controller.isLoading.value) {
                  return MyFavoriteShimmer();
                }
                if (controller.favorites.isEmpty) {
                  return const Center(child: Text("No favorites added yet"));
                }
                return GridView.builder(
                  
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.62,
                  ),
                  itemCount: controller.favorites.length,
                  itemBuilder: (_, index) {
                    return FavoriteItem(hotel: controller.favorites[index]);
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
