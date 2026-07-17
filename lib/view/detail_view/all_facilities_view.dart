import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:get/get.dart';

class AllFacilitiesView extends StatelessWidget {
  const AllFacilitiesView({super.key});

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
          "All Facilities",
          style: MyTextStyle.normalTitleText(
            fontWeight: FontWeight.bold,
            size: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(AppSpaces.paddingLarge),
        children: [
          _buildFacilitySection(
            icon: Icons.storefront_outlined,
            title: "Food and Drink",
            count: 4,
            initiallyExpanded: true,
            children: [
              "A la carte dinner",
              "A la carte lunch",
              "Breakfast",
              "Vegetarian meal",
            ],
          ),
          _buildFacilitySection(
            icon: Icons.directions_car_filled_outlined,
            title: "Transportation",
            count: 5,
            children: ["Airport shuttle", "Car rental", "Free parking"],
          ),
          _buildFacilitySection(
            icon: Icons.settings_outlined,
            title: "General",
            count: 8,
            children: ["Air conditioning", "Elevator", "Heating"],
          ),
          _buildFacilitySection(
            icon: Icons.domain_outlined,
            title: "Hotel Service",
            count: 2,
            children: ["Daily housekeeping", "Laundry service"],
          ),
          _buildFacilitySection(
            icon: Icons.analytics_outlined,
            title: "Business Facilities",
            count: 6,
            children: ["Meeting rooms", "Photocopying"],
          ),
          _buildFacilitySection(
            icon: Icons.room_service_outlined,
            title: "Nearby facilities",
            count: 8,
            children: ["Supermarket", "ATM"],
          ),
          _buildFacilitySection(
            icon: Icons.child_care_outlined,
            title: "Kids",
            count: 3,
            children: ["Kids club", "Playground"],
          ),
          _buildFacilitySection(
            icon: Icons.wifi,
            title: "Connectivity",
            count: 2,
            children: ["Free high-speed Wi-Fi"],
          ),
          _buildFacilitySection(
            icon: Icons.apartment_outlined,
            title: "Public Facilities",
            count: 16,
            children: ["Swimming pool", "Gym", "Garden"],
          ),
        ],
      ),
    );
  }

  Widget _buildFacilitySection({
    required IconData icon,
    required String title,
    required int count,
    bool initiallyExpanded = false,
    required List<String> children,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.lightBlueBg,
        borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent), 
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          leading: Icon(icon, color: AppColors.primaryBlack, size: 24),
          title: RichText(
            text: TextSpan(
              text: "$title ",
              style: MyTextStyle.normalTitleText(
                fontWeight: FontWeight.bold,
                size: 16,
                color: AppColors.primaryBlack,
              ),
              children: [
                TextSpan(
                  text: "($count facilities)",
                  style: MyTextStyle.smallTitleText(
                    color: AppColors.grey500,
                    size: 12,
                  ),
                ),
              ],
            ),
          ),
          trailing: const Icon(Icons.add, color: AppColors.primaryBlack), 
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 56, bottom: 16, right: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: AppColors.grey500,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                item,
                                style: MyTextStyle.smallTitleText(
                                  color: AppColors.grey600,
                                  size: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}