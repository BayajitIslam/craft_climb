import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AccountUserCard extends StatelessWidget {
  final String name;
  final String email;
  final String? imageUrl;
  final VoidCallback? onTap;

  const AccountUserCard({
    super.key,
    required this.name,
    required this.email,
    this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppPallete.primary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFCCCCCC),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
            backgroundColor: AppPallete.accent10,
            child: imageUrl == null
                ? Icon(Icons.person, color: AppPallete.accent, size: 28)
                : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyle.s16w4i(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: AppPallete.bodyText,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  email,
                  style: AppTextStyle.s14w4i(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppPallete.accent, AppPallete.accent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                weight: 2,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
