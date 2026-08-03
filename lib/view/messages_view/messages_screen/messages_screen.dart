import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/view/messages_view/messages_controller/messages_controller.dart';
import 'package:focal_project/view/messages_view/widgets/chat_item.dart';
import 'package:focal_project/widgets/custom_app_bar.dart';
import 'package:focal_project/widgets/custom_search_bar.dart';
import 'package:get/get.dart';

class MessageScreen extends GetView<MessageController> {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        shape: CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add, color: AppColors.primaryWhite),
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: AppSpaces.widthLarge),

        child: Column(
          children: [
            CustomAppBar(title: 'messages.title'.tr, showBackButton: false),
            SizedBox(height: AppSpaces.heightLarge),
            CustomSearchBar(onFilterTap: () => ''),

            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    Divider(height: 8, color: AppColors.grey200),
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
    );
  }
}
