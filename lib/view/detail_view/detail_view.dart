import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/services/hotel_services.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/view/detail_view/all_facilities_view.dart';
import 'package:focal_project/view/detail_view/detail_controller/detail_controller.dart';
import 'package:focal_project/view/detail_view/detail_widgets/common_facility_item.dart';
import 'package:focal_project/view/detail_view/detail_widgets/hotel_detail_widgets.dart';
import 'package:focal_project/view/detail_view/detail_widgets/share_widget.dart';
import 'package:focal_project/view/detail_view/hotel_reviews_view.dart';
import 'package:focal_project/view/home_view/home_widgets/best_today_card.dart';
import 'package:focal_project/view/home_view/home_widgets/home_circle_icon_button.dart';
import 'package:focal_project/view/home_view/home_widgets/near_you_map_card.dart';
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
    final double imageHeight = MediaQuery.of(context).size.height * 0.42;
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: imageHeight,
                  width: double.infinity,
                  child: Image.network(hotel.imageUrl, fit: BoxFit.cover),
                ),

                Transform.translate(
                  offset: const Offset(0, -32),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryWhite,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpaces.paddingLarge,
                      vertical: AppSpaces.paddingLarge,
                    ),
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
                                  size: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryBlack,
                                ),
                              ),
                            ),
                            HomeCircleIconButton(
                              icon: Image.asset(AppImages.rotate3dIcon),
                              onPressed: () {
                                Get.bottomSheet(
                                  ShareWidget(
                                    hotel: hotel,
                                    link:
                                        'https://instastaycom/hotel/${hotel.id}',
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpaces.heightVerySmall),

                        Row(
                          children: [
                            Image.asset(
                              AppImages.locationIcon,
                              color: AppColors.primary,
                            ),
                            SizedBox(width: AppSpaces.widthVerySmall),
                            Text(
                              hotel.location,
                              style: MyTextStyle.smallTitleText(
                                color: AppColors.grey500,
                                size: 14,
                              ),
                            ),
                            SizedBox(width: AppSpaces.widthSmall),
                            Icon(Icons.star, color: AppColors.amber, size: 16),
                            SizedBox(width: AppSpaces.widthVerySmall),
                            Text(
                              "${hotel.rating}",
                              style: MyTextStyle.normalTitleText(size: 12),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpaces.heightLarge),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'hotel_detail.common_facilities'.tr,
                              style: MyTextStyle.normalTitleText(
                                fontWeight: FontWeight.bold,
                                size: 16,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const AllFacilitiesView());
                              },
                              child: Text(
                                'hotel_detail.see_all'.tr,
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpaces.heightMedium),

                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonFacilityItem(
                                icon: Icons.ac_unit,
                                label: 'hotel_detail.ac'.tr,
                                isLoading: controller.isLoadingFacilities.value,
                              ),
                              CommonFacilityItem(
                                icon: Icons.restaurant,
                                label: 'hotel_detail.restaurant'.tr,
                                isLoading: controller.isLoadingFacilities.value,
                              ),
                              CommonFacilityItem(
                                icon: Icons.pool,
                                label: 'hotel_detail.pool'.tr,
                                isLoading: controller.isLoadingFacilities.value,
                              ),
                              CommonFacilityItem(
                                icon: Icons.support_agent,
                                label: 'hotel_detail.twenty_four_hours'.tr,
                                isLoading: controller.isLoadingFacilities.value,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSpaces.heightLarge),

                        Text(
                          'hotel_detail.description'.tr,
                          style: MyTextStyle.normalTitleText(size: 16),
                        ),
                        SizedBox(height: AppSpaces.heightSmall),

                        Obx(() {
                          final isExpanded =
                              controller.isDescriptionExpanded.value;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hotel.description,
                                maxLines: isExpanded ? null : 2,
                                overflow: isExpanded
                                    ? TextOverflow.visible
                                    : TextOverflow.ellipsis,
                                style: MyTextStyle.smallTitleText(
                                  color: AppColors.grey600,
                                  fontWeight: FontWeight.w600,
                                  size: 14,
                                ),
                              ),
                              SizedBox(height: AppSpaces.heightVerySmall),
                              GestureDetector(
                                onTap: () => controller.toggleDescription(),
                                child: Text(
                                  isExpanded
                                      ? 'hotel_detail.read_less'.tr
                                      : 'hotel_detail.read_more'.tr,
                                  style: MyTextStyle.normalTitleText(
                                    color: AppColors.primary,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                        SizedBox(height: AppSpaces.heightLarge),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'hotel_detail.location'.tr,
                              style: MyTextStyle.normalTitleText(size: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.nearbyMap);
                              },
                              child: Text(
                                'hotel_detail.open_map'.tr,
                                style: MyTextStyle.smallTitleText(
                                  color: AppColors.primary,
                                  size: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpaces.heightMedium),
                        NearYouMapCard(
                          areaName: hotel.location,
                          iconAsset: AppImages.locationIcon,
                          showAddressDetails: true,
                        ),
                        SizedBox(height: AppSpaces.heightLarge),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'hotel_detail.reviews'.tr,
                              style: MyTextStyle.normalTitleText(size: 18),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const HotelReviewsView());
                              },
                              child: Text(
                                'hotel_detail.see_all'.tr,
                                style: MyTextStyle.smallTitleText(
                                  color: AppColors.primary,
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpaces.heightMedium),
                        const HotelReviewTile(
                          author: "Kim Borrdy",
                          reviewText: "Amazing! The room is good.",
                          rating: 4.5,
                        ),
                        const HotelReviewTile(
                          author: "Mirai Kamazuki",
                          reviewText: "The service is on point.",
                          rating: 5.0,
                        ),
                        SizedBox(height: AppSpaces.heightLarge),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'hotel_detail.recommendation'.tr,
                              style: MyTextStyle.normalTitleText(
                                fontWeight: FontWeight.bold,
                                size: 16,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'hotel_detail.see_all'.tr,
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                            itemBuilder: (context, index) {
                              final recommendedHotel =
                                  HotelServices.allHotels[index];
                              return BestTodayCard(hotel: recommendedHotel);
                            },
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 4,
                left: AppSpaces.paddingSmall,
                right: AppSpaces.paddingSmall,
                bottom: 12,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryBlack.withOpacity(0.45),
                    AppColors.transparent,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.primaryWhite,
                      size: 22,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  Text(
                    'hotel_detail.title'.tr,
                    style: const TextStyle(
                      color: AppColors.primaryWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.more_vert,
                      color: AppColors.primaryWhite,
                      size: 22,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BookingBottomBar(
              hotel: hotel,
              onBookingPressed: () {
                Get.toNamed(Routes.requestToBook, arguments: hotel);
              },
            ),
          ),
        ],
      ),
    );
  }
}