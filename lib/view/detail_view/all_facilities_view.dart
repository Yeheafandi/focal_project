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
          'all_facilities.title'.tr,
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
          FacilitySectionCard(
            icon: Icons.storefront_outlined,
            title: 'all_facilities.food_and_drink'.tr,
            count: 4,
            initiallyExpanded: true,
            children: [
              'all_facilities.a_la_carte_dinner'.tr,
              'all_facilities.a_la_carte_lunch'.tr,
              'all_facilities.breakfast'.tr,
              'all_facilities.vegetarian_meal'.tr,
            ],
          ),
          FacilitySectionCard(
            icon: Icons.directions_car_filled_outlined,
            title: 'all_facilities.transportation'.tr,
            count: 5,
            children: [
              'all_facilities.airport_shuttle'.tr,
              'all_facilities.car_rental'.tr,
              'all_facilities.free_parking'.tr,
            ],
          ),
          FacilitySectionCard(
            icon: Icons.settings_outlined,
            title: 'all_facilities.general'.tr,
            count: 3,
            children: [
              'all_facilities.air_conditioning'.tr,
              'all_facilities.elevator'.tr,
              'all_facilities.heating'.tr,
            ],
          ),
          FacilitySectionCard(
            icon: Icons.domain_outlined,
            title: 'all_facilities.hotel_service'.tr,
            count: 2,
            children: [
              'all_facilities.daily_housekeeping'.tr,
              'all_facilities.laundry_service'.tr,
            ],
          ),
          FacilitySectionCard(
            icon: Icons.analytics_outlined,
            title: 'all_facilities.business_facilities'.tr,
            count: 2,
            children: [
              'all_facilities.meeting_rooms'.tr,
              'all_facilities.photocopying'.tr,
            ],
          ),
          FacilitySectionCard(
            icon: Icons.room_service_outlined,
            title: 'all_facilities.nearby_facilities'.tr,
            count: 2,
            children: [
              'all_facilities.supermarket'.tr,
              'all_facilities.atm'.tr,
            ],
          ),
          FacilitySectionCard(
            icon: Icons.child_care_outlined,
            title: 'all_facilities.kids'.tr,
            count: 2,
            children: [
              'all_facilities.kids_club'.tr,
              'all_facilities.playground'.tr,
            ],
          ),
          FacilitySectionCard(
            icon: Icons.wifi,
            title: 'all_facilities.connectivity'.tr,
            count: 1,
            children: [
              'all_facilities.free_wifi'.tr,
            ],
          ),
          FacilitySectionCard(
            icon: Icons.apartment_outlined,
            title: 'all_facilities.public_facilities'.tr,
            count: 3,
            children: [
              'all_facilities.swimming_pool'.tr,
              'all_facilities.gym'.tr,
              'all_facilities.garden'.tr,
            ],
          ),
        ],
      ),
    );
  }
}