import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerLoading extends StatelessWidget {
  const HomeShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey300,
      highlightColor: AppColors.grey100,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 24, backgroundColor: AppColors.primaryWhite),
                SizedBox(width: AppSpaces.widthMedium),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: 120, height: 16, color: AppColors.primaryWhite),
                    SizedBox(height: AppSpaces.heightVerySmall),
                    Container(width: 80, height: 12, color: AppColors.primaryWhite),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppSpaces.heightLarge),
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.circular(AppSpaces.radiusLarge),
              ),
            ),
            SizedBox(height: AppSpaces.heightLarge),
            Container(width: 120, height: 20, color: AppColors.primaryWhite),
            SizedBox(height: AppSpaces.heightNormal),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (_, __) => Container(
                  width: 180,
                  margin: EdgeInsets.only(right: AppSpaces.paddingNormal),
                  decoration: BoxDecoration(
                    color: AppColors.primaryWhite,
                    borderRadius: BorderRadius.circular(AppSpaces.radiusExtraLarge),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSpaces.heightLarge),
            Container(width: 140, height: 20, color: AppColors.primaryWhite),
            SizedBox(height: AppSpaces.heightNormal),
            Column(
              children: List.generate(
                2,
                (index) => Container(
                  height: 100,
                  margin: EdgeInsets.only(bottom: AppSpaces.paddingNormal),
                  decoration: BoxDecoration(
                    color: AppColors.primaryWhite,
                    borderRadius: BorderRadius.circular(AppSpaces.radiusLarge),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalShimmer extends StatelessWidget {
  const HorizontalShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey300,
      highlightColor: AppColors.grey100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (_, __) => Container(
          width: 200,
          margin: EdgeInsets.only(right: AppSpaces.paddingNormal),
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(AppSpaces.radiusExtraLarge),
          ),
        ),
      ),
    );
  }
}

class VerticalListShimmer extends StatelessWidget {
  const VerticalListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey300,
      highlightColor: AppColors.grey100,
      child: Column(
        children: List.generate(
          2,
          (index) => Container(
            height: 110,
            margin: EdgeInsets.only(bottom: AppSpaces.paddingNormal),
            decoration: BoxDecoration(
              color: AppColors.primaryWhite,
              borderRadius: BorderRadius.circular(AppSpaces.radiusLarge),
            ),
          ),
        ),
      ),
    );
  }
}

class SingleShimmerBox extends StatelessWidget {
  final double height;
  const SingleShimmerBox({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey300,
      highlightColor: AppColors.grey100,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(AppSpaces.radiusExtraLarge),
        ),
      ),
    );
  }
}