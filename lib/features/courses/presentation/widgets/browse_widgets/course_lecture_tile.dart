import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CourseLectureTileView extends StatelessWidget {
  final String title;
  final bool isLocked;
  final VoidCallback onTap;

  const CourseLectureTileView({
    super.key,
    required this.title,
    required this.onTap,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLocked ? null : onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppPallete.primary,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppPallete.accent10),
        ),
        child: Row(
          children: [
            // ── Image + Lock overlay ──
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=100',
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,

                    color: isLocked ? Colors.black.withOpacity(0.4) : null,
                    colorBlendMode: isLocked ? BlendMode.darken : null,
                  ),
                ),

                if (isLocked)
                  Positioned.fill(
                    child: Center(
                      child: Icon(Icons.lock, color: Colors.white, size: 16),
                    ),
                  ),
              ],
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: AppTextStyle.s14w4i(
                  color: isLocked ? AppPallete.bodyText : null,
                ),
              ),
            ),

            // ── Play button ──
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: isLocked ? AppPallete.accent10 : AppPallete.accent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow,
                color: isLocked ? AppPallete.bodyText : Colors.white,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
