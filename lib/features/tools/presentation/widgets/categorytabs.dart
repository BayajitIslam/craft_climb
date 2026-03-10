import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/screen_size.dart';

class CategoryTabs extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;

  const CategoryTabs({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: context.spacing16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onCategorySelected(index),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? AppPallete.accent : AppPallete.primary,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? AppPallete.accent : AppPallete.border,
                ),
              ),
              child: Text(
                categories[index],
                style: AppTextStyle.s14w4i(
                  color: isSelected ? AppPallete.primary : AppPallete.extraAsh,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}