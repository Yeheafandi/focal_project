import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';

class NearYouMapCard extends StatelessWidget {
  final String areaName;

  const NearYouMapCard({super.key, required this.areaName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382,
      height: 167,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpaces.radiusExtraLarge),
        image: const DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1524661135-423995f22d0b?q=80&w=600&auto=format&fit=crop",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
