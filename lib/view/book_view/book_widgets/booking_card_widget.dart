import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/model/booking_details_model.dart';

class BookingCardWidget extends StatelessWidget {
  final BookingDetailsModel booking;

  const BookingCardWidget({super.key, required this.booking});

  Widget _buildImage() {
    final image = booking.hotelImage;
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpaces.radiusExtraLarge),
      child: SizedBox(
        width: 110,
        height: 170,
        child: image.startsWith('assets/')
            ? Image.asset(image, fit: BoxFit.cover)
            : Image.network(image, fit: BoxFit.cover),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        border: Border.all(color: AppColors.grey300),
        borderRadius: BorderRadius.circular(AppSpaces.radiusLarge),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSpaces.paddingMedium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            SizedBox(width: AppSpaces.widthSmall),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          booking.hotelName,
                          style: MyTextStyle.normalTitleText(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: AppColors.amber,
                            size: 20,
                          ),
                          SizedBox(width: AppSpaces.widthVerySmall),
                          Text(
                            booking.rating.toStringAsFixed(1),
                            style: MyTextStyle.normalTitleText(
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpaces.heightSmall),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppColors.grey500,
                      ),
                      SizedBox(width: AppSpaces.widthVerySmall),
                      Expanded(
                        child: Text(
                          booking.location,
                          style: MyTextStyle.smallTitleText(
                            color: AppColors.grey500,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpaces.heightSmall),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$${booking.price.toInt()}',
                          style: MyTextStyle.priceText(
                            color: AppColors.primary,
                            size: 16,
                          ),
                        ),
                        TextSpan(
                          text: ' /night',
                          style: MyTextStyle.normalTitleText(
                            fontWeight: FontWeight.w500,
                            color: AppColors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpaces.heightSmall),
                  Divider(color: AppColors.grey300),
                  SizedBox(height: AppSpaces.heightSmall),

                  _detailsRow(
                    icon: Icons.calendar_month_outlined,
                    title: "Dates",
                    details:
                        '${booking.checkIn.substring(0, 2)} - ${booking.checkOut}',
                  ),
                  SizedBox(height: AppSpaces.heightSmall),
                  _detailsRow(
                    icon: Icons.person_outline_rounded,
                    title: 'Guest',
                    details:
                        ' ${booking.guests} Guests (${booking.rooms} Room)',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _detailsRow({
  required IconData icon,
  required String title,
  required String details,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, size: 20, color: AppColors.grey600),
      Text(
        title,
        style: MyTextStyle.smallTitleText(
          color: AppColors.black87,
          size: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      Text(
        details,
        style: MyTextStyle.smallTitleText(
          color: AppColors.black87,
          size: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
