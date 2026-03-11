import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/features/job/presentation/widgets/score_ring.dart';
import 'package:flutter/material.dart';

class ApplicantTile extends StatelessWidget {
  final String name;
  final int score;
  final String imageUrl;

  const ApplicantTile({
    super.key,
    required this.name,
    required this.score,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppPallete.primary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppPallete.accent10,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // ── Avatar ──
          CircleAvatar(radius: 22, backgroundImage: NetworkImage(imageUrl)),
          const SizedBox(width: 12),

          // ── Name ──
          Expanded(
            child: Text(
              name,
              style: AppTextStyle.s14w4i(fontWeight: FontWeight.w600),
            ),
          ),

          // ── Score ──
          Text(
            'Score',
            style: AppTextStyle.s14w4i(
              fontWeight: FontWeight.w600,
              color: AppPallete.bodyText,
            ),
          ),
          const SizedBox(width: 10),

          // ── Score Ring ──
          ScoreRing(score: score),

          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
