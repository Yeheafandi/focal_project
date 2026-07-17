import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/model/hotel_model.dart';

class BookingBottomBar extends StatelessWidget {
  final HotelModel hotel;
  final VoidCallback onBookingPressed;

  const BookingBottomBar({
    super.key,
    required this.hotel,
    required this.onBookingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpaces.paddingLarge,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpaces.radiusExtraLarge),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlack,
            blurRadius: 15,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: MyTextStyle.smallTitleText(
                  color: AppColors.grey500,
                  size: 12,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "\$${hotel.pricePerNight.toInt()}",
                style: MyTextStyle.priceText(
                  fontWeight: FontWeight.bold,
                  size: 24,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 200,
            height: 54,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
              ),
              onPressed: onBookingPressed,
              child: Text(
                "Booking Now",
                style: MyTextStyle.normalTitleText(
                  color: AppColors.primaryWhite,
                  fontWeight: FontWeight.bold,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotelReviewTile extends StatelessWidget {
  final String author;
  final String reviewText;
  final double rating;

  const HotelReviewTile({
    super.key,
    required this.author,
    required this.reviewText,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpaces.paddingNormal),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.grey300,
            child: Icon(Icons.person, color: AppColors.primaryWhite),
          ),
          SizedBox(width: AppSpaces.widthNormal),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      author,
                      style: MyTextStyle.normalTitleText(
                        fontWeight: FontWeight.bold,
                        size: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.amber, size: 14),
                        SizedBox(width: AppSpaces.widthVerySmall),
                        Text(
                          "$rating",
                          style:  MyTextStyle.normalTitleText(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: AppSpaces.heightVerySmall),
                Text(
                  reviewText,
                  style: MyTextStyle.smallTitleText(
                    color: AppColors.grey600,
                    size: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}