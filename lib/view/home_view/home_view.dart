import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/core/constants/app_spaces.dart'; // تأكد من المسار الصحيح
import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/view/home_view/home_controller/home_controller.dart';
import 'package:focal_project/view/home_view/home_widgets/best_today_card.dart';
import 'package:focal_project/view/home_view/home_widgets/home_shimmer_loading_widget.dart';
import 'package:focal_project/view/home_view/home_widgets/near_you_map_card.dart';
import 'package:focal_project/view/home_view/home_widgets/popular_hotel_card.dart';
import 'package:focal_project/view/home_view/home_widgets/home_circle_icon_button.dart';
import 'package:focal_project/widgets/recommended_hotel_card.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeView({super.key});

  final Map<String, IconData?> categoryIcons = {
    "All": null,
    "Villas": Icons.home_work_outlined,
    "Hotels": Icons.hotel_outlined,
    "Apartments": Icons.apartment_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Obx(() {
          if (controller.isProfileLoading.value &&
              controller.isPopularLoading.value) {
            return Padding(
              padding: EdgeInsets.all(AppSpaces.paddingLarge),
              child: const HomeShimmerLoading(),
            );
          }

          final user = controller.userProfile.value;

          return RefreshIndicator(
            onRefresh: controller.fetchAllData,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(AppSpaces.paddingLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage(
                              user?.avatarUrl ?? '',
                            ),
                          ),
                          SizedBox(width: AppSpaces.widthMedium),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user?.name ?? '',
                                style: MyTextStyle.normalTitleText(
                                  fontWeight: FontWeight.bold,
                                  size: 16,
                                ),
                              ),
                              SizedBox(height: AppSpaces.heightVerySmall),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 14,
                                    color: AppColors.grey600,
                                  ),
                                  SizedBox(width: AppSpaces.widthVerySmall),
                                  Text(
                                    user?.location ?? '',
                                    style: MyTextStyle.smallTitleText(
                                      color: AppColors.grey600,
                                      size: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          HomeCircleIconButton(
                            icon: Icons.search,
                            onPressed: () {},
                          ),
                          SizedBox(width: AppSpaces.widthSmall),
                          HomeCircleIconButton(
                            icon: Icons.notifications_outlined,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpaces.heightLarge),

                  Container(
                    padding: EdgeInsets.all(AppSpaces.paddingNormal),
                    decoration: BoxDecoration(
                      color: AppColors.lightBlueBg,
                      borderRadius: BorderRadius.circular(
                        AppSpaces.radiusMedium,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.primary,
                          size: 26,
                        ),
                        SizedBox(width: AppSpaces.widthMedium),
                        Expanded(
                          child: Text(
                            "You Can Change Your Location to show nearby villas",
                            style: MyTextStyle.smallTitleText(
                              color: AppColors.black87,
                              size: 13,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: AppColors.grey600,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpaces.heightLarge),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Most Popular",
                        style: MyTextStyle.normalTitleText(size: 18),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          "See All",
                          style: MyTextStyle.smallTitleText(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpaces.heightMedium),
                  SizedBox(
                    height: 280,
                    child: controller.isPopularLoading.value
                        ? const HorizontalShimmer()
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.popularHotels.length,
                            itemBuilder: (context, index) {
                              return PopularHotelCard(
                                hotel: controller.popularHotels[index],
                              );
                            },
                          ),
                  ),
                  SizedBox(height: AppSpaces.heightLarge),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommended for you",
                        style: MyTextStyle.normalTitleText(size: 18),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          "See All",
                          style: MyTextStyle.smallTitleText(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpaces.heightMedium),

                  SizedBox(
                    height: 42,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        final category = controller.categories[index];
                        final icon = categoryIcons[category];
                        return Obx(() {
                          final isSelected =
                              controller.selectedCategory.value == category;
                          return GestureDetector(
                            onTap: () =>
                                controller.selectedCategory.value = category,
                            child: Container(
                              margin: EdgeInsets.only(
                                right: AppSpaces.paddingSmall,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSpaces.paddingNormal,
                                vertical: AppSpaces.paddingSmall,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.primaryWhite,
                                borderRadius: BorderRadius.circular(
                                  AppSpaces.radiusExtraLarge,
                                ),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.transparent
                                      : AppColors.grey200,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (icon != null) ...[
                                    Icon(
                                      icon,
                                      size: 16,
                                      color: isSelected
                                          ? AppColors.primaryWhite
                                          : AppColors.grey600,
                                    ),
                                    SizedBox(width: AppSpaces.widthVerySmall),
                                  ],
                                  Text(
                                    category,
                                    style: TextStyle(
                                      color: isSelected
                                          ? AppColors.primaryWhite
                                          : AppColors.grey600,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                  SizedBox(height: AppSpaces.heightNormal),

                  controller.isRecommendedLoading.value
                      ? const VerticalListShimmer()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.recommendedHotels.length,
                          itemBuilder: (context, index) {
                            return RecommendedHotelCard(
                              hotel: controller.recommendedHotels[index],
                            );
                          },
                        ),
                  SizedBox(height: AppSpaces.heightLarge),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hotel Near You",
                        style: MyTextStyle.normalTitleText(size: 18),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.nearbyMap);
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          "Open Map",
                          style: MyTextStyle.smallTitleText(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpaces.heightMedium),
                  controller.isNearYouLoading.value
                      ? const SingleShimmerBox(height: 180)
                      : NearYouMapCard(
                          areaName:
                              controller.nearYouData.value?.areaName ?? "",
                        ),
                  SizedBox(height: AppSpaces.heightLarge),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Best Today 🔥",
                        style: MyTextStyle.normalTitleText(size: 18),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          "See All",
                          style: MyTextStyle.smallTitleText(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpaces.heightMedium),

                  SizedBox(
                    height: 125,
                    child: controller.isBestTodayLoading.value
                        ? const HorizontalShimmer()
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.bestTodayHotels.length,
                            itemBuilder: (context, index) {
                              return BestTodayCard(
                                hotel: controller.bestTodayHotels[index],
                              );
                            },
                          ),
                  ),
                  SizedBox(height: AppSpaces.heightExtraLarge),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
