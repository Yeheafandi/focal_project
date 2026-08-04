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

  RxList<HotelModel> get favorites => _service.favorites;

  List<HotelModel> get displayedFavorites {
    if (selectedCategory.value == "all") {
      return favorites;
    }
    return favorites
        .where((hotel) => hotel.category == selectedCategory.value)
        .toList();
  }

  void changeCategory(String category) {
    selectedCategory.value = category;
  }

  void toggleFavorite(HotelModel hotel) {
    _service.toggleFavorite(hotel);
  }

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
  }
}