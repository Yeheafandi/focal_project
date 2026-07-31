
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_images.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';


/// ويدجت مشترك بين أكتر من شاشة (مو خاص بصفحة وحدة)، لهيك حاطينه بـ views/widgets
/// مباشرة، مش جوا فولدر صفحة معينة
class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({super.key, required this.currentIndex, required this.onTap});

  static const List<_NavItem> _items = [
    _NavItem(icon: AppImages.homeIcon, iconFill: AppImages.homeIconFill, label: 'Home'),
    _NavItem(icon: AppImages.bookingIcon, iconFill: AppImages.bookingIconFill, label: 'My Booking'),
    _NavItem(icon: AppImages.messageIcon, iconFill: AppImages.messageIconFill, label: 'Message'),
    _NavItem(icon: AppImages.profileIcon, iconFill: AppImages.profileIconFill, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        boxShadow: [
          BoxShadow(color: AppColors.black87.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -2)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpaces.paddingSmall),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (index) {
              final isActive = index == currentIndex;
              final item = _items[index];
              final color = isActive ? AppColors.primary : AppColors.grey600;
              return GestureDetector(
                onTap: () => onTap(index),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(isActive ? item.iconFill : item.icon, width: 22, height: 22),
                    SizedBox(height: AppSpaces.heightVerySmall),
                    Text(
                      item.label,
                      style: MyTextStyle.smallTitleText(
                        color: color,
                        fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final String icon;
  final String iconFill;
  final String label;
  const _NavItem({required this.icon, required this.iconFill, required this.label});
}