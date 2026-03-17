import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class SecandAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color color;
  const SecandAppBar({
    super.key,
    required this.title,
    this.color = AppPallete.bodyText,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final canGoBack = Navigator.canPop(context);
    return AppBar(
      excludeHeaderSemantics: true,
      backgroundColor: AppPallete.primary,
      elevation: 0,
      forceMaterialTransparency: true,
      centerTitle: true,
      title: Text(
        title,
        style: AppTextStyle.s24w7i(
          color: color,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
      actionsPadding: const EdgeInsets.only(right: 16),
      actions: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppPallete.primary,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(8),
          child: Image.asset(AppImages.notification, width: 16),
        ),
      ],
      leadingWidth: canGoBack ? 52 : 0,
      leading: canGoBack
          ? GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(
                  color: AppPallete.primary,
                  shape: BoxShape.circle,
                ),
                margin: EdgeInsets.only(left: 16),
                child: Icon(Icons.arrow_back, color: AppPallete.bodyText),
              ),
            )
          : null,
    );
  }
}
