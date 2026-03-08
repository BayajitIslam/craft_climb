import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
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
    this.backgroundColor = AppPallete.primary,
    this.onChat,
    this.onNotification,
    this.onBadge,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$name,', style: AppTextStyle.s16w4i(color: AppPallete.whiteD5)),
          Text(role, style: AppTextStyle.s14w4i(color: AppPallete.whiteD5)),
        ],
      ),
      actions: [
        // Badge — optional
        if (badge != null)
          GestureDetector(
            onTap: onBadge,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppPallete.white30,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text('🔥'),
                  SizedBox(width: 4),
                  Text(
                    badge!,
                    style: AppTextStyle.s14w4i(color: AppPallete.primary),
                  ),
                ],
              ),
            ),
          ),

        SizedBox(width: 8),

        // Chat
        IconButton(
          onPressed: onChat,
          icon: Icon(Icons.chat_bubble_outline, color: AppPallete.primary),
        ),

        // Notification
        IconButton(
          onPressed: onNotification,
          icon: Icon(Icons.notifications_outlined, color: AppPallete.primary),
        ),

        SizedBox(width: 8),
      ],
    );
  }
}
