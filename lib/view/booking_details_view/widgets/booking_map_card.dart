import 'package:flutter/material.dart';

class BookingMapCard extends StatelessWidget {

  const BookingMapCard({

    super.key,

    required this.latitude,

    required this.longitude,

  });

  final double latitude;

  final double longitude;

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.symmetric(horizontal: 16),

      height: 200,

      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),

      alignment: Alignment.center,

      child: const Text("Google Map"),

    );
  }
}