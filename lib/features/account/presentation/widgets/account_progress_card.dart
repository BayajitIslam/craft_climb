import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:craft_climb/features/account/presentation/widgets/semi_circular_gauge_painter.dart';

class AccountProgressCard extends StatelessWidget {
  final int progress;
  final VoidCallback? onTap;

  const AccountProgressCard({super.key, required this.progress, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Gauge size scales with card width, capped for large screens
          final gaugeWidth = (constraints.maxWidth * 0.26).clamp(90.0, 120.0);
          final gaugeHeight = gaugeWidth * 0.85; // maintains arc proportion

          return Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppPallete.accent, width: 3),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFCCCCCC),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ── Left: Icon + Title + SubText ──
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppPallete.accent,
                                  const Color(0xFF5C7CFA),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.bolt_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              'Career Progress',
                              style: AppTextStyle.s16w4i(
                                fontWeight: FontWeight.w700,
                                color: AppPallete.bodyText,
                                fontSize: 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'See your progress and move closer\nto your career goals.',
                        style: AppTextStyle.s14w4i(
                          fontSize: 10,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                // ── Right: Semi Circular Gauge ──
                SizedBox(
                  width: gaugeWidth,
                  height: gaugeHeight,
                  child: CustomPaint(
                    painter: SemiCircularGaugePainter(
                      percentage: progress / 100,
                      activeColor: AppPallete.accent,
                      inactiveColor: Colors.grey.shade300,
                    ),
                    // Align text to the open bottom of the arc, not overlapping it
                    child: Align(
                      alignment: const Alignment(0, 1.15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$progress%',
                            style: AppTextStyle.s14w4i(
                              color: const Color(0xFFB07D2E),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'Completed',
                            style: AppTextStyle.s14w4i(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}