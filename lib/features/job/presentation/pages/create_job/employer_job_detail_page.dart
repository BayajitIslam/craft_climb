import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/job/presentation/pages/create_job/applicants_page.dart';
import 'package:craft_climb/features/job/presentation/pages/create_job/create_job_page.dart';
import 'package:flutter/material.dart';

class EmployerJobDetailPage extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const EmployerJobDetailPage());
  const EmployerJobDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ── Hero Image + AppBar ──
          Stack(
            children: [
              Container(
                height: 276,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                width: double.infinity,
                child: Image.network(
                  'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=800',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SecandAppBar(
                  title: 'Construction Visit',
                  color: Colors.white,
                ),
              ),
            ],
          ),

          // ── Scrollable Content ──
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _JobSection(
                    title: 'Job Summary',
                    content:
                        'To obtain a challenging position in a growth-oriented organization where I can apply my skills...',
                  ),
                  _JobSection(
                    title: 'Job Responsibility',
                    content:
                        'To obtain a challenging position in a growth-oriented organization...',
                  ),
                  _JobSection(
                    title: 'Job Requirements',
                    isBullet: true,
                    bullets: [
                      'To obtain a challenging position in a growth-oriented',
                      'To obtain a challenging position in a growth-oriented',
                    ],
                  ),
                  _JobSection(
                    title: 'Job Location',
                    content: 'Dhaka, Bangladesh',
                  ),
                  _JobSection(
                    title: 'Salary Range',
                    content: '\$120k - \$140k',
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          // ── Bottom Buttons ──
          Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              8,
              16,
              16 + MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              children: [
                // See Applicants
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      side: WidgetStateProperty.all(
                        const BorderSide(color: AppPallete.accent),
                      ),
                    ),
                    onPressed: () =>
                        Navigator.push(context, ApplicantsPage.route()),
                    child: Text(
                      'See All 379 Applicants',
                      style: AppTextStyle.s14w4i(
                        fontWeight: FontWeight.w700,
                        color: AppPallete.accent,
                      ),
                    ),
                  ),
                ),
                PrimaryButton(
                  buttonName: 'Edit',
                  onPressed: () {
                    Navigator.push(context, CreateJobPage.route(isEdit: true));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// core/widgets/job_section.dart
class _JobSection extends StatelessWidget {
  final String title;
  final String? content;
  final bool isBullet;
  final List<String>? bullets;

  const _JobSection({
    required this.title,
    this.content,
    this.isBullet = false,
    this.bullets,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.s16w4i(
              fontWeight: FontWeight.w700,
              color: AppPallete.accent,
            ),
          ),
          const SizedBox(height: 6),
          if (!isBullet && content != null)
            Text(
              content!,
              style: AppTextStyle.s14w4i(
                color: AppPallete.extraAsh,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (isBullet && bullets != null)
            ...bullets!.map(
              (b) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• ',
                      style: AppTextStyle.s14w4i(color: AppPallete.bodyText),
                    ),
                    Expanded(
                      child: Text(
                        b,
                        style: AppTextStyle.s14w4i(color: AppPallete.bodyText),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
