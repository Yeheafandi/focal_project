import 'package:focal_project/view/videocall_view/videocall_controller/videocall_controller.dart';
import 'package:get/get.dart';

class VideoCallBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut<VideoCallController>(
      () => VideoCallController(),
    );
  }
}