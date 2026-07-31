import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/core/services/booking_details_services.dart';
import 'package:focal_project/view/booking_details_view/booking_details_controller/booking_details_controller.dart';
import 'package:focal_project/view/booking_details_view/widgets/booking_info_card.dart';
import 'package:focal_project/view/booking_details_view/widgets/hotel_card.dart';
import 'package:focal_project/view/home_view/home_widgets/near_you_map_card.dart';
import 'package:focal_project/view/nearby_map_view/nearby_map_view.dart';
import 'package:get/get.dart';

class BookingDetailsView extends StatelessWidget {
  BookingDetailsView({super.key});
  final controller = Get.put(BookingDetailsController(bookingId: 1,
    service: BookingDetailsService()));

  @override
  Widget build(BuildContext context) {
    final booking = controller.booking;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 56),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back, color: AppColors.primaryBlack),
                ),
                Text('Booking Detail', style: MyTextStyle.normalTitleText()),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert, color: AppColors.primaryBlack),
                ),
              ],
            ),
            SizedBox(height: AppSpaces.heightLarge),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
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
                          style: MyTextStyle.smallTitleText(
                            color: AppColors.grey600,
                            fontWeight: FontWeight.w600,
                            size: 14,
                          ),
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
                              style: MyTextStyle.smallTitleText(
                                color: AppColors.grey600,
                                fontWeight: FontWeight.w600,
                                size: 14,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => NearbyMapView());
                              },
                              child: Text(
                                'Open Map',
                                style: MyTextStyle.smallTitleText(
                                  color: AppColors.primaryBlue,
                                  size: 14,
                                  fontWeight: FontWeight.w600,
                                ),
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
                          style: MyTextStyle.smallTitleText(
                            color: AppColors.grey600,
                            fontWeight: FontWeight.w600,
                            size: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: AppSpaces.heightSmall),
                      BookingInfoCard(booking: booking),
                      SizedBox(height: AppSpaces.heightExtraLarge),

                      Image.asset(AppImages.barcode),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
