import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class TrainerModuleTile extends StatelessWidget {
  final String title;
  final bool showEdit;
  final void Function()? editPress;
  final void Function()? viewModulePress;
  const TrainerModuleTile({
    super.key,
    required this.title,
    required this.showEdit,
    this.editPress,
    required this.viewModulePress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppPallete.primary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppPallete.border),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Image.network(
              'https://plus.unsplash.com/premium_photo-1661627522817-99a84c5c77e7?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              width: 36,
              height: 36,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                color: AppPallete.accentFB,
                child: const Icon(
                  Icons.image_outlined,
                  color: AppPallete.indigoNavy,
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(child: Text(title, style: AppTextStyle.s14w4i())),
          if (showEdit)
            IconButton(
              icon: Icon(
                Icons.edit_outlined,
                color: AppPallete.accent,
                size: 20,
              ),
              onPressed: editPress,
            ),
          GestureDetector(
            onTap: viewModulePress,
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: AppPallete.accent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
