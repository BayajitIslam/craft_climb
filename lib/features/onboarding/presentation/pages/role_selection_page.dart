import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/constants/app_strings.dart';
import 'package:craft_climb/core/local_storage/local_storage.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/debug_console.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/features/auth/presentation/pages/sign_in_page.dart';
import 'package:craft_climb/features/onboarding/presentation/widgets/role_option_card.dart';
import 'package:flutter/material.dart';

class RoleSelectionPage extends StatefulWidget {
  static final MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => const RoleSelectionPage(),
  );
  const RoleSelectionPage({super.key});

  @override
  State<RoleSelectionPage> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  //  selected index
  int? selectedIndex;

  static const List<Map<String, String>> roles = [
    {
      'role': 'career_seeker',
      'title': 'Career Seeker',
      'description': AppStrings.findingJob,
      'image': AppImages.onboardingCarrerSeeker,
    },
    {
      'role': 'trade_person',
      'title': 'Trade Person',
      'description': AppStrings.letsRecruit,
      'image': AppImages.onboardingTradePerson,
    },
    {
      'role': 'employer',
      'title': 'Employer',
      'description': AppStrings.letsRecruit,
      'image': AppImages.onboardingEmployer,
    },
    {
      'role': 'trainer',
      'title': 'Trainer',
      'description': AppStrings.letsRecruit,
      'image': AppImages.onboardingTrainer,
    },
  ];

  void onRoleSelected(BuildContext context, int index) {
    setState(() => selectedIndex = index);
    DebugConsole.ui('Selected Role: ${roles[index]['role']}');

    //Navigate to home
    Future.delayed(const Duration(microseconds: 200), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, SignInPage.route);
    });

    //Save role
    LocalStorage.setRole(roles[index]['role']!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              //Image
              SizedBox(height: context.spacing32),
              Image.asset(AppImages.appLogo, width: 200),
              const Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.continueAs, style: AppTextStyle.s24w7i()),
                    Text(
                      AppStrings.tellUsWhoYouAre,
                      style: AppTextStyle.s14w4i(),
                    ),
                  ],
                ),
              ),

              //Roles
              ListView.builder(
                shrinkWrap: true,
                itemCount: roles.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => RoleOptionCard(
                  role: roles[index]['role']!,
                  title: roles[index]['title']!,
                  description: roles[index]['description']!,
                  image: roles[index]['image']!,
                  isRoleSelected: selectedIndex == index,
                  onTap: () => onRoleSelected(context, index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
