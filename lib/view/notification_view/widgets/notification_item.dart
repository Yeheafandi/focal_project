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
            radius: AppSpaces.radiusExtraLarge,
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
                      width: 56,
                      height: 56,
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
                  notification.title,
                  style: MyTextStyle.smallTitleText().copyWith(
                    color: AppColors.primaryBlack,
                  ),
                ),

                SizedBox(height: AppSpaces.heightVerySmall),

                Text(
                  notification.time,
                  style: MyTextStyle.smallTitleText().copyWith(
                    color: AppColors.grey500,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
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
