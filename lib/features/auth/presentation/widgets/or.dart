import 'package:craft_climb/core/constants/app_strings.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/features/auth/presentation/widgets/dotted_line_painter.dart';
import 'package:flutter/material.dart';

class Or extends StatelessWidget {
  const Or({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //line
        CustomPaint(
          size: Size(context.cardWidth * 1.5, 1),
          painter: DottedLinePainter(),
        ),
        //or
        Text(
          AppStrings.or,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: AppPallete.lighBlueGray),
        ),
        //line
        CustomPaint(
          size: Size(context.cardWidth * 1.5, 1),
          painter: DottedLinePainter(),
        ),
      ],
    );
  }
}
