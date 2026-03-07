import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class OnboardingSlide extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const OnboardingSlide({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Image
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Image.asset(image),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spacing24),
          child: Column(
            children: [
              //Title
              SizedBox(height: context.spacing24),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.s32w7i(),
              ),

              //Description
              SizedBox(height: context.spacing16),
              Text(
                description,
                textAlign: TextAlign.center,
                style: AppTextStyle.s16w4i(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
