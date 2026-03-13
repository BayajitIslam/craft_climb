import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/features/profile/presentation/pages/employer/employer_profile_edit_page.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_blue_header.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_section_title.dart';
import 'package:flutter/material.dart';

class EmployerProfileViewPage extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const EmployerProfileViewPage());
  const EmployerProfileViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AppBg(
        child: Column(
          children: [
            ProfileBlueHeader(
              name: 'Well Dev',
              roleLabel: 'Well Dev',
              location: 'Dhaka, Bangladesh',
              isCompany: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileSectionTitle(title: 'Company Description'),
                    Text(
                      'To obtain a challenging position in a growth-oriented organization where I can apply my skills, contribute to meaningful projects, and continue developing professionally while supporting the company’s goals and vision.',
                      style: AppTextStyle.s16w4i(color: AppPallete.subTextColor),
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      buttonName: 'Edit',
                      onPressed: () => Navigator.push(
                        context,
                        EmployerProfileEditPage.route(),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
