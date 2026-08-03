import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/model/booking_details_model.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'booking_info_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingInfoCard extends StatelessWidget {
  const BookingInfoCard({super.key, required this.booking});

  final BookingDetailsModel booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [
          BookingInfoItem(
            iconName: AppIcons.calendar,
            title: "booking_details.check_in".tr,
            value: booking.checkIn,
          ),

          SizedBox(height: AppSpaces.heightSmall),

          BookingInfoItem(
            title: "booking_details.check_out".tr,
            value: booking.checkOut,
            iconName: AppIcons.calendar,
          ),

          SizedBox(height: AppSpaces.heightSmall),

          BookingInfoItem(
            iconName: AppIcons.user,
            title: "booking_details.guests".tr,
            value: booking.guests.toString(),
          ),

          SizedBox(height: AppSpaces.heightSmall),

          BookingInfoItem(
            iconName: AppIcons.building,
            title: "booking_details.room_type".tr,
            value: booking.roomType,
          ),

          SizedBox(height: AppSpaces.heightSmall),

          BookingInfoItem(
            iconName: AppIcons.call,
            title: "booking_details.phone".tr,
            value: booking.phone,
          ),
        ],
      ),
    );
  }
}
