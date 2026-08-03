import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/services/favorite_service.dart';
import 'package:focal_project/model/hotel_model.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteController({required MyFavoriteService service})
      : _service = service;

  final isLoading = true.obs;
  final MyFavoriteService _service;

  final selectedCategory = "all".obs;

  final categories = ["all", "villas", "hotels", "apartments"];

  final List<String?> categoriesIcons = [
    null,
    AppIcons.villaIcon,
    AppIcons.hotelIcon,
    AppIcons.residentialIcon,
  ];

  final displayedFavorites = <HotelModel>[].obs;
  RxList<HotelModel> get favorites => _service.favorites;

  void changeCategory(String category) {
    selectedCategory.value = category;

    if (category == "all") {
      displayedFavorites.assignAll(favorites);
      return;
    }

    displayedFavorites.assignAll(
      favorites.where((hotel) => hotel.category == category),
    );
  }

  void toggleFavorite(HotelModel hotel) {
    _service.toggleFavorite(hotel);
    changeCategory(selectedCategory.value);
  }

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    displayedFavorites.assignAll(favorites);
    isLoading.value = false;
  }
}