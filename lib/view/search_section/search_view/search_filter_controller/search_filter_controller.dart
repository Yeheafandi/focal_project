import 'package:flutter/material.dart';
import 'package:focal_project/core/services/hotel_services.dart';
import 'package:get/get.dart';
import 'package:focal_project/model/hotel_model.dart';

class SearchFilterController extends GetxController {
  final TextEditingController searchTxtController = TextEditingController();

  var isSearchActive = false.obs;
  var isFilterApplied = false.obs;
  var selectedCategory = "All".obs;

  var selectedGuests = "3 Guest (2 Adult, 1 Childern)".obs;
  var priceRange = const RangeValues(0.0, 500.0).obs;
  var isInstantBook = false.obs;
  var selectedLocation = "San Diego".obs;
  var selectedFacilities = <String>[].obs;
  var selectedRating = 4.obs;

var recentSearches = RxList<Map<String, String>>([
  {"title": "Golden Sands Retreat", "location": "Clearwater, FL"},
  {"title": "Crystal Peak Lodge", "location": "Aspen, CO"},
  {"title": "Coral Bay Resort", "location": "Miami, FL"},
]);

  var recentlyViewedHotels = <HotelModel>[].obs;
  var searchResults = <HotelModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchInitialData();
  }

  void fetchInitialData() {
    recentlyViewedHotels.assignAll(HotelServices.allHotels.take(3).toList());
  }

  void executeSearchAndFilter() {
    isSearchActive.value = true;
    final query = searchTxtController.text.trim().toLowerCase();

    List<HotelModel> filtered = HotelServices.allHotels.where((hotel) {
      bool matchesQuery =
          query.isEmpty ||
          hotel.name.toLowerCase().contains(query) ||
          hotel.location.toLowerCase().contains(query);

      bool matchesCategory =
          selectedCategory.value == "All" ||
          hotel.category.toLowerCase() == selectedCategory.value.toLowerCase();

      bool matchesPrice =
          hotel.pricePerNight >= priceRange.value.start &&
          hotel.pricePerNight <= priceRange.value.end;

      bool matchesRating = hotel.rating >= selectedRating.value;

      return matchesQuery && matchesCategory && matchesPrice && matchesRating;
    }).toList();

    searchResults.assignAll(filtered);

    if (query.isNotEmpty) {
      final text = searchTxtController.text.trim();

      bool exists = recentSearches.any(
        (element) => element["title"]?.toLowerCase() == text.toLowerCase(),
      );

      if (!exists) {
        String matchedLocation = filtered.isNotEmpty
            ? filtered.first.location
            : selectedLocation.value;

        recentSearches.insert(0, {"title": text, "location": matchedLocation});
      }
    }
  }

  void clearSearch() {
    searchTxtController.clear();
    isSearchActive.value = false;
    isFilterApplied.value = false;
    searchResults.clear();
  }

  void resetFilters() {
    priceRange.value = const RangeValues(0.0, 500.0);
    isInstantBook.value = false;
    selectedLocation.value = "San Diego";
    selectedFacilities.clear();
    selectedRating.value = 4;
    isFilterApplied.value = false;
    selectedCategory.value = "All";
    executeSearchAndFilter();
  }
}
