import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileBlueHeader extends StatelessWidget {
  final String name;
  final String roleLabel;
  final String location;
  final String? imageUrl;
  final String? linkedin;
  final bool isCompany;

  const ProfileBlueHeader({
    super.key,
    required this.name,
    required this.roleLabel,
    required this.location,
    this.imageUrl,
    this.linkedin,
    this.isCompany = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SecandAppBar(title: 'Profile Update'),
        const SizedBox(height: 8),

        // Avatar
        CircleAvatar(
          radius: 50,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
          backgroundColor: AppPallete.accent10,
          child: imageUrl == null
              ? Icon(
                  isCompany ? Icons.business : Icons.person,
                  color: AppPallete.accent,
                  size: 44,
                )
              : null,
        ),
        const SizedBox(height: 10),

        // Name
        Text(
          name,
          style: AppTextStyle.s16w4i(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: AppPallete.bodyText,
          ),
        ),
        const SizedBox(height: 4),

        // LinkedIn
        if (linkedin != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: const Color(0xFF0077B5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(Icons.link, color: Colors.white, size: 12),
              ),
              const SizedBox(width: 5),
              Text(
                linkedin!,
                style: AppTextStyle.s14w4i(
                  color: AppPallete.coolGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        const SizedBox(height: 4),

        // Role • Location
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              roleLabel,
              style: AppTextStyle.s14w4i(color: AppPallete.coolGrey),
            ),
            Text(' • ', style: AppTextStyle.s14w4i(color: AppPallete.coolGrey)),
            Text(
              location,
              style: AppTextStyle.s14w4i(color: AppPallete.coolGrey),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
