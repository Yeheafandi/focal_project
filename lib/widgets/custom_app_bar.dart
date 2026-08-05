import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_icons.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.onBack,
    this.action,
  });

  final String title;
  final bool showBackButton;
  final VoidCallback? onBack;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 56),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showBackButton
              ? InkWell(
                  onTap: onBack ?? () => Get.back(),
                  child: SvgPicture.asset(AppIcons.backArrow),
                )
              : const SizedBox(width: 24),

          Text(
            title,
            style: MyTextStyle.normalTitleText(
              size: 18,
              color: AppColors.primaryBlack,
              fontWeight: FontWeight.w600,
            ),
          ),

          action ?? const SizedBox(width: 24),
        ],
      ),
    );
  }
}
