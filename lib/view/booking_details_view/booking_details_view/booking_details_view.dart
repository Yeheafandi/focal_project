import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/booking_details_view/booking_details_controller/booking_details_controller.dart';
import 'package:focal_project/view/booking_details_view/widgets/booking_info_card.dart';
import 'package:focal_project/view/booking_details_view/widgets/hotel_card.dart';
import 'package:focal_project/view/home_view/home_widgets/near_you_map_card.dart';
import 'package:get/get.dart';

class BookingDetailsView extends StatelessWidget {
  BookingDetailsView({super.key});
  final controller = Get.put(BookingDetailsController());

  @override
  Widget build(BuildContext context) {
    final booking = controller.booking;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryBlack,
                      ),
                    ),
                    Text(
                      'Booking Detail',
                      style: MyTextStyle.normalTitleText(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        color: AppColors.primaryBlack,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSpaces.heightLarge),
                Container(
                  margin: EdgeInsets.only(bottom: 46),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey300),
                    borderRadius: BorderRadius.circular(
                      AppSpaces.paddingMedium,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: AppSpaces.heightMedium),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Your Hotel',
                          style: MyTextStyle.smallTitleText(),
                        ),
                      ),
                      SizedBox(height: AppSpaces.heightMedium),
                      HotelCard(
                        hotelName: booking.hotelName,
                        hotelImage: booking.hotelImage,
                        location: booking.location,
                        price: booking.price,
                        rating: booking.rating,
                      ),
                      SizedBox(height: AppSpaces.heightLarge),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Location',
                              style: MyTextStyle.smallTitleText(),
                            ),
                            Text(
                              'Open Map',
                              style: MyTextStyle.smallTitleText().copyWith(
                                color: AppColors.indigo,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSpaces.heightSmall),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: NearYouMapCard(areaName: 'haight St'),
                      ),

                      SizedBox(height: AppSpaces.heightLarge),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Your Booking',
                          style: MyTextStyle.smallTitleText(),
                        ),
                      ),
                      SizedBox(height: AppSpaces.heightSmall),
                      BookingInfoCard(booking: booking),
                      SizedBox(height: 46),

                      Image.asset(AppImages.barcode),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
