import 'package:focal_project/model/my_favorite_model.dart';

class MyFavoriteService {
  List<MyFavoriteModel> getFavorites() {
    return [
      MyFavoriteModel(
        id: 1,
        image:
            "https://images.unsplash.com/photo-1566073771259-6a8506099945",
        title: "Eliinate Galian Hotel",
        location: "Chestnut Street, Rome, NY",
        rating: 4.4,
        reviews: 532,
        price: 248,
        isFavorite: true,
        category: "Hotels",
      ),

      MyFavoriteModel(
        id: 2,
        image:
            "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85",
        title: "Cerulean Temple Hotel",
        location: "Chestnut Street, Rome, NY",
        rating: 4.4,
        reviews: 532,
        price: 156,
        isFavorite: true,
        category: "Hotels",
      ),

      MyFavoriteModel(
        id: 3,
        image:
            "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267",
        title: "Double Oak Hotel",
        location: "Chestnut Street, Rome, NY",
        rating: 4.4,
        reviews: 532,
        price: 163,
        isFavorite: true,
        category: "Hotels",
      ),

      MyFavoriteModel(
        id: 4,
        image:
            "https://images.unsplash.com/photo-1578683010236-d716f9a3f461",
        title: "Jade Gem Resort",
        location: "Chestnut Street, Rome, NY",
        rating: 4.4,
        reviews: 532,
        price: 211,
        isFavorite: true,
        category: "Resorts",
      ),
    ];
  }
}