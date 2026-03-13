import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CSFeaturedJobCard extends StatelessWidget {
  final String title;
  final String location;
  final String salary;
  final String type;
  final String imageUrl;
  final VoidCallback onTap;

  const CSFeaturedJobCard({
    super.key,
    required this.title,
    required this.location,
    required this.salary,
    required this.type,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
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
        child: Row(
          children: [
            // ── Image ──
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  height: 80,
                  width: 80,
                  color: AppPallete.accent10,
                  child: Icon(Icons.image_outlined, color: AppPallete.accent),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // ── Info ──
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 12,
                        color: AppPallete.bodyText,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        location,
                        style: AppTextStyle.s16w4i(
                          color: AppPallete.extraAsh,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                 Spacer(),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          children: [
                            // Salary
                            Icon(
                              Icons.attach_money,
                              size: 12,
                              color: AppPallete.bodyText,
                            ),
                            Text(
                              salary,
                              style: AppTextStyle.s16w4i(
                                color: AppPallete.bodyText,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Type Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          type,
                          style: AppTextStyle.s16w4i(
                            color: AppPallete.bodyText,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
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
