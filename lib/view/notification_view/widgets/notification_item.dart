import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/model/notification_model.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notification,
  });

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppSpaces.heightNormal,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: AppSpaces.radiusExtraLarge,
            backgroundImage: NetworkImage(notification.image),
          ),

          const SizedBox(width: AppSpaces.widthMedium),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: MyTextStyle.smallTitleText(),
                ),

                const SizedBox(height: AppSpaces.heightVerySmall,),

                Text(
                  notification.time,
                  style: MyTextStyle.smallTitleText().copyWith(
                    color: AppColors.grey500,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),const SizedBox(height: AppSpaces.heightLarge,),
                Divider()
              ],
            ),
          ),
        ],
      ),
    );
  }
}