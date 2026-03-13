import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final int lectures;
  final String imageUrl;
  final String? badge; // 'Free' or '$20'
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.title,
    required this.lectures,
    required this.imageUrl,
    this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppPallete.primary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppPallete.border),
          boxShadow: [
            BoxShadow(
              color: const Color(0x142E048E),
              blurRadius: 11,
              offset: const Offset(0, 21),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Image + Badge ──
            Stack(
              children: [
                ClipRRect(
                  // borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                if (badge != null)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0x66000000),
                        border: Border.all(color: AppPallete.border),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        badge!,
                        style: AppTextStyle.s14w4i(
                          color: AppPallete.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 6),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Title ──
                  Text(
                    title,
                    style: AppTextStyle.s14w4i(
                      fontWeight: FontWeight.w700,
                      color: AppPallete.bodyText,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 2),

                  // ── Lectures ──
                  Row(
                    children: [
                      Icon(
                        Icons.play_circle,
                        size: 14,
                        color: AppPallete.bodyText,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$lectures Lectures',
                        style: AppTextStyle.s14w4i(
                          color: AppPallete.bodyText,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
