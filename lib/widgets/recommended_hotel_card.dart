import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/model/hotel_model.dart';

class RecommendedHotelCard extends StatelessWidget {
  final HotelModel hotel;

  const RecommendedHotelCard({super.key, required this.hotel, required this.underline});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSpaces.paddingNormal),
      padding: EdgeInsets.only(bottom: AppSpaces.paddingNormal),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: AppColors.grey500, 
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
            child: Image.network(
              hotel.imageUrl,
              width: 78,
              height: 78,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: AppSpaces.widthNormal),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        hotel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: MyTextStyle.normalTitleText(
                          fontWeight: FontWeight.bold,
                          size: 15,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.amber,
                          size: 14,
                        ),
                        SizedBox(width: AppSpaces.widthVerySmall),
                        Text(
                          hotel.rating.toString(),
                          style: MyTextStyle.normalTitleText(
                            size: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: AppSpaces.heightVerySmall),
                Text(
                  hotel.location,
                  style: MyTextStyle.smallTitleText(
                    color: AppColors.grey500,
                    size: 12,
                  ),
                ),
                SizedBox(height: AppSpaces.heightMedium),
                Text(
                  "\$${hotel.pricePerNight.toInt()} /night",
                  style: MyTextStyle.priceText(
                    fontWeight: FontWeight.bold,
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