import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/model/notification_model.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notification,
    this.showDivider = true,
  });

  final NotificationModel notification;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpaces.heightNormal),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.grey200,
            child: notification.assetIcon != null
                ? SvgPicture.asset(
                    notification.assetIcon!,
                    width: 24,
                    height: 24,
                  )
                : ClipOval(
                    child: Image.network(
                      notification.image!,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),

          SizedBox(width: AppSpaces.widthMedium),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.body,
                  style: MyTextStyle.smallTitleText(
                    color: AppColors.black87,
                    fontWeight: FontWeight.w400,
                    size: 14,
                  ),
                ),

                SizedBox(height: AppSpaces.heightVerySmall),

                Text(
                  notification.time,
                  style: MyTextStyle.smallTitleText(
                    color: AppColors.grey500,
                    size: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: AppSpaces.heightMedium),
                if (showDivider) const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
