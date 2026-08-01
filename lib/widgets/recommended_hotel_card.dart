import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/model/hotel_model.dart';
import 'package:focal_project/view/detail_view/detail_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class RecommendedHotelCard extends StatelessWidget {
  final HotelModel hotel;
  final bool underline;
  final bool marginBottom;

  const RecommendedHotelCard({
    super.key,
    required this.hotel,
    this.underline = true,
    this.marginBottom = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => HotelDetailView(hotel: hotel));
      },
      child: Container(
        margin: EdgeInsets.only(bottom:marginBottom? AppSpaces.paddingNormal : 0),
        padding: EdgeInsets.only(bottom: AppSpaces.paddingNormal),

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
                          style: MyTextStyle.normalTitleText(size: 16),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.amber,
                            size: 16,
                          ),
                          SizedBox(width: AppSpaces.widthVerySmall),
                          Text(
                            hotel.rating.toString(),
                            style: MyTextStyle.normalTitleText(
                              size: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpaces.heightVerySmall),
                  Row(
                    spacing: 2,
                    children: [
                      Image.asset(
                        AppImages.locationOutlineIcon,
                        width: 12,
                        height: 12,
                        color: AppColors.grey500,
                      ),
                      Text(
                        hotel.location,
                        style: MyTextStyle.smallTitleText(
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey500,
                          size: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpaces.heightMedium),
                  Row(
                    children: [
                      Text(
                        "\$${hotel.pricePerNight.toInt()}",
                        style: MyTextStyle.priceText(
                          fontWeight: FontWeight.w600,
                          size: 16,
                        ),
                      ),
                      Text(
                        " /night ",
                        style: MyTextStyle.priceText(
                          color: AppColors.black87,
                          fontWeight: FontWeight.w500,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
