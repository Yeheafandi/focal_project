class NotificationModel {
  final int id;
  final String? image;
  final String? assetIcon;
  final String title;
  final String time;
  final String category;
  final String section;
  final String body;

  NotificationModel({
    required this.id,
    this.image,
    required this.title,
    required this.body,
    required this.time,
    required this.category,
    required this.section,
    this.assetIcon,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json["id"],
      image: json["image"],
      assetIcon: json["assetIcon"],
      title: json["title"],
      body: json["body"],
      time: json["time"],
      category: json["category"],
      section: json["section"],
    );
  }
}
