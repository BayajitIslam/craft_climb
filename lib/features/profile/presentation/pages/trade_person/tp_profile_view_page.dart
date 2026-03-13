import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/features/profile/presentation/pages/trade_person/tp_profile_edit_page.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_blue_header.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_section_title.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_skill_wrap.dart';
import 'package:flutter/material.dart';

class TPProfileViewPage extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const TPProfileViewPage());
  const TPProfileViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            ProfileBlueHeader(
              name: 'Rahamatullah Alam',
              roleLabel: 'UI/UX Designer ',
              location: 'Dhaka, Bangladesh',
              linkedin: 'ovierahaman',
              imageUrl: null,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Summary ──
                    ProfileSectionTitle(title: 'Professional Summary'),
                    Text(
                      'To obtain a challenging position in a growth-oriented organization where I can apply my skills, contribute to meaningful projects, and continue developing professionally while supporting the company\'s goals and vision.',
                      style: AppTextStyle.s16w4i(
                        color: AppPallete.subTextColor,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ── Skills ──
                    ProfileSectionTitle(title: 'Skills:'),
                    ProfileSkillWrap(
                      skills: [
                        'UI/UX Designer',
                        'Front End Engineer',
                        'Construction Visit',
                        'Ai',
                      ],
                    ),
                    const SizedBox(height: 16),

                    // ── Salary ──
                    Text(
                      'Salary Expectations : \$120K',
                      style: AppTextStyle.s16w4i(color: AppPallete.indigoNavy),
                    ),
                    const SizedBox(height: 20),

                    // ── Edit Button ──
                    PrimaryButton(
                      buttonName: 'Edit',
                      onPressed: () =>
                          Navigator.push(context, TPProfileEditPage.route()),
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
