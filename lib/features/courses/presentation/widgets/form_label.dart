import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CourseFormLabel extends StatelessWidget {
  final String label;
  const CourseFormLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        label,
        style: AppTextStyle.s16w4i(
          fontWeight: FontWeight.w500,
          color: AppPallete.black,
        ),
      ),
    );
  }
}
