class ChatModel {
  final int id;

  final String name;

  final String image;

  final String lastMessage;

  final String time;

  final int unreadCount;

  ChatModel({
    required this.id,
    required this.name,
    required this.image,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      lastMessage: json['lastMessage'],
      time: json['time'],
      unreadCount: json['unreadCount'],
    );
  }
}
