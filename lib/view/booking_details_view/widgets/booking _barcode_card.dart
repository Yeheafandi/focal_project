import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class BookingBarcodeCard extends StatelessWidget {

  const BookingBarcodeCard({
    super.key,
    required this.barcode,
  });

  final String barcode;

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.all(16),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(

        children: [

          Container(
            height: 80,
            width: double.infinity,
            color: Colors.grey.shade300,
            alignment: Alignment.center,
            child: Text("booking_details.barcode_label".tr),         
             ),

          const SizedBox(height:12),

          Text(barcode),

        ],
      ),
    );
  }
}