class UserProfileModel {
  final String name;
  final String avatarUrl;
  final String location;

  UserProfileModel({
    required this.name,
    required this.avatarUrl,
    required this.location,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
      location: json['location'] ?? '',
    );
  }
}