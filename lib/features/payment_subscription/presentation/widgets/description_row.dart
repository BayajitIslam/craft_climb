import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class DescriptionRow extends StatelessWidget {
  final String text;
  const DescriptionRow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check_circle, color: AppPallete.accent),
        SizedBox(width: context.spacing8),
        Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyle.s14w4i(
            fontWeight: FontWeight.w500,
            color: AppPallete.bodyText,
          ),
        ),
      ],
    );
  }
}
