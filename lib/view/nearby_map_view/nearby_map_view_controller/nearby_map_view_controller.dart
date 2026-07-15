import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
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
      await Future.delayed(const Duration(seconds: 2));

      nearbyHotels.assignAll([
        HotelModel(
          id: "1",
          name: "The Horizon Retreat",
          location: "Los Angeles, CA",
          pricePerNight: 480,
          rating: 4.0,
          imageUrl: "https://images.unsplash.com/photo-1540555700478-4be289fbecef",
          latitude: 32.7180,
          longitude: -117.1650,
        ),
        HotelModel(
          id: "2",
          name: "Elysian Suites",
          location: "San Diego, CA",
          pricePerNight: 320,
          rating: 4.7,
          imageUrl: "https://images.unsplash.com/photo-1584132967334-10e028bd69f7",
          latitude: 32.7120,
          longitude: -117.1610,
        ),
        HotelModel(
          id: "3",
          name: "Opal Grove Inn",
          location: "San Diego, CA",
          pricePerNight: 190,
          rating: 4.5,
          imageUrl: "https://images.unsplash.com/photo-1566073771259-6a8506099945",
          latitude: 32.7150,
          longitude: -117.1550,
        ),
      ]);

      if (nearbyHotels.isNotEmpty) {
        selectedHotel.value = nearbyHotels[1]; 
      }

      generateMarkers();
    } finally {
      isLoading(false);
    }
  }

  void generateMarkers() {
    markers.clear();
    for (var hotel in nearbyHotels) {
      if (hotel.latitude != null && hotel.longitude != null) {
        markers.add(
          Marker(
            point: LatLng(hotel.latitude!, hotel.longitude!),
            width: 40,
            height: 40,
            child: GestureDetector(
              onTap: () {
                selectedHotel.value = hotel;
                animateToLocation(hotel.latitude!, hotel.longitude!);
              },
              child: const Icon(
                Icons.location_on_sharp,
                color: Colors.redAccent, 
                size: 40,
              ),
            ),
          ),
        );
      }
    }
  }

  void animateToLocation(double lat, double lng) {
    mapController.move(LatLng(lat, lng), 15.0);
  }
}