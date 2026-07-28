import 'package:flutter/material.dart';
import 'package:focal_project/view/search_section/search_view/search_filter_controller/search_filter_controller.dart';
import 'package:focal_project/widgets/recommended_hotel_card.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class RecentlyViewedList extends StatelessWidget {
  const RecentlyViewedList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchFilterController>();

    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.recentlyViewedHotels.length,
        itemBuilder: (context, index) {
          final hotel = controller.recentlyViewedHotels[index];

          return RecommendedHotelCard(hotel: hotel);
        },
      ),
    );
  }
}
