import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String buttonName;
  final void Function()? ontap;
  const SocialButton({super.key, required this.buttonName, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppPallete.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppPallete.lighBlueGray),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icon
            Image.asset(AppImages.google, width: 20, height: 20),

            //Text
            SizedBox(width: context.spacing4),
            Text(
              buttonName,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppPallete.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
