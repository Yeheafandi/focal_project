import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/model/hotel_model.dart';
import 'package:focal_project/view/home_view/home_controller/home_controller.dart';
import 'package:get/get.dart';

class BestTodayCard extends StatelessWidget {
  final HotelModel hotel;
  final HomeController controller = Get.put(HomeController());

  BestTodayCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(
        right: AppSpaces.paddingNormal,
        bottom: 8,
        top: 4,
      ),
      padding: EdgeInsets.all(AppSpaces.paddingSmall),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppSpaces.radiusLarge),
        border: Border.all(color: AppColors.grey500, width: 1.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
            child: Image.network(
              hotel.imageUrl,
              height: 75,
              width: 74,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 75,
                  width: 74,
                  color: AppColors.grey200,
                  child: const Icon(Icons.broken_image, color: AppColors.grey),
                );
              },
            ),
          ),
          SizedBox(width: AppSpaces.widthMedium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  hotel.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyTextStyle.normalTitleText(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlack,
                    size: 15,
                  ),
                ),
                SizedBox(height: AppSpaces.heightVerySmall),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 12, color: AppColors.grey600),
                    SizedBox(width: AppSpaces.widthVerySmall),
                    Expanded(
                      child: Text(
                        hotel.location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: MyTextStyle.smallTitleText(
                          color: AppColors.grey500,
                          size: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSpaces.heightSmall),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                            color: AppColors.primaryBlack,
                            size: 12,
                          ),
                        ),
                        Text(
                          " (${hotel.reviewsCount})",
                          style: MyTextStyle.smallTitleText(
                            color: AppColors.grey400,
                            size: 10,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${hotel.pricePerNight.toInt()}",
                          style: MyTextStyle.priceText(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                            size: 14,
                          ),
                        ),
                        if (hotel.oldPricePerNight != null) ...[
                          SizedBox(width: AppSpaces.widthVerySmall),
                          Text(
                            "\$${hotel.oldPricePerNight!.toInt()}",
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 10,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
