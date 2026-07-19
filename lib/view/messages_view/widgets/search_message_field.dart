import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_spaces.dart';

class SearchMessageField extends StatelessWidget {
  const SearchMessageField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",

        prefixIcon: const Icon(Icons.search),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpaces.radiusExtraExtraLarge28),
        ),
      ),
    );
  }
}