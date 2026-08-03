import 'package:focal_project/core/services/hotel_services.dart';
import 'package:focal_project/model/hotel_model.dart';
import 'package:focal_project/model/my_favorite_model.dart';
import 'package:get/get.dart';

class MyFavoriteService extends GetxService{
final favorites = <HotelModel>[].obs;
  void toggleFavorite(HotelModel hotel) {

    if (favorites.contains(hotel)) {
      hotel.isFavorite = false;
      favorites.remove(hotel);
    } else {
      hotel.isFavorite = true;
      favorites.add(hotel);
    }

    favorites.refresh();
  }


  bool isFavorite(HotelModel hotel) {
    return favorites.contains(hotel);
  }

  void refreshTranslations() {
    if (favorites.isEmpty) return;

    final translatedHotels = {
      for (final hotel in HotelServices.allHotels) hotel.id: hotel,
    };

    for (var i = 0; i < favorites.length; i++) {
      final translatedHotel = translatedHotels[favorites[i].id];
      if (translatedHotel != null) {
        favorites[i] = translatedHotel;
      }
    }

    favorites.refresh();
  }
}
