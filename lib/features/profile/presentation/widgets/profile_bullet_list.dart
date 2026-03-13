import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ProfileBulletList extends StatelessWidget {
  final List<String> items;
  final double indent;

  const ProfileBulletList({super.key, required this.items, this.indent = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: EdgeInsets.only(left: indent, bottom: 3),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• ',
                    style: AppTextStyle.s14w4i(color: AppPallete.subTextColor),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: AppTextStyle.s14w4i(
                        color: AppPallete.subTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
