import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spaces.dart';

class MapShimmerLoading extends StatelessWidget {
  const MapShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey300,
      highlightColor: AppColors.grey100,
      child: Stack(
        children: [
          Container(
            color: AppColors.primaryWhite,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 50,
            left: AppSpaces.paddingLarge,
            right: AppSpaces.paddingLarge,
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: AppSpaces.paddingLarge,
            right: AppSpaces.paddingLarge,
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.circular(AppSpaces.radiusExtraLarge),
              ),
            ),
          ),
        ],
      ),
    );
  }
}