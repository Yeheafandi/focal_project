import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/book_view/book_controller/book_controller.dart';
import 'package:focal_project/view/book_view/book_widgets/date_booking_widget.dart';
import 'package:focal_project/view/book_view/book_widgets/date_dailog.dart';
import 'package:focal_project/view/book_view/book_widgets/guest_counter_widget.dart';
import 'package:focal_project/view/book_view/book_widgets/payment_detail_row.dart';
import 'package:focal_project/view/book_view/book_widgets/payment_method_card.dart';
import 'package:focal_project/widgets/custome_button.dart';
import 'package:get/get.dart';

class RequestToBookView extends StatelessWidget {
  final RequestToBookController controller = Get.put(RequestToBookController());

  RequestToBookView({super.key});
  Future<void> _pickDate({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required ValueChanged<DateTime> onPicked,
  }) async {
    await Get.dialog(
      DateDailog(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        onPicked: onPicked,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryBlack),
          onPressed: () => Get.back(),
        ),
        title: Text(
         'booking.request_to_book'.tr,
          style: MyTextStyle.normalTitleText(
            size: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.primaryBlack),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(AppSpaces.paddingExtraLarge),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date', style: MyTextStyle.normalTitleText(size: 16)),
                    SizedBox(height: AppSpaces.heightNormal),
                    Row(
                      children: [
                        Expanded(
                          child: DateBookingWidget(
                            label: 'booking.check_in'.tr,
                            dateText: controller.formatDate(
                              controller.checkInDate.value,
                            ),
                            onTap: () => _pickDate(
                              context: context,
                              initialDate: controller.checkInDate.value,
                              firstDate: DateTime.now(),
                              onPicked: controller.setCheckInDate,
                            ),
                          ),
                        ),
                        SizedBox(width: AppSpaces.widthMedium),
                        Expanded(
                          child: DateBookingWidget(
                            label: 'booking.check_out'.tr,
                            dateText: controller.formatDate(
                              controller.checkOutDate.value,
                            ),
                            onTap: () => _pickDate(
                              context: context,
                              initialDate: controller.checkOutDate.value,
                              firstDate: controller.checkInDate.value.add(
                                const Duration(days: 1),
                              ),
                              onPicked: controller.setCheckOutDate,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpaces.heightLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('booking.guest'.tr, style: MyTextStyle.normalTitleText()),
                        GuestCounterWidget(
                          count: controller.guestCount.value,
                          onIncrement: controller.incrementGuest,
                          onDecrement: controller.decrementGuest,
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpaces.heightLarge),
                    Text('booking.pay_with'.tr, style: MyTextStyle.normalTitleText()),
                    SizedBox(height: AppSpaces.heightNormal),
                    PaymentMethodCard(
                      methodName: controller.paymentMethodName.value,
                      accountNumber: controller.paymentMethodNumber.value,
                      onEdit: () {},
                    ),
                    SizedBox(height: AppSpaces.heightLarge),
                    Text(
                      'booking.payment_details'.tr,
                      style: MyTextStyle.normalTitleText(),
                    ),
                    SizedBox(height: AppSpaces.heightSmall + 2),
                    PaymentDetailRow(
                      label: 'booking.total_nights'.tr.replaceFirst('@count', controller.nightCount.toString()),
                      value: '\$${controller.nightsTotal.toInt()}',
                    ),
                    SizedBox(height: AppSpaces.heightSmall + 2),

                    PaymentDetailRow(
                      label: 'booking.cleaning_fee'.tr,
                      value: '\$${controller.cleaningFee.toInt()}',
                    ),
                    SizedBox(height: AppSpaces.heightSmall + 2),
                    PaymentDetailRow(
                      label: 'booking.service_fee'.tr,
                      value: '\$${controller.serviceFee.toInt()}',
                    ),
                    Divider(
                      color: AppColors.grey300,
                      thickness: 1,
                      height: AppSpaces.heightLarge,
                    ),
                    PaymentDetailRow(
                      label: 'booking.total_payment'.tr,
                      value: '\$${controller.totalPayment.toInt()}',
                      isTotal: true,
                    ),
                    SizedBox(height: AppSpaces.heightExtraLarge),
                  ],
                ),
              ),
            ),
          ),

          CustomeButton(text: "booking.checkout".tr, onPressed: controller.checkout),
          SizedBox(height: AppSpaces.heightExtraLarge),
        ],
      ),
    );
  }
}
