import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';
import 'package:focal_project/view/book_view/book_controller/book_controller.dart';
import 'package:focal_project/view/book_view/book_widgets/date_booking_widget.dart';
import 'package:focal_project/view/book_view/book_widgets/guest_counter_widget.dart';
import 'package:focal_project/view/book_view/book_widgets/payment_detail_row.dart';
import 'package:focal_project/view/book_view/book_widgets/payment_method_card.dart';
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
    final selected = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selected != null) {
      onPicked(selected);
    }
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
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryBlack,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Request to book',
          style: MyTextStyle.normalTitleText(
            size: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: AppColors.primaryBlack,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpaces.paddingLarge,
                vertical: AppSpaces.paddingNormal,
              ),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date',
                      style: MyTextStyle.normalTitleText(
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpaces.heightMedium),
                    Row(
                      children: [
                        Expanded(
                          child: DateBookingWidget(
                            label: 'Check - In',
                            dateText: controller.formatDate(
                              controller.checkInDate.value,
                            ),
                            onTap: () => _pickDate(
                              context: context,
                              initialDate: controller.checkInDate.value,
                              firstDate: DateTime(2020),
                              onPicked: controller.setCheckInDate,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpaces.widthMedium),
                        Expanded(
                          child: DateBookingWidget(
                            label: 'Check - Out',
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
                    const SizedBox(height: AppSpaces.heightLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Guest',
                          style: MyTextStyle.normalTitleText(
                            size: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GuestCounterWidget(
                          count: controller.guestCount.value,
                          onIncrement: controller.incrementGuest,
                          onDecrement: controller.decrementGuest,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpaces.heightLarge),
                    Text(
                      'Pay With',
                      style: MyTextStyle.normalTitleText(
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpaces.heightMedium),
                    PaymentMethodCard(
                      methodName: controller.paymentMethodName.value,
                      accountNumber: controller.paymentMethodNumber.value,
                      onEdit: () {},
                    ),
                    const SizedBox(height: AppSpaces.heightLarge),
                    Text(
                      'Payment Details',
                      style: MyTextStyle.normalTitleText(
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpaces.heightMedium),
                    PaymentDetailRow(
                      label: 'Total : ${controller.nightCount} Night',
                      value: '\$${controller.nightsTotal.toInt()}',
                    ),
                    PaymentDetailRow(
                      label: 'Cleaning Fee',
                      value: '\$${controller.cleaningFee.toInt()}',
                    ),
                    PaymentDetailRow(
                      label: 'Service Fee',
                      value: '\$${controller.serviceFee.toInt()}',
                    ),
                    Divider(
                      color: AppColors.grey300,
                      thickness: 1,
                      height: AppSpaces.heightLarge,
                    ),
                    PaymentDetailRow(
                      label: 'Total Payment:',
                      value: '\$${controller.totalPayment.toInt()}',
                      isTotal: true,
                    ),
                    const SizedBox(height: AppSpaces.heightExtraLarge),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpaces.paddingLarge,
              AppSpaces.paddingSmall,
              AppSpaces.paddingLarge,
              AppSpaces.paddingLarge,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: controller.checkout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.primaryWhite,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppSpaces.radiusMedium,
                    ),
                  ),
                ),
                child: Text(
                  'Checkout',
                  style: MyTextStyle.normalTitleText(
                    color: AppColors.primaryWhite,
                    size: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
