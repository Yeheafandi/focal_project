import 'package:flutter/material.dart';
import 'package:focal_project/view/detail_view/all_facilities_view.dart';
import 'package:focal_project/view/detail_view/detail_controller/detail_controller.dart';
import 'package:focal_project/view/detail_view/detail_widgets/common_facility_item.dart';
import 'package:focal_project/view/detail_view/detail_widgets/hotel_detail_widgets.dart';
import 'package:focal_project/view/detail_view/hotel_reviews_view.dart';
import 'package:focal_project/view/home_view/home_widgets/best_today_card.dart';
import 'package:focal_project/view/home_view/home_widgets/near_you_map_card.dart';
import 'package:focal_project/widgets/icon_circle_button.dart';
import 'package:get/get.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/model/hotel_model.dart';

class HotelDetailView extends StatelessWidget {
  final HotelModel hotel;
  
  final HotelDetailController controller = Get.put(HotelDetailController());

  HotelDetailView({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(AppSpaces.radiusExtraLarge),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(hotel.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(AppSpaces.paddingLarge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              hotel.name,
                              style: MyTextStyle.normalTitleText(
                                size: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryBlack,
                              ),
                            ),
                          ),
                          CustomCircleIconButton(
                            icon: Icons.layers_outlined,
                            iconColor: AppColors.primary,
                            backgroundColor: AppColors.primary,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      Row(
                        children: [
                          Icon(Icons.location_on, color: AppColors.primary, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            hotel.location,
                            style: MyTextStyle.smallTitleText(color: AppColors.grey500, size: 14),
                          ),
                          const SizedBox(width: 12),
                          Icon(Icons.star, color: AppColors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            "${hotel.rating}",
                            style: MyTextStyle.normalTitleText(fontWeight: FontWeight.bold, size: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpaces.heightLarge),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Common Facilities", style: MyTextStyle.normalTitleText(fontWeight: FontWeight.bold, size: 16)),
                          GestureDetector(
                            onTap: () {
                              Get.to(const AllFacilitiesView());
                            },
                            child: Text("See All", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpaces.heightMedium),

                      Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonFacilityItem(icon: Icons.ac_unit, label: "Ac", isLoading: controller.isLoadingFacilities.value),
                          CommonFacilityItem(icon: Icons.restaurant, label: "Restaurant", isLoading: controller.isLoadingFacilities.value),
                          CommonFacilityItem(icon: Icons.pool, label: "Pool", isLoading: controller.isLoadingFacilities.value),
                          CommonFacilityItem(icon: Icons.support_agent, label: "24-Hours", isLoading: controller.isLoadingFacilities.value),
                        ],
                      )),
                      SizedBox(height: AppSpaces.heightLarge),

                      Text("Description", style: MyTextStyle.normalTitleText(fontWeight: FontWeight.bold, size: 16)),
                      SizedBox(height: AppSpaces.heightSmall),
                      RichText(
                        text: TextSpan(
                          text: "The ideal place for those looking for a luxurious and tranquil holiday experience with stunning sea views..... ",
                          style: MyTextStyle.smallTitleText(color: AppColors.grey600, size: 14),
                          children: [
                            TextSpan(
                              text: "Read More",
                              style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSpaces.heightLarge),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Location", style: MyTextStyle.normalTitleText(fontWeight: FontWeight.bold, size: 16)),
                          GestureDetector(
                            onTap: () {},
                            child: Text("Open Map", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpaces.heightMedium),
                      NearYouMapCard(areaName: hotel.location),
                      SizedBox(height: AppSpaces.heightLarge),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Reviews", style: MyTextStyle.normalTitleText(fontWeight: FontWeight.bold, size: 16)),
                          GestureDetector(
                            onTap: () {Get.to(const HotelReviewsView());},
                            child: Text("See All", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpaces.heightMedium),
                      const HotelReviewTile(author: "Kim Borrdy", reviewText: "Amazing! The room is good.", rating: 4.5),
                      const HotelReviewTile(author: "Mirai Kamazuki", reviewText: "The service is on point.", rating: 5.0),
                      SizedBox(height: AppSpaces.heightLarge),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Recommendation", style: MyTextStyle.normalTitleText(fontWeight: FontWeight.bold, size: 16)),
                          GestureDetector(
                            onTap: () {},
                            child: Text("See All", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpaces.heightMedium),
                      SizedBox(
                        height: 110,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) => BestTodayCard(hotel: hotel),
                        ),
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: AppSpaces.paddingMedium,
            right: AppSpaces.paddingMedium,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCircleIconButton(icon: Icons.arrow_back, onPressed: () => Get.back()),
                CustomCircleIconButton(icon: Icons.more_vert, onPressed: () {}),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BookingBottomBar(
              hotel: hotel,
              onBookingPressed: () {
              },
            ),
          ),
        ],
      ),
    );
  }
}