class NearYouModel {
  final double latitude;
  final double longitude;
  final String mapStaticImageUrl; 
  final String areaName;

  NearYouModel({
    required this.latitude,
    required this.longitude,
    required this.mapStaticImageUrl,
    required this.areaName,
  });

  factory NearYouModel.fromJson(Map<String, dynamic> json) {
    return NearYouModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      mapStaticImageUrl: json['map_static_image_url'] ?? '',
      areaName: json['area_name'] ?? '',
    );
  }
}