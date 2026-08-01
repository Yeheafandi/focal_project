import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/core/services/notification_firebase_service.dart';
import 'package:focal_project/view/notification_view/notification_controller/notification_controller.dart';
import 'package:focal_project/view/notification_view/widgets/filter_bottom_sheet.dart';
import 'package:focal_project/view/notification_view/widgets/notification_item.dart';
import 'package:focal_project/widgets/custom_app_bar.dart';
import 'package:get/get.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpaces.widthLarge),
        child: Column(
          children: [
            CustomAppBar(title: 'Notifications',action: InkWell(
                  child: SvgPicture.asset(AppIcons.sort),
                  onTap: () {
                    Get.bottomSheet(
                      const FilterBottomSheet(),
                      backgroundColor: Colors.transparent,
                      barrierColor: Colors.black.withOpacity(0.2),
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                    );
                  },
                ),),
            Expanded(
              child: Obx(() {
                final today = controller.notifications
                    .where((e) => e.section == "Today")
                    .toList();
                final yesterday = controller.notifications
                    .where((e) => e.section == "Yesterday")
                    .toList();
                return ListView(
                  children: [
                    SizedBox(height: AppSpaces.heightLarge),

                    Text("Today", style: MyTextStyle.normalTitleText(size: 16,fontWeight: FontWeight.w700,color: AppColors.black87)),

                    SizedBox(height: AppSpaces.heightExtraLarge),

                    ...List.generate(
                      today.length,
                      (index) => NotificationItem(
                        notification: today[index],
                        showDivider: index != today.length - 1,
                      ),
                    ),

                    SizedBox(height: AppSpaces.heightSmall),

                    Text("Yesterday", style: MyTextStyle.normalTitleText(size: 16,fontWeight: FontWeight.w700,color: AppColors.black87)),

                    SizedBox(height: AppSpaces.heightExtraLarge),

                    ...List.generate(
                      yesterday.length,
                      (index) => NotificationItem(
                        notification: yesterday[index],
                        showDivider: index != yesterday.length - 1,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
// this is a way to send payment notification from payment screen 
/*MaterialButton(
                onPressed: () async {
                  final token =
                      Get.find<NotificationFirebaseService>().fcmToken;

                  if (token != null) {
                    await NotificationSender.sendNotificationToSelectToken(
                      fcmToken: token,
                      title: "Payment",
                      body: "Successful",
                    );
                  }
                },
                child: Text('send notification'),
              ),*/