import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class JobSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onFilter;
  final ValueChanged<String>? onChanged;

  const JobSearchBar({
    super.key,
    required this.controller,
    this.onFilter,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              color: AppPallete.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppPallete.dropShadow,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Search jobs here...',
                hintStyle: AppTextStyle.s14w4i(color: AppPallete.bodyText),
                prefixIcon: Icon(Icons.search, color: AppPallete.bodyText),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Filter Button
        GestureDetector(
          onTap: onFilter,
          child: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: AppPallete.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppPallete.dropShadow,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(Icons.tune, color: AppPallete.bodyText),
          ),
        ),
      ],
    );
  }
}
