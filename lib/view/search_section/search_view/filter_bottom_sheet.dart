import 'package:flutter/material.dart';
import 'package:focal_project/view/search_section/search_view/search_filter_controller/search_filter_controller.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spaces.dart';
import '../../../core/constants/text_style.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchFilterController>();

    final Map<String, String> guestOptions = {
      "3 Guest (2 Adult, 1 Childern)": "filter_bottom_sheet.guest_3".tr,
      "2 Guest (2 Adult)": "filter_bottom_sheet.guest_2".tr,
      "1 Guest (1 Adult)": "filter_bottom_sheet.guest_1".tr,
    };

    final List<Map<String, String>> facilityItems = [
      {'key': 'Free Wifi', 'label': 'filter_bottom_sheet.free_wifi'.tr},
      {'key': 'Swimming Pool', 'label': 'filter_bottom_sheet.swimming_pool'.tr},
      {'key': 'Tv', 'label': 'filter_bottom_sheet.tv'.tr},
      {'key': 'Laundry', 'label': 'filter_bottom_sheet.laundry'.tr},
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpaces.paddingLarge,
        vertical: AppSpaces.paddingMedium,
      ),
      decoration: const BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.grey300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: AppSpaces.paddingMedium),
            Center(
              child: Text(
                'filter_bottom_sheet.title'.tr,
                style: MyTextStyle.normalTitleText(
                  fontWeight: FontWeight.bold,
                  size: 18,
                  color: AppColors.primaryBlack,
                ),
              ),
            ),
            SizedBox(height: AppSpaces.paddingLarge),

            _buildSectionTitle('filter_bottom_sheet.guests_placeholder'.tr),
            SizedBox(height: AppSpaces.paddingSmall),
            Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey200),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: controller.selectedGuests.value,
                    isExpanded: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.grey400,
                      size: 24,
                    ),
                    items: guestOptions.entries.map((entry) {
                      return DropdownMenuItem<String>(
                        value: entry.key,
                        child: Text(
                          entry.value,
                          style: MyTextStyle.normalTitleText(
                            size: 14,
                            color: AppColors.grey500,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) controller.selectedGuests.value = val;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSpaces.paddingLarge),

            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSectionTitle('filter_bottom_sheet.price'.tr),
                  Text(
                    "\$${controller.priceRange.value.start.toInt()}-\$${controller.priceRange.value.end.toInt()}",
                    style: MyTextStyle.normalTitleText(
                      color: AppColors.grey300,
                      fontWeight: FontWeight.w400,
                      size: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpaces.heightNormal),

            Obx(
              () => SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 2,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 6,
                  ),
                  overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 12,
                  ),
                  activeTrackColor: AppColors.primaryBlue,
                  inactiveTrackColor: AppColors.grey200,
                  thumbColor: AppColors.primaryBlue,
                ),
                child: RangeSlider(
                  values: controller.priceRange.value,
                  min: 0,
                  max: 500,
                  onChanged: (values) {
                    controller.priceRange.value = values;
                  },
                ),
              ),
            ),
            SizedBox(height: AppSpaces.paddingMedium),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('filter_bottom_sheet.instant_book'.tr),
                    const SizedBox(height: 2),
                    Text(
                      'filter_bottom_sheet.instant_book_desc'.tr,
                      style: MyTextStyle.smallTitleText(
                        color: AppColors.grey400,
                        fontWeight: FontWeight.w400,
                        size: 12,
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: controller.isInstantBook.value,
                      activeColor: AppColors.primaryWhite,
                      activeTrackColor: AppColors.primaryBlue,
                      inactiveThumbColor: AppColors.primaryWhite,
                      inactiveTrackColor: AppColors.grey200,
                      trackOutlineColor: WidgetStateProperty.all(
                        Colors.transparent,
                      ),
                      onChanged: (val) => controller.isInstantBook.value = val,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpaces.paddingExtraLarge),

            _buildSectionTitle('filter_bottom_sheet.location'.tr),
            SizedBox(height: AppSpaces.heightNormal),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ["San Diego", "New York", "Amsterdam"].map((loc) {
                  return Obx(() {
                    bool isSelected = controller.selectedLocation.value == loc;
                    return GestureDetector(
                      onTap: () => controller.selectedLocation.value = loc,
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primaryBlue
                              : AppColors.grey100.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          loc,
                          style: MyTextStyle.normalTitleText(
                            color: isSelected
                                ? AppColors.primaryWhite
                                : AppColors.primaryBlue,
                            fontWeight: FontWeight.w600,
                            size: 13,
                          ),
                        ),
                      ),
                    );
                  });
                }).toList(),
              ),
            ),
            SizedBox(height: AppSpaces.paddingLarge),

            _buildSectionTitle('filter_bottom_sheet.facilities'.tr),
            SizedBox(height: AppSpaces.heightNormal),
            ...facilityItems.map((item) {
              return Obx(() {
                bool isChecked = controller.selectedFacilities.contains(
                  item['key'],
                );
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['label']!,
                        style: MyTextStyle.normalTitleText(
                          color: AppColors.grey400,
                          size: 14,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: isChecked,
                          activeColor: AppColors.primaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: BorderSide(
                            color: AppColors.grey300,
                            width: 1.5,
                          ),
                          onChanged: (checked) {
                            if (checked == true) {
                              controller.selectedFacilities.add(item['key']!);
                            } else {
                              controller.selectedFacilities.remove(item['key']!);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              });
            }),
            SizedBox(height: AppSpaces.paddingLarge),

            _buildSectionTitle('filter_bottom_sheet.ratings'.tr),
            SizedBox(height: AppSpaces.heightNormal),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [5, 4, 3, 2, 1].map((stars) {
                return Obx(() {
                  bool isSelected = controller.selectedRating.value == stars;
                  return InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () => controller.selectedRating.value = stars,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryBlue
                              : AppColors.grey200,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.primaryWhite,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.amber,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "$stars",
                            style: MyTextStyle.normalTitleText(
                              fontWeight: FontWeight.bold,
                              size: 13,
                              color: AppColors.primaryBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              }).toList(),
            ),
            SizedBox(height: AppSpaces.paddingLarge * 1.5),
            
            SizedBox(
              width: double.infinity,
              child: CustomeButton(
                text: 'filter_bottom_sheet.apply_filter'.tr,
                onPressed: () {
                  controller.isFilterApplied.value = true;
                  controller.executeSearchAndFilter();
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: MyTextStyle.normalTitleText(
        fontWeight: FontWeight.w500,
        size: 14,
        color: AppColors.primaryBlack,
      ),
    );
  }
}