import 'package:craft_climb/core/constants/app_strings.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AuthTabSwitcher extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTap;

  const AuthTabSwitcher({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppPallete.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          _tabItem(label: AppStrings.login, index: 0),
          _tabItem(label: AppStrings.signUp, index: 1),
        ],
      ),
    );
  }

  Widget _tabItem({required String label, required int index}) {
    final bool isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: AppPallete.transparent,
            borderRadius: BorderRadius.circular(4),
            border: isSelected
                ? Border.all(color: AppPallete.secondary, width: 1)
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: AppTextStyle.s14w4i(
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
              color: isSelected ? AppPallete.accent : AppPallete.bodyText,
            ),
          ),
        ),
      ),
    );
  }
}
