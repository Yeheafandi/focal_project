import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.name,
    required this.image,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
  });

  final String name;
  final String image;
  final String lastMessage;
  final String time;
  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: NetworkImage(image),
      ),

      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

      subtitle: Text(lastMessage),

      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(time),

          const SizedBox(height: 6),

          if (unreadCount > 0)
            CircleAvatar(
              radius: 10,
              child: Text(
                unreadCount.toString(),
                style: const TextStyle(fontSize: 11),
              ),
            ),
        ],
      ),
    );
  }
}