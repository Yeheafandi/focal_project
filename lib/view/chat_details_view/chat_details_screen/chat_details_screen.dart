import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/chat_details_view/chat_details_controller/chat_details_controller.dart';
import 'package:focal_project/view/chat_details_view/widgets/chat_bubble.dart';

import 'package:get/get.dart';

class ChatDetailsScreen extends GetView<ChatDetailsController> {
  const ChatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: AppSpaces.widthLarge),
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: AppColors.primaryBlack),
        ),
        title: Text('Chat', style: MyTextStyle.normalTitleText()),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: AppSpaces.widthLarge),
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: AppColors.primaryBlack),
          ),
        ],
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpaces.widthLarge),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: AppSpaces.radiusExtraLarge,
                backgroundImage: NetworkImage(controller.receiverImage),
              ),
              title: Text(
                controller.receiverName,
                style: MyTextStyle.normalTitleText(),
              ),
              subtitle: Text(
                'Online',
                style: MyTextStyle.smallTitleText().copyWith(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      size: AppSpaces.heightLarge,
                      Icons.videocam_outlined,
                      color: AppColors.primaryBlack,
                    ),
                    onPressed: () {
                      controller.goToVideoCall();
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      size: AppSpaces.heightLarge,
                      Icons.call_outlined,
                      color: AppColors.primaryBlack,
                    ),
                    onPressed: () {
                      controller.goToVoiceCall();
                    },
                  ),
                ],
              ),
            ),

            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpaces.heightLarge,
                  ),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(message: controller.messages[index]);
                  },
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: AppSpaces.heightNormal),
              decoration: const BoxDecoration(color: AppColors.primaryWhite),
              child: Container(
                padding: const EdgeInsets.only(left: AppSpaces.widthNormal),
                decoration: BoxDecoration(
                  color: AppColors.grey200,
                  borderRadius: BorderRadius.circular(
                    AppSpaces.radiusExtraLarge,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.attach_file, color: Colors.grey),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: controller.messageInputController,
                        decoration: InputDecoration(
                          hintText: 'Write a reply',
                          hintStyle: MyTextStyle.smallTitleText(),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.sendMessage,
                      child: const CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.primary,
                        child: Icon(
                          Icons.send,
                          color: AppColors.primaryWhite,
                          size: AppSpaces.heightLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
