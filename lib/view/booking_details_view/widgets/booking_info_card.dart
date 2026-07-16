import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/model/booking_details_model.dart';
import 'booking_info_item.dart';

class BookingInfoCard extends StatelessWidget {
  const BookingInfoCard({super.key, required this.booking});

  final BookingDetailsModel booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [
          BookingInfoItem(
            itemIcon: Icon(
              Icons.calendar_month_outlined,
              color: AppColors.grey,
            ),
            title: "Check In",
            value: booking.checkIn,
          ),

          SizedBox(height: AppSpaces.heightSmall),

          BookingInfoItem(
            title: "Check Out",
            value: booking.checkOut,
            itemIcon: Icon(
              Icons.calendar_month_outlined,
              color: AppColors.grey,
            ),
          ),

          SizedBox(height: AppSpaces.heightSmall),

          BookingInfoItem(
            itemIcon: Icon(Icons.person_outlined, color: AppColors.grey),
            title: "Guests",
            value: booking.guests.toString(),
          ),

          SizedBox(height: AppSpaces.heightSmall),

          BookingInfoItem(
            itemIcon: Icon(Icons.local_hotel_outlined, color: AppColors.grey),
            title: "Room Type",
            value: booking.roomType,
          ),

          SizedBox(height: AppSpaces.heightSmall),

          BookingInfoItem(
            itemIcon: Icon(Icons.call_outlined, color: AppColors.grey),
            title: "Phone",
            value: booking.phone,
          ),
        ],
      ),
    );
  }
}
