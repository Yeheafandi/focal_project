import 'package:focal_project/model/my_favorite_model.dart';
import 'package:get/get.dart';
import 'package:focal_project/core/services/favorite_service.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteController({required MyFavoriteService service})
    : _service = service;
  final isLoading = true.obs;
  final MyFavoriteService _service;

  final favorites = <MyFavoriteModel>[].obs;

  final selectedCategory = "All".obs;

  final categories = ["All", "Hotels", "Resorts", "Villas", "Apartment"];

  @override
  void onInit() {
    super.onInit();

    fetchFavorites();
  }

  void changeCategory(String category) {
    selectedCategory.value = category;

    final all = _service.getFavorites();

    if (category == "All") {
      favorites.assignAll(all);
      return;
    }

    favorites.assignAll(all.where((e) => e.category == category));
  }

  void toggleFavorite(MyFavoriteModel hotel) {
    hotel.isFavorite = !hotel.isFavorite;

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
