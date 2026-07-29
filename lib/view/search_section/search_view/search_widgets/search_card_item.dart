import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/model/hotel_model.dart';
import 'package:focal_project/view/detail_view/detail_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';

class SearchCardItem extends StatelessWidget {
  final HotelModel hotel;

  const SearchCardItem({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
               Get.to(() => HotelDetailView(hotel: hotel));     

      },
      child: Container(
      margin: EdgeInsets.only(bottom: AppSpaces.paddingLarge),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(AppSpaces.radiusSmall),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  hotel.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: AppColors.grey200,
                    child: const Icon(Icons.hotel, size: 50),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                left: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryWhite.withAlpha(40),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: AppColors.amber, size: 16),
                      SizedBox(width: AppSpaces.paddingVerySmall),
                      Text(
                        "${hotel.rating}",
                        style: MyTextStyle.normalTitleText(
                          color: AppColors.primaryWhite,
                          fontWeight: FontWeight.w500,
                          size: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: CircleAvatar(
                  backgroundColor: AppColors.primaryWhite.withAlpha(40),
                  child: Image.asset(
                    hotel.isFavorite
                        ? AppImages.heartFillIcon
                        : AppImages.heartIcon,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpaces.heightMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(hotel.name, style: MyTextStyle.normalTitleText(size: 16)),
              Text(
                "\$${hotel.pricePerNight.toInt()}",
                style: MyTextStyle.normalTitleText(
                  color: AppColors.primaryBlue,
                  size: 18,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hotel.location,
                style: MyTextStyle.normalTitleText(
                  color: AppColors.grey400,
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Per Night",
                style: MyTextStyle.normalTitleText(
                  color: AppColors.grey400,
                  fontWeight: FontWeight.w400,
                  size: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpaces.heightSmall),
          Row(
            children: [
              Icon(Icons.king_bed_outlined, color: AppColors.black87, size: 18),
              SizedBox(width: AppSpaces.paddingVerySmall),
              Text(
                "3 bed",
                style: MyTextStyle.normalTitleText(
                  color: AppColors.black87,
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: AppSpaces.paddingNormal),
              Icon(Icons.bathtub_outlined, color: AppColors.black87, size: 18),
              SizedBox(width: AppSpaces.paddingVerySmall),
              Text(
                "3 bathroom",
                style: MyTextStyle.normalTitleText(
                  color: AppColors.black87,
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    ),);
  }
}
