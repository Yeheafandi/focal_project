import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
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
                cacheWidth: 156,
                cacheHeight: 156,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }

                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported);
                },
              ),
            ),
          ),

          SizedBox(width: AppSpaces.widthNormal),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelName,
                  style: MyTextStyle.normalTitleText(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: AppSpaces.heightSmall),

                Row(
                  children: [
                    SvgPicture.asset(AppIcons.location),

                    SizedBox(width: AppSpaces.widthVerySmall),

                    Expanded(
                      child: Text(
                        location,
                        style: MyTextStyle.smallTitleText(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: AppSpaces.heightSmall),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$$price',
                        style: MyTextStyle.priceText().copyWith(fontSize: 16),
                      ),
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
          ),

          SizedBox(
            width: 45,
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.solarStar),

                SizedBox(width: AppSpaces.widthVerySmall),
                Flexible(
                  child: Text(
                    rating.toString(),
                    style: MyTextStyle.smallTitleText(),
                    overflow: TextOverflow.ellipsis,
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
