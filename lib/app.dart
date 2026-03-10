import 'package:craft_climb/core/constants/app_strings.dart';
import 'package:craft_climb/core/theme/app_theme.dart';
import 'package:craft_climb/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

import 'features/forum/presentation/pages/forum_page.dart';
import 'features/tools/presentation/pages/tools_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.craftClimb,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      //home: OnboardingPage(),
      home: ForumScreen(),
    );
  }
}
