import 'package:flutter/material.dart';
import '../../../../core/constants/app_spaces.dart';
import 'category_tabs.dart';
import 'search_card_item.dart';

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CategoryTabs(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: AppSpaces.paddingLarge),
            child: Column(
              children: [
                 SizedBox(height: AppSpaces.heightSmall),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) => const SearchCardItem(),
                ),
                 SizedBox(height: AppSpaces.paddingLarge),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
