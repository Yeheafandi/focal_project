import 'package:flutter/material.dart';
import 'package:focal_project/view/nearby_map_view/nearby_map_view_controller/nearby_map_view_controller.dart';
import 'package:focal_project/view/nearby_map_view/nearby_map_view_widgets/map_hotel_card.dart';
import 'package:focal_project/view/nearby_map_view/nearby_map_view_widgets/map_shimmer_loading.dart';
import 'package:focal_project/widgets/icon_circle_button.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spaces.dart';
import '../../../../core/constants/text_style.dart';

class NearbyMapView extends StatelessWidget {
  final NearbyMapViewController controller = Get.put(NearbyMapViewController());

  NearbyMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Obx(() {
            if (controller.isLoading.value) {
              return const MapShimmerLoading();
            }

            return FlutterMap(
              mapController: controller.mapController,
              options: MapOptions(
                initialCenter: controller.initialCameraPosition,
                initialZoom: 14.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.focal_project',
                ),
                MarkerLayer(markers: controller.markers),
              ],
            );
          }),

          Positioned(
            top: 50,
            left: AppSpaces.paddingLarge,
            right: AppSpaces.paddingLarge,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconCircleButton(
                  icon: Icons.arrow_back_ios_new,
                  onTap: () => Get.back(),
                ),
                Text(
                  "Nearby Hotel",
                  style: MyTextStyle.normalTitleText(
                    size: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlack,
                  ),
                ),
                IconCircleButton(
                  icon: Icons.filter_list,
                  hasCircle: false,
                  onTap: () {},
                  iconSize: 24.0,
                ),
              ],
            ),
          ),

          Positioned(
            top: 115,
            left: AppSpaces.paddingLarge,
            right: AppSpaces.paddingLarge,
            child: Container(
              height: 55,
              padding: EdgeInsets.symmetric(
                horizontal: AppSpaces.paddingNormal,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlack,
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppColors.grey500),
                  SizedBox(width: AppSpaces.widthMedium),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: MyTextStyle.smallTitleText(
                          color: AppColors.grey500,
                          size: 14,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.tune, color: AppColors.grey600),
                ],
              ),
            ),
          ),

          Obx(() {
            if (controller.isLoading.value ||
                controller.selectedHotel.value == null) {
              return const SizedBox.shrink();
            }

            return Positioned(
              bottom: 30,
              left: AppSpaces.paddingLarge,
              right: AppSpaces.paddingLarge,
              child: MapHotelCard(hotel: controller.selectedHotel.value!),
            );
          }),
        ],
      ),
    );
  }
}
