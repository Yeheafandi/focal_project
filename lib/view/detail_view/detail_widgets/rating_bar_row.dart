import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';

class RatingBarRow extends StatelessWidget {
  final int starNumber;
  final double progress;

  const RatingBarRow({
    super.key,
    required this.starNumber,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 20),
      child: Row(
        children: [
          Text(
            "$starNumber",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.grey600,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
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
