import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
    required this.hotelName,
    required this.hotelImage,
    required this.location,
    required this.rating,
    required this.price,
  });

  final String hotelName;
  final String hotelImage;
  final String location;
  final double rating;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpaces.radiusSmall),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Hotel Image
          Container(
            width: 78,
            height: 78,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                hotelImage,
                width: 78,
                height: 78,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: AppSpaces.widthNormal),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(hotelName, style: MyTextStyle.normalTitleText()),

              const SizedBox(height: AppSpaces.heightSmall),

              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 18),

                  const SizedBox(width: AppSpaces.widthVerySmall),

                  Text(location, style: MyTextStyle.smallTitleText()),
                ],
              ),

              const SizedBox(height: AppSpaces.heightSmall),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: '\$$price', style: MyTextStyle.priceText()),
                    TextSpan(
                      text: ' /night',
                      style: MyTextStyle.smallTitleText().copyWith(
                        color: AppColors.primaryBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(child: SizedBox()),
          Row(
            children: [
              const Icon(Icons.star, color: AppColors.amber),

              Text(rating.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
