import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/widgets/app_loader.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonName;
  final double borderRadius;
  final bool isLoading;
  final void Function()? onPressed;

  const PrimaryButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.borderRadius = 10,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPallete.accent,
        minimumSize: const Size.fromHeight(45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: isLoading
          ? AppLoader()
          : Text(
              buttonName,
              style: AppTextStyle.s16w4i(
                color: AppPallete.primary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
