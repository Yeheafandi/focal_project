import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spaces.dart';
import '../../../../core/constants/text_style.dart';
import '../../../model/hotel_model.dart';

class MapHotelCard extends StatelessWidget {
  final HotelModel hotel;

  const MapHotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpaces.paddingNormal),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(AppSpaces.radiusExtraLarge),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSpaces.radiusLarge),
                child: Image.network(
                  hotel.imageUrl,
                  width: 85,
                  height: 85,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 85,
                      height: 85,
                      color: AppColors.grey200,
                      child: const Icon(
                        Icons.broken_image,
                        color: AppColors.grey,
                      ),
                    );
                  },
                ),
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
                          hotel.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: MyTextStyle.normalTitleText(size: 16),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.amber,
                              size: 18,
                            ),
                            SizedBox(width: AppSpaces.widthVerySmall),
                            Text(
                              hotel.rating.toString(),
                              style: MyTextStyle.normalTitleText(
                                fontWeight: FontWeight.w500,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpaces.heightVerySmall),
                    Row(
                      children: [
                        Image.asset(AppImages.locationOutlineIcon),
                        SizedBox(width: AppSpaces.widthVerySmall),
                        Expanded(
                          child: Text(
                            hotel.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: MyTextStyle.smallTitleText(
                              color: AppColors.grey500,
                              fontWeight: FontWeight.w400,
                              size: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpaces.heightSmall),
                    Row(
                      children: [
                        Text(
                          "\$${hotel.pricePerNight.toInt()}",
                          style: MyTextStyle.priceText(
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryBlue,
                            size: 16,
                          ),
                        ),
                        Text(
                          " /night",
                          style: MyTextStyle.smallTitleText(
                            color: AppColors.black87,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpaces.heightNormal),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.requestToBook, arguments: hotel);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    padding: EdgeInsets.symmetric(
                      vertical: AppSpaces.paddingMedium + 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSpaces.radiusMedium,
                      ),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                       'booking_now'.tr,
                    style: MyTextStyle.normalTitleText(
                      color: AppColors.primaryWhite,
                      size: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 18),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primaryWhite,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.grey200, width: 1),
                ),
                child: IconButton(
                  icon: Image.asset(AppImages.messageTextIcon),
                  onPressed: () {
                    Get.toNamed(Routes.chatDetailsScreen);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
