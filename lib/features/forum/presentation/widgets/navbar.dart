import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/app_text_style.dart';
class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> navItems = [
      {'icon': Icons.home_outlined, 'activeIcon': Icons.home, 'label': 'Home'},
      {'icon': Icons.work_outline, 'activeIcon': Icons.work, 'label': 'Jobs'},
      {'icon': Icons.build_outlined, 'activeIcon': Icons.build, 'label': 'Tools'},
      {'icon': Icons.forum_outlined, 'activeIcon': Icons.forum, 'label': 'Forum'},
      {
        'icon': Icons.track_changes_outlined,
        'activeIcon': Icons.track_changes,
        'label': 'Career Hub'
      },
      {
        'icon': Icons.person_outline,
        'activeIcon': Icons.person,
        'label': 'Account'
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppPallete.primary,
        boxShadow: [
          BoxShadow(
            color: AppPallete.dropShadow,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(navItems.length, (index) {
              final item = navItems[index];
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () => onTap(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isSelected ? item['activeIcon'] : item['icon'],
                      color: isSelected
                          ? AppPallete.accent
                          : AppPallete.extraAsh,
                      size: 22,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item['label'],
                      style: AppTextStyle.s14w4i(
                        color: isSelected
                            ? AppPallete.accent
                            : AppPallete.extraAsh,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}