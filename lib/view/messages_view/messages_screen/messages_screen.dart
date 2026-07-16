import 'package:flutter/material.dart';
import 'package:focal_project/view/messages_view/messages_controller/messages_controller.dart';
import 'package:focal_project/view/messages_view/widgets/chat_item.dart';
import 'package:focal_project/view/messages_view/widgets/search_message_field.dart';
import 'package:get/get.dart';

class MessageScreen extends GetView<MessageController> {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              const SearchMessageField(),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: controller.chats.length,

                  itemBuilder: (context, index) {
                    final chat = controller.chats[index];

                    return ChatItem(
                      name: chat.name,
                      image: chat.image,
                      lastMessage: chat.lastMessage,
                      time: chat.time,
                      unreadCount: chat.unreadCount,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
