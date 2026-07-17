import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:get/get.dart';


class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.name,
    required this.image,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
  });

  final String name;
  final String image;
  final String lastMessage;
  final String time;
  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(contentPadding: EdgeInsets.zero,onTap: (){Get.toNamed(
      Routes.chatDetailsScreen,
      arguments: {
        'chatId': 1, 
        'name': name,
        'image': image,
      },
    );},
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(image),
          ),
        
          title: Text(
            name,
            style:MyTextStyle.normalTitleText()
          ),
        
          subtitle: Text(lastMessage,style: MyTextStyle.smallTitleText(),),
        
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
              Text(time,style: MyTextStyle.smallTitleText()),
        
              const SizedBox(height: AppSpaces.heightSmall,),
        
              if (unreadCount > 0)
                CircleAvatar(backgroundColor: AppColors.red,
                  radius: AppSpaces.radiusSmall,
                  child: Text(
                    unreadCount.toString(),
                    style:MyTextStyle.smallTitleText().copyWith(color: AppColors.textWhite),
                  ),
                ),
            ],
          ),
        ),Divider(color: AppColors.grey300,)
      ],
    );
  }
}