import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CoursePriceField extends StatelessWidget {
  final TextEditingController controller;
  const CoursePriceField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: '100',
        hintStyle: AppTextStyle.s14w4i(color: AppPallete.bodyText),
        suffixIcon: Container(
          margin: const EdgeInsets.all(6),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: AppPallete.accent10,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: '\$',
              isDense: true,
              icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 16),
              iconEnabledColor: AppPallete.bodyText,
              style: AppTextStyle.s14w4i(color: AppPallete.accent),
              dropdownColor: AppPallete.primary,
              borderRadius: BorderRadius.circular(10),
              items: [
                '\$',
                '€',
                '£',
                '¥',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (_) {},
            ),
          ),
        ),
        filled: true,
        fillColor: AppPallete.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppPallete.accent10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppPallete.accent10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppPallete.accent),
        ),
      ),
    );
  }
}
