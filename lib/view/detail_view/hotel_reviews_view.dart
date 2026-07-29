import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/detail_view/detail_widgets/hotel_detail_widgets.dart';
import 'package:focal_project/view/detail_view/detail_widgets/rating_bar_row.dart';
import 'package:get/get.dart';

class HotelReviewsView extends StatelessWidget {
  const HotelReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryBlack),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Reviews",
          style: MyTextStyle.normalTitleText(
            fontWeight: FontWeight.bold,
            size: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: AppColors.primaryBlack),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(AppSpaces.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "4.4",
                        style: MyTextStyle.priceText(
                          color: AppColors.black87,
                          fontWeight: FontWeight.w700,
                          size: 32,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: index < 4
                                ? AppColors.amber
                                : AppColors.grey300,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Based on 532 reviews",
                        style: MyTextStyle.smallTitleText(
                          color: AppColors.grey500,
                          fontWeight: FontWeight.w500,
                          size: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      RatingBarRow(starNumber: 1, progress: 0.1),
                      RatingBarRow(starNumber: 2, progress: 0.3),
                      RatingBarRow(starNumber: 3, progress: 0.4),
                      RatingBarRow(starNumber: 4, progress: 0.6),
                      RatingBarRow(starNumber: 5, progress: 0.8),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSpaces.heightLarge),
            SizedBox(height: AppSpaces.heightMedium),

            Text("Reviews (532)", style: MyTextStyle.normalTitleText(size: 18)),
            SizedBox(height: AppSpaces.heightLarge),

            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                HotelReviewTile(
                  author: "Kim Borrdy",
                  reviewText:
                      "Amazing! The room is good than the picture. Thanks for amazing experience!",
                  rating: 4.5,
                ),
                HotelReviewTile(
                  author: "Mirai Kamazuki",
                  reviewText:
                      "The service is on point, and I really like the facilities. Good job!",
                  rating: 5.0,
                ),
                HotelReviewTile(
                  author: "Jzenklen",
                  reviewText:
                      "The service is on point, and I really like the facilities. Good job!",
                  rating: 5.0,
                ),
                HotelReviewTile(
                  author: "Rezikan Akay",
                  reviewText:
                      "The service is on point, and I really like the facilities. Good job!",
                  rating: 5.0,
                ),
                HotelReviewTile(
                  author: "Rezingkaly",
                  reviewText:
                      "The service is on point, and I really like the facilities. Good job!",
                  rating: 5.0,
                ),
                HotelReviewTile(
                  author: "Andiziky",
                  reviewText:
                      "The service is on point, and I really like the facilities. Good job!",
                  rating: 5.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
