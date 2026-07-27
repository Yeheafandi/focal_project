import 'package:flutter/material.dart';
import 'package:focal_project/view/nearby_map_view/nearby_map_view_controller/nearby_map_view_controller.dart';
import 'package:focal_project/view/nearby_map_view/nearby_map_view_widgets/map_hotel_card.dart';
import 'package:focal_project/view/nearby_map_view/nearby_map_view_widgets/map_shimmer_loading.dart';
import 'package:focal_project/widgets/custom_search_bar.dart';
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
                CustomCircleIconButton(
                  icon: Icons.arrow_back_sharp,
                  onPressed: () => Get.back(),
                ),
                Text(
                  "Nearby Hotel",
                  style: MyTextStyle.normalTitleText(
                    size: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlack,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {},
                  iconSize: 24.0,
                ),
              ],
            ),
          ),

          Positioned(
            top: 115,
            left: AppSpaces.paddingLarge,
            right: AppSpaces.paddingLarge,
            child: CustomSearchBar(
              hintText: "Search...",
              onChanged: (value) {
                controller.searchHotels(value); 
              },
              onSubmitted: (value) {
                controller.searchHotels(value);
              },
              onFilterTap: () {},
              onResetTap: () {
                controller.searchHotels('');
              },
              isFilterApplied: false,
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
