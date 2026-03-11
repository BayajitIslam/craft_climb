import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class CareerRoadmapBanner extends StatelessWidget {
  final int progress;
  final VoidCallback? onViewDetails;

  const CareerRoadmapBanner({
    super.key,
    required this.progress,
    this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0f1729), Color(0xFF1e3b8a)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //--- Stash Icon ---//
              Container(
                width: 52,

                decoration: BoxDecoration(
                  color: AppPallete.white30,
                  borderRadius: BorderRadius.circular(3333),
                ),
                padding: EdgeInsets.all(12),
                child: Image.asset(AppImages.stashTarget),
              ),
              // ── White Score Ring ──
              SizedBox(
                height: 52,
                width: 52,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: progress / 100,
                      strokeWidth: 5,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                      strokeCap: StrokeCap.round,
                    ),
                    Center(
                      child: Text(
                        '$progress%',
                        style: AppTextStyle.s16w4i(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: context.spacing16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Career Roadmap',
                style: AppTextStyle.s16w4i(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Complete Modules to Update Career Roadmap Progress',
                style: AppTextStyle.s16w4i(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(height: 12),

              // ── View Details Button ──
              GestureDetector(
                onTap: onViewDetails,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'View Details',
                    style: AppTextStyle.s16w4i(
                      fontSize: 14,
                      color: AppPallete.accent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
