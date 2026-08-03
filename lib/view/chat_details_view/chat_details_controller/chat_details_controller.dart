import 'package:flutter/material.dart';
import 'package:focal_project/bindings/audiocall_binding.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/view/audiocall_view/audiocall_screen/audiocall_screen.dart';
import 'package:get/get.dart';
import 'package:focal_project/model/message_model.dart';
import 'package:focal_project/core/services/chat_details_service.dart';
import 'package:focal_project/view/videocall_view/videocall_screen/videocall_screen.dart';
import 'package:focal_project/view/videocall_view/videocall_controller/videocall_controller.dart';

import 'package:focal_project/bindings/videocall_binding.dart';

// import 'package:focal_project/routes/routes.dart';
class ChatDetailsController extends GetxController {
  ChatDetailsController({
    required this.chatId,
    required this.receiverName,
    required this.receiverImage,
    required ChatDetailsService service,
  }) : _service = service;

  final int chatId;
  final String receiverName;
  final String receiverImage;
  final ChatDetailsService _service;

  final RxList<MessageModel> messages = <MessageModel>[].obs;

  final TextEditingController messageInputController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    messages.assignAll(_service.getMessages(chatId));
  }

  void sendMessage() {
    final text = messageInputController.text.trim();
    if (text.isEmpty) return;

    messages.add(
      MessageModel(
        id: DateTime.now().millisecondsSinceEpoch,
        senderName: 'chat.me'.tr,
        text: text,
        time: '10:32 AM',
        isMe: true,
      ),
    );
    messages.add(
      MessageModel(
        id: DateTime.now().millisecondsSinceEpoch,
        senderName: 'Ahmir',
        text: 'chat.default_response'.tr,
        time: '10:32 AM',
        isMe: false,
      ),
    );

    messageInputController.clear();
  }

  
  void goToVideoCall() {
    print("Pressed video icon");
    Get.to(
      () => const VideoCallScreen(),
      binding: VideoCallBinding(),
      arguments: {'name': receiverName, 'image': receiverImage},
    );
  }

  void goToVoiceCall() {
    Get.to(
      () =>  AudioCallScreen(),binding:AudioCallBinding() ,
      arguments: {'name': receiverName, 'image': receiverImage},
    );
  }

  @override
  void onClose() {
    messageInputController.dispose();
    super.onClose();
  }
}
