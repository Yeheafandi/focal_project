import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/view/my_favorite_view/my_favorite_controller/my_favorite_controller.dart';
import 'package:get/get.dart';

import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/model/my_favorite_model.dart';

class FavoriteItem extends GetView<MyFavoriteController> {
  const FavoriteItem({super.key, required this.hotel});

  final MyFavoriteModel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
              child: Image.network(
                hotel.image,
                height: 119.h, 
                width: 154.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 119,
                    color: AppColors.primaryWhite,
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 40,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),

            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () => controller.toggleFavorite(hotel),
                child: Obx(
                  () => Icon(
                    controller.favorites.contains(
                          hotel,
                        ) 
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.white, 
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        
        Row(
          children: [
            SvgPicture.asset(AppIcons.solarStar),
             SizedBox(width: AppSpaces.widthVerySmall),
            Text(
              hotel.rating.toString(),
              style: MyTextStyle.smallTitleText().copyWith(
                fontSize: 12,
                color: AppColors.amber,
              ),
            ),
            Text(
              "(${hotel.reviews})",
              style: MyTextStyle.smallTitleText().copyWith(
                color: AppColors.grey400,
                fontSize: 11,
              ),
            ),
          ],
        ),
         SizedBox(height: AppSpaces.heightVerySmall),

       
        Text(
          hotel.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: MyTextStyle.normalTitleText().copyWith(
            
            fontSize: 14,
          ),
        ),
        

        
        Text(
          hotel.location,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: MyTextStyle.smallTitleText().copyWith(
            color: AppColors.grey400,
            fontSize: 12,
          ),
        ),
         SizedBox(height: AppSpaces.heightVerySmall),

        
        Row(
          children: [
            Text(
              "\$${hotel.price}",
              style: MyTextStyle.priceText().copyWith(
                color: AppColors
                    .primaryBlack, 
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              " Per Night",
              style: MyTextStyle.smallTitleText().copyWith(
                color: AppColors.grey400,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
