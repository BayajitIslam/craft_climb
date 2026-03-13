import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ProfileSkillWrap extends StatelessWidget {
  final List<String> skills;

  const ProfileSkillWrap({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 55,
      runSpacing: 6,
    
      children: skills
          .map(
            (skill) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('• ', style: AppTextStyle.s12w4i()),
                Text(
                  skill,
                  style: AppTextStyle.s16w4i(color: Colors.grey.shade700),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
