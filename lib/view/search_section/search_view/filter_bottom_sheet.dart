import 'package:flutter/material.dart';
import 'package:focal_project/view/search_section/search_view/search_filter_controller/search_filter_controller.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spaces.dart';
import '../../../core/constants/text_style.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchFilterController>();

    return Container(
      padding: EdgeInsets.all(AppSpaces.paddingLarge),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.grey300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Filter By",
                style: MyTextStyle.normalTitleText(
                  fontWeight: FontWeight.bold,
                  size: 20,
                  color: AppColors.primaryBlack,
                ),
              ),
            ),
            const SizedBox(height: 20),

            _buildSectionTitle("Placeholder"),
            const SizedBox(height: 10),
            Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey200),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: controller.selectedGuests.value,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items:
                        [
                          "3 Guest (2 Adult, 1 Childern)",
                          "2 Guest (2 Adult)",
                          "1 Guest (1 Adult)",
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (val) {
                      if (val != null) controller.selectedGuests.value = val;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSectionTitle("Price"),
                  Text(
                    "\$${controller.priceRange.value.start.toInt()}-\$${controller.priceRange.value.end.toInt()}",
                    style: TextStyle(
                      color: AppColors.grey500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Obx(
              () => RangeSlider(
                values: controller.priceRange.value,
                min: 0,
                max: 500,
                activeColor: AppColors.primaryBlue,
                inactiveColor: AppColors.grey200,
                onChanged: (values) {
                  controller.priceRange.value = values;
                },
              ),
            ),
            const SizedBox(height: 10),

            // 3. Instant Book Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle("Instant Book"),
                    const SizedBox(height: 4),
                    Text(
                      "Book without waiting for the host to respond",
                      style: TextStyle(color: AppColors.grey400, fontSize: 11),
                    ),
                  ],
                ),
                Obx(
                  () => Switch(
                    value: controller.isInstantBook.value,
                    activeColor: AppColors.primaryWhite,
                    activeTrackColor: AppColors.primaryBlue,
                    onChanged: (val) => controller.isInstantBook.value = val,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildSectionTitle("Location"),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ["San Diego", "New York", "Amsterdam"].map((loc) {
                  return Obx(() {
                    bool isSelected = controller.selectedLocation.value == loc;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(loc),
                        selected: isSelected,
                        selectedColor: AppColors.primaryBlue,
                        backgroundColor: AppColors.primaryWhite,
                        labelStyle: MyTextStyle.normalTitleText(
                          color: isSelected
                              ? AppColors.primaryWhite
                              : AppColors.primaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                        onSelected: (selected) {
                          if (selected) controller.selectedLocation.value = loc;
                        },
                      ),
                    );
                  });
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),

            // 5. Facilities Checkboxes
            _buildSectionTitle("Facilities"),
            ...["Free Wifi", "Swimming Pool", "Tv", "Laundry"].map((facility) {
              return Obx(() {
                bool isChecked = controller.selectedFacilities.contains(
                  facility,
                );
                return CheckboxListTile(
                  title: Text(
                    facility,
                    style: MyTextStyle.normalTitleText(
                      color: AppColors.grey500,
                    ),
                  ),
                  value: isChecked,
                  activeColor: AppColors.primaryBlue,
                  onChanged: (checked) {
                    if (checked == true) {
                      controller.selectedFacilities.add(facility);
                    } else {
                      controller.selectedFacilities.remove(facility);
                    }
                  },
                  controlAffinity: ListTileControlAffinity.trailing,
                );
              });
            }),

            _buildSectionTitle("Ratings"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [5, 4, 3, 2, 1].map((stars) {
                return Obx(() {
                  bool isSelected = controller.selectedRating.value == stars;
                  return InkWell(
                    onTap: () => controller.selectedRating.value = stars,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryBlue
                              : AppColors.grey200,
                          width: isSelected ? 1.5 : 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: isSelected
                            ? AppColors.primaryBlue
                            : Colors.transparent,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: AppColors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            "$stars",
                            style: MyTextStyle.normalTitleText(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              }).toList(),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  controller.isFilterApplied.value = true;
                  controller.executeSearchAndFilter();
                  Get.back();
                },
                child: Text(
                  "Apply Filter",
                  style: MyTextStyle.normalTitleText(
                    color: AppColors.primaryWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
        fontWeight: FontWeight.bold,
        size: 16,
        color: AppColors.primaryBlack,
      ),
    );
  }
}
