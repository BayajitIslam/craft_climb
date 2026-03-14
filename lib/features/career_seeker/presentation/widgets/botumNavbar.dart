import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/app_text_style.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    this.selectedIndex = 0,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const items = [
      {'icon': Icons.home_outlined, 'activeIcon': Icons.home, 'label': 'Home'},
      {'icon': Icons.work_outline, 'activeIcon': Icons.work, 'label': 'Jobs'},
      {
        'icon': Icons.track_changes_outlined,
        'activeIcon': Icons.track_changes,
        'label': 'Career Hub',
      },
      {
        'icon': Icons.person_outline,
        'activeIcon': Icons.person,
        'label': 'Account',
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
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (i) {
              final isSelected = i == selectedIndex;
              return GestureDetector(
                onTap: () => onTap(i),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isSelected
                          ? items[i]['activeIcon'] as IconData
                          : items[i]['icon'] as IconData,
                      color:
                      isSelected ? AppPallete.accent : AppPallete.extraAsh,
                      size: 22,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      items[i]['label'] as String,
                      style: AppTextStyle.s14w4i(
                        color: isSelected
                            ? AppPallete.accent
                            : AppPallete.extraAsh,
                        fontSize: 11,
                        fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.w400,
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