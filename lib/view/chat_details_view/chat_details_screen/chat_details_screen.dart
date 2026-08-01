import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/booking_details_view/widgets/hotel_card.dart';
import 'package:focal_project/view/chat_details_view/chat_details_controller/chat_details_controller.dart';
import 'package:focal_project/view/chat_details_view/widgets/chat_bubble.dart';
import 'package:focal_project/widgets/custom_app_bar.dart';

import 'package:get/get.dart';

class ChatDetailsScreen extends GetView<ChatDetailsController> {
  const ChatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryWhite,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 50,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpaces.widthLarge),
              child: Column(
                children: [
                  CustomAppBar(title: 'Chat',action: SvgPicture.asset(AppIcons.more)),
                  SizedBox(height: AppSpaces.heightNormal),
              
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 60,
                      height: 60,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryBlue,
                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: AppSpaces.radiusExtraExtraLarge28,
                        backgroundImage: NetworkImage(controller.receiverImage),
                      ),
                    ),
                    title: Text(
                      controller.receiverName,
                      style: MyTextStyle.normalTitleText(),
                    ),
                    subtitle: Text(
                      'Online',
                      style: MyTextStyle.smallTitleText(
                        color: AppColors.primary,
                        size: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          child: SvgPicture.asset(
                            AppIcons.video,
                            width: 16,
                            height: 16,
                          ),
                          onTap: () {
                            controller.goToVideoCall();
                          },
                        ),
                        SizedBox(width: AppSpaces.widthLarge),
                        InkWell(
                          child: SvgPicture.asset(
                            AppIcons.audio,
                            width: 16,
                            height: 16,
                          ),
                          onTap: () {
                            controller.goToVoiceCall();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpaces.heightVerySmall),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpaces.widthLarge),
              child: Column(
                children: [
                  SizedBox(height: AppSpaces.heightLarge),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.boardingsub),
                      borderRadius: BorderRadius.circular(
                        AppSpaces.radiusMedium,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: AppSpaces.paddingSmall,
                      
                    ),
                    child: HotelCard(
                      hotelName: "The Aston Vill Hotel",
                      hotelImage:
                          "https://images.unsplash.com/photo-1566073771259-6a8506099945",
                      location: "Vlou Point, Mickleton",
                      price: 120,
                      rating: 4.7,
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSpaces.heightLarge,
                        ),
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          return ChatBubble(
                            message: controller.messages[index],
                          );
                        },
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(bottom: AppSpaces.heightNormal),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryWhite,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: AppSpaces.widthNormal),
                      decoration: BoxDecoration(
                        color: AppColors.grey200,
                        borderRadius: BorderRadius.circular(
                          AppSpaces.radiusExtraExtraLarge28,
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.paperclip),
                          SizedBox(width: AppSpaces.widthSmall),
                          Expanded(
                            child: TextField(
                              controller: controller.messageInputController,
                              decoration: InputDecoration(
                                hintText: 'Write a reply',
                                hintStyle: MyTextStyle.smallTitleText(
                                  color: AppColors.grey500,
                                  fontWeight: FontWeight.w400,
                                  size: 14,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: controller.sendMessage,
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: AppColors.primaryBlue,
                              child: SvgPicture.asset(AppIcons.send),
                            ),
                          ),
                        ],
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
