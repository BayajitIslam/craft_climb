import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/features/chat/presentation/pages/conversations_page.dart';
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
    this.backgroundColor = AppPallete.transparent,
    this.onChat,
    this.onNotification,
    this.onBadge,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.only(right: 12),
      backgroundColor: backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      forceMaterialTransparency: true,
      title: Padding(
        padding: EdgeInsets.only(left: context.spacing8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              '$name,',
              style: AppTextStyle.s24w7i(color: AppPallete.black, fontSize: 20),
            ),
            Text(
              role,
              style: AppTextStyle.s14w4i(
                color: AppPallete.black75,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: 12),
        child: CircleAvatar(
          radius: 18,
          backgroundImage: const NetworkImage(
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
          ),
          backgroundColor: AppPallete.accent10,
        ),
      ),
      leadingWidth: 66,

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
        GestureDetector(
          onTap: () {
            Navigator.push(context, ConversationsPage.route());
          },
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppPallete.primary,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8),
            child: Image.asset(AppImages.chat, width: 24),
          ),
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
