import 'package:craft_climb/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class ForwardArrowButton extends StatelessWidget {
  const ForwardArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFDAE3FF),
      ),
      padding: EdgeInsets.all(10),
      child: Image.asset(AppImages.forwardArrow, width: 20, height: 20),
    );
  }
}
