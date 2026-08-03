import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:get/get.dart';

class DateDailog extends StatelessWidget {
  const DateDailog({
    super.key,
    required this.context,
    required this.initialDate,
    required this.firstDate,
    required this.onPicked,
  });
  final BuildContext context;
  final DateTime initialDate;
  final DateTime firstDate;
  final ValueChanged<DateTime> onPicked;

  @override
  Widget build(BuildContext context) {
    DateTime selected = initialDate;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: AppColors.primaryWhite,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppSpaces.heightMedium),

            Text(
              "select_date".tr,
              style: MyTextStyle.normalTitleText(
                size: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "assets/fonts/Jost-SemiBold.ttf",
              ),
            ),
            SizedBox(height: AppSpaces.heightMedium),
            //  تقويم اختيار التاريخ متوافق مع الالوان
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: AppColors.primary,
                  onPrimary: AppColors.primaryWhite,
                  onSurface: AppColors.primaryBlack,
                ),
                datePickerTheme: DatePickerThemeData(
                  // 1. جعل مربع التحديد بحواف دائرية بدل دائرة
                  dayShape: WidgetStateProperty.resolveWith((states) {
                    return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // التحكم بمدى تدوير الزوايا للمربع
                    );
                  }),
                  // 3. محاذاة اسم الشهر والسنة في المنتصف بين الأسهم
                  headerHeadlineStyle: MyTextStyle.normalTitleText(
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              child: SizedBox(
                height: 330,
                width: 320,
                child: CalendarDatePicker(
                  initialDate: initialDate,
                  firstDate: firstDate,
                  lastDate: DateTime(2030),
                  onDateChanged: (date) {
                    selected = date;
                  },
                ),
              ),
            ),
            SizedBox(height: AppSpaces.heightLarge),

            //  الأزرار المخصصة في المنتصف
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // زر الإلغاء
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: AppColors.red,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => Get.back(),
                    child: Text(
                     'cancel'.tr,
                      style: MyTextStyle.normalTitleText(
                        size: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.red,
                        fontFamily: "assets/fonts/Jost-Medium.ttf",
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // زر التأكيد (Apply)
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.primaryWhite,
                      elevation: 2,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      onPicked(selected);
                      Get.back();
                    },
                    child: Text(
                     'apply'.tr,
                      style: MyTextStyle.normalTitleText(
                        size: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryWhite,
                        fontFamily: "assets/fonts/Jost-Medium.ttf",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
