import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/model/hotel_model.dart';
import 'package:focal_project/view/detail_view/detail_widgets/share_option.dart';
import 'package:focal_project/widgets/recommended_hotel_card.dart';
import 'package:get/get.dart';

class ShareWidget extends StatelessWidget {
  final HotelModel hotel;
  final String link;
  const ShareWidget({super.key, required this.hotel, required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppSpaces.paddingLarge),
      padding: EdgeInsets.all(AppSpaces.paddingLarge),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(AppSpaces.radiusExtraLarge),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Share this Service',
                style: MyTextStyle.normalTitleText(
                  fontWeight: FontWeight.w600,
                  size: 17,
                ),
              ),
              GestureDetector(
                onTap: Get.back,
                child: Container(
                  padding: EdgeInsets.all(AppSpaces.paddingVerySmall),
                  decoration: BoxDecoration(
                    color: AppColors.grey100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    size: AppSpaces.widthMedium,
                    color: AppColors.black87,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpaces.heightSmall),
          Divider(thickness: 1, color: AppColors.grey200),
          SizedBox(height: AppSpaces.heightSmall),
          RecommendedHotelCard(hotel: hotel, marginBottom: false),
          Container(
            height: 48.h,
            padding: EdgeInsets.symmetric(
              horizontal: AppSpaces.paddingMedium,
              vertical: AppSpaces.paddingSmall,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    link,
                    style: MyTextStyle.smallTitleText(size: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: link));
                    Get.snackbar(
                      'Copied!',
                      'Link copied to clipboard',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black87,
                      colorText: Colors.white,
                    );
                  },
                  icon: const Icon(
                    Icons.copy,
                    size: 14,
                    color: AppColors.primaryBlue,
                  ),
                  label: Text(
                    'Copy',
                    style: MyTextStyle.smallTitleText(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryWhite,

                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSpaces.radiusSmall,
                      ),
                      side: const BorderSide(color: AppColors.primaryWhite),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpaces.paddingMedium,
                      vertical: AppSpaces.paddingSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSpaces.heightNormal),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShareOption(
                icon: AppIcons.airdrop,
                color: AppColors.primaryBlack,
                label: 'Airdrop',
                onTap: () {},
              ),
              ShareOption(
                icon: AppIcons.whatsapp,
                color: AppColors.green,
                label: 'Whatsapp',
                onTap: () {},
              ),
              ShareOption(
                icon: AppIcons.facebook,
                color: AppColors.vividBlue,
                label: 'Facebook',
                onTap: () {},
              ),
              ShareOption(
                icon: AppIcons.instagram,
                color: AppColors.pink,
                label: 'Instagram',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
