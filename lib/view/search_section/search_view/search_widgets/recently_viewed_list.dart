import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../search_filter_controller/search_filter_controller.dart';

class RecentlyViewedList extends StatelessWidget {
  const RecentlyViewedList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchFilterController>();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=150",
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mystic Palms",
                      style: MyTextStyle.normalTitleText(
                        fontWeight: FontWeight.bold,
                        size: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Palm Springs, CA",
                      style: MyTextStyle.normalTitleText(
                        color: AppColors.grey400,
                        size: 12,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "\$230 /night",
                      style: MyTextStyle.normalTitleText(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.amber, size: 16),
                  const SizedBox(width: 4),
                  const Text(
                    "4.0",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
