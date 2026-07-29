import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';
import 'package:focal_project/core/constants/app_spaces.dart';
import 'package:focal_project/core/constants/text_style.dart';

class FacilitySectionCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final int count;
  final List<String> children;
  final bool initiallyExpanded;

  const FacilitySectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.count,
    required this.children,
    this.initiallyExpanded = false,
  });

  @override
  State<FacilitySectionCard> createState() => _FacilitySectionCardState();
}

class _FacilitySectionCardState extends State<FacilitySectionCard> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(AppSpaces.radiusMedium),
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: AppColors.transparent),
        child: ExpansionTile(
          initiallyExpanded: widget.initiallyExpanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          childrenPadding: EdgeInsets.zero,
          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          leading: Icon(widget.icon, color: AppColors.primaryBlack, size: 24),
          title: RichText(
            text: TextSpan(
              text: "${widget.title} ",
              style: MyTextStyle.normalTitleText(
                size: 16,
                color: AppColors.primaryBlack,
              ),
              children: [
                TextSpan(
                  text: "(${widget.count} facilities)",
                  style: MyTextStyle.smallTitleText(
                    color: AppColors.grey500,
                    fontWeight: FontWeight.w400,
                    size: 12,
                  ),
                ),
              ],
            ),
          ),
          trailing: Icon(
            _isExpanded ? Icons.remove : Icons.add,
            color: AppColors.primaryBlack,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 54,
                right: 16,
                bottom: 12,
                top: 0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.children
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 2.0,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: AppColors.grey500,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                item,
                                style: MyTextStyle.smallTitleText(
                                  color: AppColors.grey600,
                                  fontWeight: FontWeight.w400,
                                  size: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
