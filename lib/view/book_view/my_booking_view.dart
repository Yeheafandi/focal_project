import 'package:flutter/material.dart';
import 'package:focal_project/view/book_view/book_widgets/tab_button.dart';
import 'package:get/get.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/book_view/book_controller/my_booking_controller.dart';
import 'package:focal_project/view/book_view/book_widgets/booking_card_widget.dart';
import 'package:focal_project/widgets/custom_search_bar.dart';

class MyBookingView extends StatelessWidget {
  MyBookingView({super.key});

  final MyBookingController controller = Get.put(
    MyBookingController(initialBookings: null),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryBlack),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'My Booking',
          style: MyTextStyle.normalTitleText(
            size: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.primaryBlack),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpaces.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSpaces.heightLarge),
              CustomSearchBar(hintText: 'Search...', onFilterTap: () {}),
              SizedBox(height: AppSpaces.heightLarge),
              _buildTabs(),
              SizedBox(height: AppSpaces.heightLarge),
              Expanded(
                child: Obx(() {
                  final bookings = controller.bookings;
                  if (bookings.isEmpty) {
                    return Center(
                      child: Text(
                        'No bookings found',
                        style: MyTextStyle.smallTitleText(
                          size: 14,
                          color: AppColors.grey600,
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: bookings.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: AppSpaces.heightLarge),
                    itemBuilder: (context, index) {
                      final booking = bookings[index];
                      return BookingCardWidget(booking: booking);
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Obx(() {
      return Row(
        children: [
          TabButton(
            title: 'Booked',
            index: 0,
            isSelected: controller.selectedTabIndex.value == 0,
            onTap: controller.changeTab,
          ),
          SizedBox(width: AppSpaces.widthSmall),
          TabButton(
            title: 'History',
            index: 1,
            isSelected: controller.selectedTabIndex.value == 1,
            onTap: controller.changeTab,
          ),
        ],
      );
    });
  }

  // Widget _buildTabButton(String title, int index) {
  //   return Expanded(
  //     child: Obx(() {
  //       final isSelected = controller.selectedTabIndex.value == index;
  //       return GestureDetector(
  //         onTap: () => controller.changeTab(index),
  //         child: Container(
  //           height: 46,
  //           decoration: BoxDecoration(
  //             color: isSelected ? AppColors.primaryWhite : AppColors.grey100,
  //             borderRadius: BorderRadius.circular(AppSpaces.radiusExtraLarge),
  //             border: Border.all(
  //               color: isSelected ? AppColors.primary : AppColors.grey300,
  //             ),
  //           ),
  //           child: Center(
  //             child: Text(
  //               title,
  //               style: MyTextStyle.normalTitleText(
  //                 size: 14,
  //                 color: isSelected
  //                     ? AppColors.primaryBlack
  //                     : AppColors.grey600,
  //                 fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     }),
  //   );
  // }
}
