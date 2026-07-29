import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/model/hotel_model.dart';
import 'package:focal_project/view/detail_view/detail_view.dart';
import 'package:focal_project/view/home_view/home_controller/home_controller.dart';
import 'package:get/get.dart';

class PopularHotelCard extends StatelessWidget {
  final HotelModel hotel;
  final HomeController controller = Get.put(HomeController());

  PopularHotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Get.to(() => HotelDetailView(hotel: hotel));     
          },
    child:  Container(
      width: 180,
      height: 180,
      margin: EdgeInsets.only(right: AppSpaces.paddingNormal),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpaces.radiusExtraLarge),
        image: DecorationImage(
          image: NetworkImage(hotel.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpaces.radiusExtraLarge),
              gradient: LinearGradient(
                colors: [AppColors.primaryBlack, AppColors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: GestureDetector(
              onTap: () => controller.toggleFavorite(hotel),
              child: CircleAvatar(
                backgroundColor: AppColors.primaryWhite,
                radius: AppSpaces.radiusLarge,
                child: Icon(
                  hotel.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.red,
                  size: 16,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(
                  hotel.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyTextStyle.normalTitleText(
                    color: AppColors.primaryWhite,
                    size: 14,
                  ),
                ),
                SizedBox(height: AppSpaces.heightVerySmall),
                Text(
                  hotel.location,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyTextStyle.smallTitleText(
                    color: AppColors.primaryWhite,
                    fontWeight: FontWeight.w400,
                    size: 10,
                  ),
                ),
                SizedBox(height: AppSpaces.heightSmall),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${hotel.pricePerNight.toInt()}/night",
                      style: MyTextStyle.normalTitleText(
                        color: AppColors.primaryWhite,
                        size: 12,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.amber,
                          size: 14,
                        ),
                        Text(
                          hotel.rating.toString(),
                          style: MyTextStyle.smallTitleText(
                            color: AppColors.primaryWhite,
                            fontWeight: FontWeight.w400,
                            size: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),);
  }
}
