import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/audiocall_view/audiocall_controller/audiocall_controller.dart';
import 'package:focal_project/view/videocall_view/widgets/action_button.dart'; // نستخدم نفس الوجت المشتركة
import 'package:get/get.dart';

class AudioCallScreen extends StatelessWidget {
  const AudioCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final AudioCallController controller = Get.find<AudioCallController>();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
         
          Image.network(controller.image, fit: BoxFit.cover),

          Positioned(
            top: 60,
            left: 24,
            child: GestureDetector(
              onTap: () => controller.endCall(),
              child: const CircleAvatar(
                backgroundColor: AppColors.primaryWhite,
                radius: 22,
                child: Icon(Icons.arrow_back, color: AppColors.primaryBlack),
              ),
            ),
          ),

          
          Positioned(
            bottom: 43,
            left: 24,
            right: 24,
            child: Container(
              padding:  EdgeInsets.symmetric(
                horizontal: AppSpaces.widthLarge,
                vertical: AppSpaces.heightMedium,
              ),
              decoration: BoxDecoration(
                color: AppColors.black87, 
                borderRadius: BorderRadius.circular(AppSpaces.radiusExtraExtraLarge28),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: AppSpaces.radiusExtraLarge,
                    backgroundImage: NetworkImage(controller.image),
                  ),
                   SizedBox(width: AppSpaces.widthNormal),
                  Text(
                    controller.name,
                    style: MyTextStyle.normalTitleText().copyWith(
                      color: AppColors.textWhite,
                      fontSize: 15,
                    ),
                    
                  ),Spacer(),

                  const Icon(Icons.circle, color: AppColors.red, size: 12),
                   SizedBox(width: AppSpaces.widthSmall),
                  Obx(
                    () => Text(
                      controller.callDuration.value,
                      style: MyTextStyle.smallTitleText().copyWith(
                        color: AppColors.textWhite,
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 195,
            left: 152,
            right: 152,

            child: ActionButton(width: 32,height: 32,
              iconName: AppIcons.endCall,
              onTap: controller.endCall,
              backgroundColor: AppColors.red,
              iconColor: AppColors.primaryWhite,
            ),
          ),
          Positioned(
            bottom: 145,
            left: 43,
            right: 43,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  iconName: AppIcons.voice,
                  state: controller.isMicMuted,
                  onTap: controller.toggleMic,
                  backgroundColor: AppColors.primaryWhite,
                  iconColor: AppColors.primaryBlack,
                ),

                ActionButton(width: 16,height: 16,
                  iconName: AppIcons.video,
                  state: controller.isCameraOff,
                  onTap: controller.toggleCamera,
                  backgroundColor: AppColors.primaryWhite,
                  iconColor: AppColors.primaryBlack,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
