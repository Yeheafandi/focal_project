import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focal_project/core/constants/app_colors.dart';
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
      margin: const EdgeInsets.all(AppSpaces.paddingLarge),
      padding: const EdgeInsets.all(AppSpaces.paddingLarge),
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
                style: MyTextStyle.normalTitleText(),
              ),
              GestureDetector(
                onTap: Get.back,
                child: Container(
                  padding: const EdgeInsets.all(AppSpaces.paddingSmall),
                  decoration: BoxDecoration(
                    color: AppColors.grey100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: AppSpaces.widthMedium,
                    color: AppColors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpaces.heightSmall),
          Divider(
            thickness: 1,
            color: AppColors.grey300,
          ),
          const SizedBox(height: AppSpaces.heightSmall),
          RecommendedHotelCard(
            hotel: hotel,
            underline: false,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpaces.paddingMedium,
                vertical: AppSpaces.paddingSmall),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Instastaycom/hotel/the-aston-...',
                    style: MyTextStyle.smallTitleText(size: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Clipboard.setData(
                      const ClipboardData(
                        text: 'https://instastaycom/hotel/the-aston-vill-hotel',
                      ),
                    );
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
                  label: Text('Copy',
                      style: MyTextStyle.smallTitleText(
                        color: AppColors.primaryBlue,
                      )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryWhite,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppSpaces.radiusSmall),
                      side: const BorderSide(color: AppColors.primaryWhite),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpaces.paddingMedium,
                      vertical: AppSpaces.paddingSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpaces.heightSmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShareOption(
                icon: Icons.wifi_tethering_rounded,
                color: const Color(0xFF1C1C1E),
                label: 'Airdrop',
                onTap: () {},
              ),
              ShareOption(
                icon: Icons.chat_bubble_rounded,
                color: const Color(0xFF4ADE80),
                label: 'Whatsapp',
                onTap: () {},
              ),
              ShareOption(
                icon: Icons.facebook_rounded,
                color: const Color(0xFF1877F2),
                label: 'Facebook',
                onTap: () {},
              ),
              ShareOption(
                icon: Icons.camera_alt_rounded,
                color: const Color(0xFFE1306C),
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
