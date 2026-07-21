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
        height: 130,
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
        borderRadius: BorderRadius.circular(AppSpaces.radiusExtraLarge),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey300.withOpacity(0.7),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSpaces.paddingNormal),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            SizedBox(width: AppSpaces.widthLarge),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          booking.hotelName,
                          style: MyTextStyle.normalTitleText(
                            size: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpaces.paddingSmall,
                          vertical: AppSpaces.paddingVerySmall,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.lightBlueBg,
                          borderRadius: BorderRadius.circular(
                            AppSpaces.radiusSmall,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: AppColors.amber, size: 14),
                            SizedBox(width: AppSpaces.widthVerySmall),
                            Text(
                              booking.rating.toStringAsFixed(1),
                              style: MyTextStyle.smallTitleText(
                                color: AppColors.primaryBlack,
                                size: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpaces.heightSmall),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: AppColors.grey600,
                      ),
                      SizedBox(width: AppSpaces.widthSmall),
                      Expanded(
                        child: Text(
                          booking.location,
                          style: MyTextStyle.smallTitleText(
                            color: AppColors.grey600,
                            size: 13,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpaces.heightMedium),
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
                          style: MyTextStyle.smallTitleText(
                            color: AppColors.grey600,
                            size: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpaces.heightMedium),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 14,
                        color: AppColors.grey600,
                      ),
                      SizedBox(width: AppSpaces.widthSmall),
                      Expanded(
                        child: Text(
                          'Dates ${booking.checkIn} - ${booking.checkOut}',
                          style: MyTextStyle.smallTitleText(
                            color: AppColors.grey600,
                            size: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpaces.heightSmall),
                  Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 14,
                        color: AppColors.grey600,
                      ),
                      SizedBox(width: AppSpaces.widthSmall),
                      Expanded(
                        child: Text(
                          'Guest ${booking.guests} Guests (${booking.rooms} Room)',
                          style: MyTextStyle.smallTitleText(
                            color: AppColors.grey600,
                            size: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
