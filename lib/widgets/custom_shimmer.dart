import 'package:flutter/material.dart';

class CustomShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const CustomShimmer({
    super.key,
    required this.width,
    required this.height,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}