import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.s16w4i(fontWeight: FontWeight.w600,color: AppPallete.black),
        ),
        GestureDetector(
          onTap: onSeeAll,
          child: Row(
            children: [
              Text(
                'See All',
                style: AppTextStyle.s16w4i(color: AppPallete.accent,fontSize: 12),
              ),
              Icon(Icons.chevron_right, color: AppPallete.accent, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}
