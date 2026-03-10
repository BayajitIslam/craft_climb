import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  final IconData icon;
  final Gradient gradient;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
    required this.color,
    required this.icon,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppPallete.dropShadow,
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background icon watermark
          Positioned(
            bottom: -6,
            right: -6,
            child: Icon(icon, size: 64, color: AppPallete.white10),
          ),

          // Dot grid decoration
          Positioned(
            top: 8,
            left: 8,
            child: Wrap(
              spacing: 3,
              runSpacing: 3,
              children: List.generate(
                9,
                (_) => Container(
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    color: AppPallete.white30,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),

          // Value + label
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: AppTextStyle.s32w7i(
                    fontSize: 34,
                    color: AppPallete.primary,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  label,
                  style: AppTextStyle.s14w4i(
                    color: AppPallete.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
