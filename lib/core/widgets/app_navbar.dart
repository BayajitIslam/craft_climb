import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppNavbar extends StatelessWidget {
  final String role;
  final int selectedIndex;
  final void Function(int) onTap;

  const AppNavbar({
    super.key,
    required this.role,
    required this.selectedIndex,
    required this.onTap,
  });

  List<BottomNavigationBarItem> get _items {
    switch (role) {
      case 'career_seeker':
        return [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Jobs'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tools'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Forum'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Career Hub',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ];
      case 'employer':
        return [
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.home, width: 20),
            activeIcon: Image.asset(
              AppImages.home,
              width: 22,
              color: AppPallete.accent,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.jobs, width: 20),
            activeIcon: Image.asset(
              AppImages.jobs,
              width: 22,
              color: AppPallete.accent,
            ),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.tools, width: 20),

            activeIcon: Image.asset(
              AppImages.tools,
              width: 22,
              color: AppPallete.accent,
            ),
            label: 'Tools',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.forum, width: 20),
            activeIcon: Image.asset(
              AppImages.forum,
              width: 22,
              color: AppPallete.accent,
            ),
            label: 'Forum',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(AppImages.profile, width: 20),
            activeIcon: Image.asset(
              AppImages.profile,
              width: 22,
              color: AppPallete.accent,
            ),
            label: 'Profile',
          ),
        ];
      case 'trainer':
        return [
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.home, width: 20),
            activeIcon: Image.asset(
              AppImages.home,
              width: 22,
              color: AppPallete.accent,
            ),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(AppImages.jobs, width: 20),
            activeIcon: Image.asset(
              AppImages.jobs,
              width: 22,
              color: AppPallete.accent,
            ),
            label: 'Jobs',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(AppImages.tools, width: 20),

            activeIcon: Image.asset(
              AppImages.tools,
              width: 22,
              color: AppPallete.accent,
            ),
            label: 'Tools',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.forum, width: 20),
            activeIcon: Image.asset(
              AppImages.forum,
              width: 22,
              color: AppPallete.accent,
            ),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.carrerHub, width: 20),
            activeIcon: Image.asset(
              AppImages.carrerHub,
              width: 22,
              color: AppPallete.accent,
            ),
            label: 'Career Hub',
          ),
        ];
      case 'trade_person':
        return [
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.home, width: 20),
            activeIcon: Image.asset(
              AppImages.home,
              width: 22,
              color: AppPallete.accent,
            ),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(AppImages.jobs, width: 20),
            activeIcon: Image.asset(
              AppImages.jobs,
              width: 22,
              color: AppPallete.accent,
            ),
            label: 'Jobs',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(AppImages.tools, width: 20),

            activeIcon: Image.asset(
              AppImages.tools,
              width: 22,
              color: AppPallete.accent,
            ),
            label: 'Tools',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.forum, width: 20),
            activeIcon: Image.asset(
              AppImages.forum,
              width: 22,
              color: AppPallete.accent,
            ),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.myCourse, width: 20),
            activeIcon: Image.asset(
              AppImages.carrerHub,
              width: 22,
              color: AppPallete.accent,
            ),
            label: 'My Course',
          ),
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 2,
      enableFeedback: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppPallete.primary,
      selectedItemColor: AppPallete.accent,
      unselectedItemColor: AppPallete.extraAsh,
      currentIndex: selectedIndex,
      onTap: onTap,
      items: _items,
    );
  }
}
