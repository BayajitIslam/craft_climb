import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CompleteProfileBanner extends StatelessWidget {
  final double progress;
  final VoidCallback? onTap;

  const CompleteProfileBanner({
    super.key,
    required this.progress,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).toInt();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppPallete.primary,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppPallete.dropShadow,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // ── Icon ──
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppPallete.accent10,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.person_outline, color: AppPallete.accent),
            ),
            const SizedBox(width: 12),

            // ── Text + Progress ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Complete Your Profile',
                    style: AppTextStyle.s14w4i(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Update your Resume',
                    style: AppTextStyle.s16w4i(color: AppPallete.bodyText,fontSize: 12),
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: AppPallete.accent10,
                      color: AppPallete.accent,
                      minHeight: 5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // ── Percentage ──
            Text(
              '$percent%',
              style: AppTextStyle.s16w4i(
                color: AppPallete.accent,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
