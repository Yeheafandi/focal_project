import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/model/my_favorite_model.dart';
import 'package:get/get.dart';
import 'package:focal_project/core/services/favorite_service.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteController({required MyFavoriteService service})
    : _service = service;
  final isLoading = true.obs;
  final MyFavoriteService _service;

  final favorites = <MyFavoriteModel>[].obs;

  final selectedCategory = "all".obs;

  final categories = ["all", "hotels", "resorts", "villas", "apartment"];
  final List<String?>categoriesIcons = [
    null,
    AppIcons.villaIcon,
    AppIcons.hotelIcon,
    AppIcons.residentialIcon,
  ];

  @override
  void onInit() {
    super.onInit();

    fetchFavorites();
  }

  void changeCategory(String category) {
    selectedCategory.value = category;

    final all = _service.getFavorites();

    if (category == "all") {
      favorites.assignAll(all);
      return;
    }

    favorites.assignAll(all.where((e) => e.category == category));
  }

  void toggleFavorite(MyFavoriteModel hotel) {
    hotel.isFavorite = false;

    favorites.remove(hotel);

    favorites.refresh();
  }

  void fetchFavorites() async {
    try {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 6));

      favorites.assignAll(_service.getFavorites());
    } finally {
      isLoading.value = false;
    }
  }
}
