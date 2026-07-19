class MyFavoriteModel {
  final int id;
  final String image;
  final String title;
  final String location;
  final double rating;
  final int reviews;
  final int price;
  bool isFavorite;
  final String category;

  MyFavoriteModel({
    required this.id,
    required this.image,
    required this.title,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.isFavorite,
    required this.category,
  });

  factory MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    return MyFavoriteModel(
      id: json["id"],
      image: json["image"],
      title: json["title"],
      location: json["location"],
      rating: json["rating"].toDouble(),
      reviews: json["reviews"],
      price: json["price"],
      isFavorite: json["isFavorite"],
      category: json["category"],
    );
  }
}