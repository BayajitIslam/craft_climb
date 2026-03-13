import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class JobFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const JobFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
          label,
          style: AppTextStyle.s14w4i(
            fontSize: 12,
            color: isSelected ? Colors.white : AppPallete.bodyText,
          ),
        ),
      ),
    );
  }
}
