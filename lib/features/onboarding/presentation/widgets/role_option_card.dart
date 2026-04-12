import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class RoleOptionCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String role;
  final bool isRoleSelected;
  final void Function()? onTap;
  const RoleOptionCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.role,
    this.isRoleSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 96,
        decoration: BoxDecoration(
          color: AppPallete.primary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            isRoleSelected
                ? BoxShadow(
                    color: const Color(0xFFD5ECFF),
                    blurRadius: 26,
                    spreadRadius: 0,
                    offset: Offset(0, 13),
                  )
                : BoxShadow(
                    color: AppPallete.dropShadow,
                    blurRadius: 26,
                    spreadRadius: 0,
                    offset: Offset(0, 13),
                  ),
          ],
          border: isRoleSelected
              ? Border.all(color: AppPallete.accent, width: 3)
              : null,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 9),
        margin: EdgeInsets.only(top: 12),
        child: Row(
          children: [
            //Image
            Container(
              height: 72,
              width: 89,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),

            //Title And Description
            SizedBox(width: context.spacing12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.s16w4i(
                      fontWeight: FontWeight.w600,
                      color: AppPallete.bodyText,
                    ),
                  ),
                  Text(description, style: AppTextStyle.s14w4i()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
