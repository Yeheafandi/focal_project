import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/model/message_model.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin:  EdgeInsets.symmetric(vertical: AppSpaces.heightSmall),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Column(
          crossAxisAlignment: isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              padding:  EdgeInsets.symmetric(
                horizontal: AppSpaces.widthNormal,
                vertical: AppSpaces.heightMedium,
              ),
              decoration: BoxDecoration(
                color: isMe ? AppColors.primaryBlue : AppColors.formFiled,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(14),
                  topRight: const Radius.circular(14),
                  bottomLeft: Radius.circular(isMe ? 14 : 0),
                  bottomRight: Radius.circular(isMe ? 0 : 14),
                ),
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: isMe ? AppColors.textWhite : AppColors.primaryBlack,
                  fontSize: 14,
                  height: 1.4,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
             SizedBox(height: AppSpaces.heightSmall),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message.time,
                  style: MyTextStyle.smallTitleText().copyWith(
                    color: AppColors.grey500,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                if (isMe) ...[
                   SizedBox(width: AppSpaces.heightSmall),
                  const Icon(
                    Icons.done_all,
                    size: 16,
                    color: AppColors.primary,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
