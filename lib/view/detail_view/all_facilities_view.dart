import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/detail_view/detail_widgets/facility_section_card.dart';
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
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryBlack),
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
        children: const [
          FacilitySectionCard(
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
          FacilitySectionCard(
            icon: Icons.directions_car_filled_outlined,
            title: "Transportation",
            count: 5,
            children: ["Airport shuttle", "Car rental", "Free parking"],
          ),
          FacilitySectionCard(
            icon: Icons.settings_outlined,
            title: "General",
            count: 3,
            children: ["Air conditioning", "Elevator", "Heating"],
          ),
          FacilitySectionCard(
            icon: Icons.domain_outlined,
            title: "Hotel Service",
            count: 2,
            children: ["Daily housekeeping", "Laundry service"],
          ),
          FacilitySectionCard(
            icon: Icons.analytics_outlined,
            title: "Business Facilities",
            count: 2,
            children: ["Meeting rooms", "Photocopying"],
          ),
          FacilitySectionCard(
            icon: Icons.room_service_outlined,
            title: "Nearby facilities",
            count: 2,
            children: ["Supermarket", "ATM"],
          ),
          FacilitySectionCard(
            icon: Icons.child_care_outlined,
            title: "Kids",
            count: 2,
            children: ["Kids club", "Playground"],
          ),
          FacilitySectionCard(
            icon: Icons.wifi,
            title: "Connectivity",
            count: 1,
            children: ["Free high-speed Wi-Fi"],
          ),
          FacilitySectionCard(
            icon: Icons.apartment_outlined,
            title: "Public Facilities",
            count: 3,
            children: ["Swimming pool", "Gym", "Garden"],
          ),
        ],
      ),
    );
  }
}
