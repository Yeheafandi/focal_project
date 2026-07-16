import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_spaces.dart';

class BookingInfoItem extends StatelessWidget {
  const BookingInfoItem({
    super.key,
    required this.title,
    required this.value,
    required this.itemIcon,
  });

  final String title;
  final String value;
  final Icon itemIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            itemIcon,
            SizedBox(width: AppSpaces.widthMedium),
            Text(title),
          ],
        ),

        Text(value),
      ],
    );
  }
}
