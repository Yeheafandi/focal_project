import 'package:focal_project/view/chat_details_view/chat_details_controller/chat_details_controller.dart';
import 'package:get/get.dart';
import 'package:focal_project/core/services/chat_details_service.dart';

class ChatDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatDetailsService>(() => ChatDetailsService());
    
    Get.lazyPut<ChatDetailsController>(
      () => ChatDetailsController(
        chatId: Get.arguments?['chatId'] ?? 1,
        receiverName: Get.arguments?['name'] ?? 'Jhone Endrue',
        receiverImage: Get.arguments?['image'] ?? 'https://...',
        service: Get.find(),
      ),
    );
  }
}