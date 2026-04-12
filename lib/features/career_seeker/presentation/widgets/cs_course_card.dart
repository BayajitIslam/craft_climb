import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/features/job/presentation/widgets/score_ring.dart';
import 'package:flutter/material.dart';

class CSCourseCard extends StatelessWidget {
  final String title;
  final int lectures;
  final double progress;
  final String imageUrl;
  final VoidCallback? onTap;

  const CSCourseCard({
    super.key,
    required this.title,
    required this.lectures,
    required this.progress,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppPallete.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppPallete.dropShadow,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 110,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => Container(
                      height: 110,
                      color: AppPallete.accent10,
                      child: Icon(
                        Icons.image_outlined,
                        color: AppPallete.accent,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // ── Info ──
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyle.s14w4i(
                            fontWeight: FontWeight.w700,
                            color: AppPallete.bodyText,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(height: 4),
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
                              style: AppTextStyle.s16w4i(
                                color: AppPallete.bodyText,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 3),
                  //Score
                  ScoreRing(score: (progress * 100).toInt()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
