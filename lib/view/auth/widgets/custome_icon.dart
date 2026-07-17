import 'package:flutter/material.dart';

class CustomeIcon extends StatelessWidget {
  const CustomeIcon(this.image, {super.key});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(width: 72,height: 48,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Image.asset(
        image,
        width: 24,
        height: 24,
      ),
    );
  }
}
