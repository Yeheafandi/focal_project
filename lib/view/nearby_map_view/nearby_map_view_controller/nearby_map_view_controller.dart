import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/core/services/hotel_services.dart';
import 'package:focal_project/model/hotel_model.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class NearbyMapViewController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxList<HotelModel> nearbyHotels = <HotelModel>[].obs;
  final Rxn<HotelModel> selectedHotel = Rxn<HotelModel>();

  final MapController mapController = MapController();
  final RxList<Marker> markers = <Marker>[].obs;

  final LatLng initialCameraPosition = const LatLng(32.7157, -117.1611);

  @override
  void onInit() {
    super.onInit();
    fetchNearbyHotels();
  }

  Future<void> fetchNearbyHotels() async {
    isLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      final validHotels = HotelServices.allHotels
          .where((h) => h.latitude != null && h.longitude != null)
          .toList();

      nearbyHotels.assignAll(validHotels);

      if (nearbyHotels.isNotEmpty) {
        selectedHotel.value = nearbyHotels[0];
      }

      generateMarkers();
    } finally {
      isLoading(false);
    }
  }

  void searchHotels(String query) {
    if (query.trim().isEmpty) {
      fetchNearbyHotels();
      return;
    }

    final filtered = HotelServices.allHotels.where((hotel) {
      final matchesName = hotel.name.toLowerCase().contains(
        query.toLowerCase(),
      );
      final matchesLocation = hotel.location.toLowerCase().contains(
        query.toLowerCase(),
      );
      final hasCoordinates = hotel.latitude != null && hotel.longitude != null;
      return (matchesName || matchesLocation) && hasCoordinates;
    }).toList();

    nearbyHotels.assignAll(filtered);

    if (nearbyHotels.isNotEmpty) {
      selectedHotel.value = nearbyHotels[0];
      animateToLocation(nearbyHotels[0].latitude!, nearbyHotels[0].longitude!);
    } else {
      selectedHotel.value = null;
    }

    generateMarkers();
  }

  void generateMarkers() {
    markers.clear();
    for (var hotel in nearbyHotels) {
      if (hotel.latitude != null && hotel.longitude != null) {
        markers.add(
          Marker(
            point: LatLng(hotel.latitude!, hotel.longitude!),
            width: 70,
            height: 70,
            child: GestureDetector(
              onTap: () {
                selectedHotel.value = hotel;
                animateToLocation(hotel.latitude!, hotel.longitude!);
              },
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 3),
                      image: DecorationImage(
                        image: NetworkImage(hotel.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryWhite,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: AppColors.amber,
                            size: 16,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            "${hotel.rating}",
                            style: MyTextStyle.smallTitleText(
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
  }

  void animateToLocation(double lat, double lng) {
    mapController.move(LatLng(lat, lng), 14.5);
  }
}
