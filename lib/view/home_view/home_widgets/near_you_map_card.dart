import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class NearYouMapCard extends StatelessWidget {
  final String areaName;
  final String? iconAsset;
  final bool showAddressDetails;

  const NearYouMapCard({
    super.key,
    required this.areaName,
    this.iconAsset,
    this.showAddressDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    final mapContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSpaces.radiusLarge),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1524661135-423995f22d0b?q=80&w=600&auto=format&fit=crop",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (iconAsset != null)
              Container(
                width: 35,
                height: 35,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.25),
                      blurRadius: 15,
                      spreadRadius: 6,
                    ),
                  ],
                ),
                child: Image.asset(
                  iconAsset!,
                  color: AppColors.primaryWhite,
                  fit: BoxFit.contain,
                ),
              ),
          ],
        ),
        if (showAddressDetails) ...[
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                AppImages.locationIcon,
                color: AppColors.primary,
                width: 18,
                height: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  areaName,
                  style: MyTextStyle.smallTitleText(
                    color: AppColors.grey500,
                    size: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ],
    );

    if (showAddressDetails) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(AppSpaces.radiusExtraLarge),
          border: Border.all(color: AppColors.grey200, width: 1.2),
        ),
        child: mapContent,
      );
    }

    return mapContent;
  }
}
