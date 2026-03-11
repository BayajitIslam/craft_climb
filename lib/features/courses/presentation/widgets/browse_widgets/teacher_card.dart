import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class TeacherCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;

  const TeacherCard({
    super.key,
    required this.name,
    required this.role,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppPallete.primary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppPallete.accent10),
      ),
      child: Column(
        children: [
          ClipOval(
            child: Image.network(
              imageUrl,
              height: 52,
              width: 52,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: AppTextStyle.s24w7i(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          Text(
            role,
            style: AppTextStyle.s14w4i(
              color: AppPallete.bodyText,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
