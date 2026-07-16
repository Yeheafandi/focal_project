import 'package:get/get.dart';
import 'package:focal_project/model/chat_model.dart';
import 'package:focal_project/core/services/message_service.dart';

class MessageController extends GetxController {
  MessageController({
    required MessageService service,
  }) : _service = service;

  final MessageService _service;

  late List<ChatModel> chats;

  @override
  void onInit() {
    super.onInit();

    chats = _service.getChats();
  }
}