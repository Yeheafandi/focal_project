class HotelModel {
  final String id;
  final String name;
  final String location;
  final double pricePerNight;
  final double? oldPricePerNight; 
  final double rating;
  final int? reviewsCount; 
  final String imageUrl;
  final double? latitude;   
  final double? longitude;  
  bool isFavorite;

  HotelModel({
    required this.id,
    required this.name,
    required this.location,
    required this.pricePerNight,
    this.oldPricePerNight,
    required this.rating,
    this.reviewsCount,
    required this.imageUrl,
    this.latitude,         
    this.longitude,         
    this.isFavorite = false,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      pricePerNight: (json['price_per_night'] as num).toDouble(),
      oldPricePerNight: json['old_price_per_night'] != null 
          ? (json['old_price_per_night'] as num).toDouble() 
          : null,
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: json['reviews_count'],
      imageUrl: json['image_url'] ?? '',
      latitude: json['latitude'] != null ? (json['latitude'] as num).toDouble() : null,
      longitude: json['longitude'] != null ? (json['longitude'] as num).toDouble() : null,
      isFavorite: json['is_favorite'] ?? false,
    );
  }
}