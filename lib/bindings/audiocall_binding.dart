import 'package:get/get.dart';
import 'package:focal_project/view/audiocall_view/audiocall_controller/audiocall_controller.dart';

class AudioCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AudioCallController>(() => AudioCallController(), fenix: true);
  }
}