import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/features/profile/presentation/pages/career_seeker/cs_profile_edit_page.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_blue_header.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_bullet_list.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_section_title.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_skill_wrap.dart';
import 'package:flutter/material.dart';

class CSProfileViewPage extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const CSProfileViewPage());
  const CSProfileViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.transparent,
      body: AppBg(
        child: Column(
          children: [
            ProfileBlueHeader(
              name: 'Rahamatullah Alam',
              roleLabel: 'UI/UX Designer',
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
                    ProfileSectionTitle(title: 'Professional Summary'),
                    Text(
                      'To obtain a challenging position in a growth-oriented organization where I can apply my skills, contribute to meaningful projects, and continue developing professionally while supporting the company\'s goals and vision.',
                      style: AppTextStyle.s16w4i(
                        color: AppPallete.subTextColor,
                      ),
                    ),
                    const SizedBox(height: 16),

                    ProfileSectionTitle(title: 'Skills:'),
                    ProfileSkillWrap(
                      skills: [
                        'UI/UX Designer',
                        'Front End Engineer',
                        'Construction Visit',
                        'Ai',
                        'Critical Thinking',
                      ],
                    ),
                    const SizedBox(height: 16),

                    ProfileSectionTitle(title: 'Educational Background'),
                    _buildEducationItem(
                      institute: 'Pirojpur Govt High School (2016)',
                      gpa: '3.44',
                      certificate: 'Higher Secondary School Certificate',
                    ),
                    const SizedBox(height: 16),

                    ProfileSectionTitle(title: 'Job Experience'),
                    _buildExperienceItem(
                      company: 'Spark Tech Agency (May 2011 - May 2012)',
                      role: 'Plumber Mechanic',
                      responsibilities: [
                        'Plumbing all the day',
                        'Watch 90 day\'s Finance',
                        'Watch Company Default deck',
                      ],
                    ),
                    const SizedBox(height: 16),

                    Text(
                      'Salary Expectations : \$120K',
                      style: AppTextStyle.s14w4i(
                        fontWeight: FontWeight.w600,
                        color: AppPallete.indigoNavy,
                      ),
                    ),
                    const SizedBox(height: 20),

                    PrimaryButton(
                      buttonName: 'Edit',
                      onPressed: () =>
                          Navigator.push(context, CSProfileEditPage.route()),
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

  Widget _buildEducationItem({
    required String institute,
    String? gpa,
    String? certificate,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontWeight: FontWeight.w700)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  institute,
                  style: AppTextStyle.s16w4i(
                    fontWeight: FontWeight.w600,
                    color: AppPallete.indigoNavy,
                  ),
                ),
                if (gpa != null)
                  Text(
                    'GPA : $gpa',
                    style: AppTextStyle.s14w4i(color: AppPallete.subTextColor),
                  ),
                if (certificate != null)
                  Text(
                    certificate,
                    style: AppTextStyle.s14w4i(color: AppPallete.subTextColor),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem({
    required String company,
    String? role,
    List<String> responsibilities = const [],
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('• ', style: TextStyle(fontWeight: FontWeight.w700)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company,
                style: AppTextStyle.s14w4i(
                  fontWeight: FontWeight.w700,
                  color: AppPallete.indigoNavy,
                ),
              ),
              if (role != null)
                Text(
                  role,
                  style: AppTextStyle.s14w4i(color: AppPallete.indigoNavy),
                ),
              const SizedBox(height: 4),
              ProfileBulletList(items: responsibilities, indent: 8),
            ],
          ),
        ),
      ],
    );
  }
}
