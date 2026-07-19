import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_images.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';

class SearchCardItem extends StatelessWidget {
  const SearchCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://images.unsplash.com/photo-1540555700478-4be289fbecef?q=80&w=600",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
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
                    color: AppColors.primaryWhite.withAlpha(10),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: AppColors.amber, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        "4.9",
                        style: MyTextStyle.normalTitleText(
                          color: AppColors.primaryWhite,
                          fontWeight: FontWeight.bold,
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
                  backgroundColor: AppColors.primaryWhite.withAlpha(10),
                  child: Image.asset(AppImages.heartIcon),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sapphire Cove Hotel",
                style: MyTextStyle.normalTitleText(
                  fontWeight: FontWeight.bold,
                  size: 18,
                ),
              ),
              Text(
                "\$290",
                style: MyTextStyle.normalTitleText(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                  size: 18,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Key West, FL",
                style: MyTextStyle.normalTitleText(color: AppColors.grey400),
              ),
              Text(
                "Per Night",
                style: MyTextStyle.normalTitleText(
                  color: AppColors.grey400,
                  size: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.bed, color: AppColors.grey500, size: 18),
              const SizedBox(width: 4),
              Text(
                "3 bed",
                style: MyTextStyle.normalTitleText(color: AppColors.grey400),
              ),
              const SizedBox(width: 15),
              Icon(Icons.bathroom, color: AppColors.grey500, size: 18),
              const SizedBox(width: 4),
              Text(
                "3 bathroom",
                style: MyTextStyle.normalTitleText(color: AppColors.grey400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
