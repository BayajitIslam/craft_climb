import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ScoreRing extends StatelessWidget {
  final int score;
  const ScoreRing({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.6,
      width: 30.6,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: score / 100,
            strokeWidth: 4,
            backgroundColor: AppPallete.accent10,
            valueColor: AlwaysStoppedAnimation<Color>(AppPallete.accent),
            strokeCap: StrokeCap.round,
          ),
          Center(
            child: Text(
              '$score%',
              style: AppTextStyle.s14w4i(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppPallete.accent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
