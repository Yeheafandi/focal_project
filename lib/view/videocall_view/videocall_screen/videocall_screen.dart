import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/videocall_view/videocall_controller/videocall_controller.dart';
import 'package:focal_project/view/videocall_view/widgets/action_button.dart';
import 'package:get/get.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("START BUILD");
    final VideoCallController controller = Get.find<VideoCallController>();
    print("CONTROLLER OK");
    print("NAME = ${controller.name}");
    print("IMAGE = ${controller.image}");
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Image.network(controller.image, fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    AppImages.userPhotoVideoCall,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                color: AppColors.primaryWhite,
                child: Container(padding: EdgeInsets.symmetric(horizontal: 46),
                  height: 92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionButton(
                        iconName: AppIcons.voice,
                        state: controller.isMicMuted,
                        onTap: controller.toggleMic,
                      ),

                      ActionButton(
                        iconName: AppIcons.volumeUp,
                        state: controller.isSpeakerOn,
                        onTap: controller.toggleSpeaker,
                      ),

                      ActionButton(
                        iconName: AppIcons.video,
                        state: controller.isCameraOff,
                        onTap: controller.toggleCamera,
                        width: 16,
                        height: 16,
                      ),

                      ActionButton(
                        iconName: AppIcons.endCall,
                        onTap: controller.endCall,
                        backgroundColor: AppColors.red,
                        iconColor: AppColors.primaryWhite,
                        width: 32,
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 120,
            left: 24,
            right: 24,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpaces.widthLarge,
                vertical: AppSpaces.heightMedium,
              ),
              decoration: BoxDecoration(
                color: AppColors.black87,
                borderRadius: BorderRadius.circular(
                  50,
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 23,
                    backgroundImage: NetworkImage(controller.image),
                  ),

                  SizedBox(width: AppSpaces.widthSmall),

                  Column(
                    children: [
                      Text(
                        controller.name,
                        style: MyTextStyle.normalTitleText().copyWith(
                          color: AppColors.textWhite,
                        ),
                      ),
                      Text(
                        'Tour guide, sweden',
                        style: MyTextStyle.smallTitleText(
                          color: AppColors.grey400,
                          size: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  const Icon(Icons.circle, color: AppColors.red, size: 9),

                  SizedBox(width: AppSpaces.widthSmall),

                  Obx(
                    () => Text(
                      controller.callDuration.value,
                      style: MyTextStyle.smallTitleText().copyWith(
                        color: AppColors.grey300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
