
import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:get/get.dart';


/// Dialog تأكيد تسجيل الخروج - منستدعيها عن طريق LogoutDialog.show()
/// وبترجع true إذا المستخدم أكد الخروج، false أو null إذا ألغى
class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  /// دالة مختصرة لعرض الـ Dialog من أي مكان (مثلاً من الكنترولر)
  static Future<bool?> show() {
    return Get.dialog<bool>(const LogoutDialog(), barrierDismissible: true);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.primaryWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpaces.radiusExtraLarge),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpaces.paddingExtraLarge,
          vertical: AppSpaces.paddingExtraLarge32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // الدائرة الوردية بعلامة الاستفهام
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.red, width: 2),
              ),
              child: Center(
                child: Text(
                  '?',
                  style: MyTextStyle.onBoarding(
                    color: AppColors.red,
                    size: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSpaces.heightNormal),
            Text(
              'are_you_sure'.tr,
              style: MyTextStyle.normalTitleText(color: AppColors.titleColor, size: 18),
            ),
            SizedBox(height: AppSpaces.heightVerySmall),
            Text(
              'do_you_want_to_log_out'.tr,
              style: MyTextStyle.smallTitleText(color: AppColors.subtitleColor, size: 13),
            ),
            SizedBox(height: AppSpaces.heightLarge),
            Row(
              children: [
                // زر Log Out - outline وردي
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(result: true),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.red),
                      padding: EdgeInsets.symmetric(vertical: AppSpaces.paddingMedium),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
                      ),
                    ),
                    child: Text(
                      'log_out'.tr,
                      style: MyTextStyle.normalTitleText(color: AppColors.red, size: 14),
                    ),
                  ),
                ),
                SizedBox(width: AppSpaces.widthMedium),
                // زر Cancel - تعبئة زرقاء
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(result: false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: AppSpaces.paddingMedium),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
                      ),
                    ),
                    child: Text(
                      'cancel'.tr,
                      style: MyTextStyle.normalTitleText(color: AppColors.primaryWhite, size: 14),
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