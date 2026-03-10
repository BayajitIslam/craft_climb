import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final int lectures;
  final String imageUrl;
  final bool isLast;
  final void Function()? onTap;

  const CourseCard({
    super.key,
    required this.title,
    required this.lectures,
    required this.imageUrl,
    required this.isLast,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppPallete.primary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppPallete.border),
          boxShadow: [
            BoxShadow(
              color: AppPallete.dropShadow,
              blurRadius: 21,
              offset: const Offset(0, 11),
            ),
          ],
        ),
        padding: EdgeInsets.all(context.spacing8),
        margin: EdgeInsets.only(bottom: context.spacing12),
        child: Row(
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 88,
                height: 66,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  width: 88,
                  height: 66,
                  color: AppPallete.accentFB,
                  child: const Icon(
                    Icons.image_outlined,
                    color: AppPallete.indigoNavy,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),

            // Title + lectures
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(title, style: AppTextStyle.s24w7i(fontSize: 16)),
                  SizedBox(height: context.spacing8),
                  Row(
                    children: [
                      const Icon(
                        Icons.play_circle_fill,
                        color: AppPallete.indigoNavy,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '$lectures Lectures',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppPallete.black75,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Arrow
            const Icon(
              Icons.chevron_right,
              color: AppPallete.extraAsh,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
