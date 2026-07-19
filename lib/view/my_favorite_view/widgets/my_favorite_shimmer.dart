import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/widgets/custom_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class MyFavoriteShimmer extends StatelessWidget {
  const MyFavoriteShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey300,
      highlightColor: AppColors.grey100,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.62,
        ),
        itemCount: 4,
        itemBuilder: (_, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomShimmer(width: double.infinity, height: 140, radius: 16),

              SizedBox(height: 8),

              CustomShimmer(width: 80, height: 12),

              SizedBox(height: 8),

              CustomShimmer(width: double.infinity, height: 14),

              SizedBox(height: 8),

              CustomShimmer(width: 100, height: 12),

              SizedBox(height: 6),

              CustomShimmer(width: 70, height: 14),
            ],
          );
        },
      ),
    );
  }
}
