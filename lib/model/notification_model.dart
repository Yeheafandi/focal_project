class NotificationModel {
  final int id;
  final String image;
  final String title;
  final String time;
  final String category;
  final String section;

  NotificationModel({
    required this.id,
    required this.image,
    required this.title,
    required this.time,
    required this.category,
    required this.section,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json["id"],
      image: json["image"],
      title: json["title"],
      time: json["time"],
      category: json["category"],
      section: json["section"],
    );
  }
}
