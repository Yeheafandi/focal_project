import 'dart:async';
import 'package:get/get.dart';

class AudioCallController extends GetxController {
  
  String name = 'Unknown';
  String image = '';

  var isMicMuted = false.obs;
  var isSpeakerOn = false.obs;
  var isCameraOff = true.obs; 

  
  var callDuration = "00:00".obs;
  late Timer _timer;
  int _seconds = 0;

  @override
  void onInit() {
    super.onInit();
    
    if (Get.arguments != null && Get.arguments is Map) {
      name = Get.arguments['name'] ?? 'Unknown';
      image = Get.arguments['image'] ?? '';
    }
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds++;
      int minutes = _seconds ~/ 60;
      int seconds = _seconds % 60;
      callDuration.value =
          "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    });
  }

  void toggleMic() => isMicMuted.value = !isMicMuted.value;
  void toggleSpeaker() => isSpeakerOn.value = !isSpeakerOn.value;
  void toggleCamera() => isCameraOff.value = !isCameraOff.value;

  void endCall() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    Get.back();
    Get.delete<AudioCallController>();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
