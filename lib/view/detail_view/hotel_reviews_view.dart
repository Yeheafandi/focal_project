import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/detail_view/detail_widgets/hotel_detail_widgets.dart';
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
                          fontWeight: FontWeight.bold,
                          size: 48,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: index < 4 ? AppColors.amber : AppColors.grey300,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Based on 532 reviews",
                        style: MyTextStyle.smallTitleText(
                          color: AppColors.grey500,
                          size: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      _buildRatingRow(1, 0.8),
                      _buildRatingRow(2, 0.6),
                      _buildRatingRow(3, 0.4),
                      _buildRatingRow(4, 0.3),
                      _buildRatingRow(5, 0.1),
                    ],
                  ),
                ),
              ],
            ),
            
            SizedBox(height: AppSpaces.heightLarge),
            const Divider(),
            SizedBox(height: AppSpaces.heightMedium),

            Text(
              "Reviews (532)",
              style: MyTextStyle.normalTitleText(
                fontWeight: FontWeight.bold,
                size: 18,
              ),
            ),
            SizedBox(height: AppSpaces.heightLarge),

            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                HotelReviewTile(
                  author: "Kim Borrdy",
                  reviewText: "Amazing! The room is good than the picture. Thanks for amazing experience!",
                  rating: 4.5,
                ),
                HotelReviewTile(
                  author: "Mirai Kamazuki",
                  reviewText: "The service is on point, and I really like the facilities. Good job!",
                  rating: 5.0,
                ),
                HotelReviewTile(
                  author: "Jzenklen",
                  reviewText: "The service is on point, and I really like the facilities. Good job!",
                  rating: 5.0,
                ),
                HotelReviewTile(
                  author: "Rezikan Akay",
                  reviewText: "The service is on point, and I really like the facilities. Good job!",
                  rating: 5.0,
                ),
                HotelReviewTile(
                  author: "Rezingkaly",
                  reviewText: "The service is on point, and I really like the facilities. Good job!",
                  rating: 5.0,
                ),
                HotelReviewTile(
                  author: "Andiziky",
                  reviewText: "The service is on point, and I really like the facilities. Good job!",
                  rating: 5.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingRow(int starNumber, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text(
            "$starNumber",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.grey600,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.grey200,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                minHeight: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}