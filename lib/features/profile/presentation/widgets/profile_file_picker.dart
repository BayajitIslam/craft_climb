import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ProfileFilePicker extends StatelessWidget {
  final String hint;
  final VoidCallback onTap;
  final String label;
  const ProfileFilePicker({
    super.key,
    required this.hint,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //label
        Text(
          label,
          style: AppTextStyle.s16w4i(
            color: AppPallete.black75,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        //choice your file
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppPallete.border),
              borderRadius: BorderRadius.circular(6),
            ),

            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                //Choice your file
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppPallete.stroke,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppPallete.border),
                  ),
                  child: Text(
                    hint,
                    style: AppTextStyle.s14w4i(color: AppPallete.bodyText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
