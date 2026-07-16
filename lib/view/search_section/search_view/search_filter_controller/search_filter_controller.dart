import 'package:flutter/material.dart';
import 'package:focal_project/model/hotel_model.dart';
import 'package:get/get.dart';

class SearchFilterController extends GetxController {
  final TextEditingController searchTxtController = TextEditingController();

  var isSearchActive = false.obs;
  var isFilterApplied = false.obs;
  var selectedCategory = "All".obs;

  var selectedGuests = "3 Guest (2 Adult, 1 Childern)".obs;
  var priceRange = const RangeValues(0.0, 80.0).obs;
  var isInstantBook = false.obs;
  var selectedLocation = "San Diego".obs;
  var selectedFacilities = <String>[].obs;
  var selectedRating = 4.obs;

  var recentSearches = <String>[
    "Golden Sands Retreat",
    "Crystal Peak Lodge",
    "Coral Bay Resort",
  ].obs;

  var recentlyViewedHotels = <HotelModel>[].obs;
  var searchResults = <HotelModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchInitialData();
  }

  void fetchInitialData() {}

  Future<void> executeSearchAndFilter() async {
    isSearchActive.value = true;

    Map<String, dynamic> queryParameters = {
      "query": searchTxtController.text,
      "category": selectedCategory.value,
      "guests": selectedGuests.value,
      "min_price": priceRange.value.start,
      "max_price": priceRange.value.end,
      "instant_book": isInstantBook.value,
      "location": selectedLocation.value,
      "facilities": selectedFacilities.toList(),
      "rating": selectedRating.value,
    };

    print("Sending to API: $queryParameters");

    // var results = await _searchRepository.getHotels(queryParameters);
    // searchResults.assignAll(results);
  }

  void clearSearch() {
    searchTxtController.clear();
    isSearchActive.value = false;
    isFilterApplied.value = false;
    searchResults.clear();
  }

  void resetFilters() {
    priceRange.value = const RangeValues(0.0, 80.0);
    isInstantBook.value = false;
    selectedLocation.value = "San Diego";
    selectedFacilities.clear();
    selectedRating.value = 4;
    isFilterApplied.value = false;
  }
}
