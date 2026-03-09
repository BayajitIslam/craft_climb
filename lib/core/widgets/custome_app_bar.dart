import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String role;
  final String? badge; // "Wolf" — optional
  final Color backgroundColor;
  final VoidCallback? onChat;
  final VoidCallback? onNotification;
  final VoidCallback? onBadge;

  const CustomAppBar({
    super.key,
    required this.name,
    required this.role,
    this.badge,
    this.backgroundColor = AppPallete.accent,
    this.onChat,
    this.onNotification,
    this.onBadge,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.only(right: context.spacing12),
      backgroundColor: backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.only(left: context.spacing8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$name,',
              style: AppTextStyle.s24w7i(
                color: AppPallete.primary,
                fontSize: 20,
              ),
            ),
            Text(
              role,
              style: AppTextStyle.s14w4i(
                color: AppPallete.stroke,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      actions: [
        // Badge — optional
        if (badge != null)
          GestureDetector(
            onTap: onBadge,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacing16,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: AppPallete.primary,
                borderRadius: BorderRadius.circular(333333),
              ),

              child: Row(
                children: [
                  Image.asset(AppImages.badge, width: 20, height: 20),
                  SizedBox(width: 4),
                  Text(
                    badge!,
                    style: AppTextStyle.s14w4i(
                      color: AppPallete.bodyText,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

        SizedBox(width: context.spacing8),

        // Chat
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppPallete.primary,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(8),
          child: Image.asset(AppImages.chat, width: 24),
        ),
        // Notification
        SizedBox(width: 4),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppPallete.primary,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(8),
          child: Image.asset(AppImages.notification, width: 16),
        ),

        SizedBox(width: 8),
      ],
    );
  }
}
