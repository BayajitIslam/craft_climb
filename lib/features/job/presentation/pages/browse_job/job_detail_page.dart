import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/job/presentation/widgets/apply_bottom_sheet.dart';
import 'package:flutter/material.dart';

class JobDetailPage extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const JobDetailPage());
  const JobDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ── Hero Image + AppBar ──
          Stack(
            children: [
              Container(
                height: 256,
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
                  Text(
                    'Construction Visit & Guidance',
                    style: AppTextStyle.s24w7i(fontSize: 18),
                  ),
                  const SizedBox(height: 16),

                  _JobSection(
                    title: 'Job Summary',
                    content:
                        'To obtain a challenging position in a growth-oriented organization where I can apply my skills, contribute to meaningful projects, and continue developing professionally while supporting the company’s goals and vision.',
                  ),
                  _JobSection(
                    title: 'Job Responsibility',
                    content:
                        'To obtain a challenging position in a growth-oriented organization where I can apply my skills, contribute to meaningful projects, and continue developing professionally while supporting the company’s goals and vision.',
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

          // ── Apply Button pinned ──
          Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              8,
              16,
              16 + MediaQuery.of(context).padding.bottom,
            ),
            child: Row(
              children: [
                //Chat
                Container(
                  height: 45,
                  width: 52,
                  decoration: BoxDecoration(
                    color: AppPallete.accent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.chat, color: AppPallete.primary),
                ),

                //Apply
                SizedBox(width: context.spacing12),
                Expanded(
                  child: PrimaryButton(
                    buttonName: 'Apply Now',
                    onPressed: () => ApplyBottomSheet.show(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Section Widget ──
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
              color: AppPallete.indigoNavy,
            ),
          ),
          const SizedBox(height: 6),
          if (!isBullet && content != null)
            Text(
              content!,
              style: AppTextStyle.s14w4i(
                color: AppPallete.extraAsh,
                fontSize: 16,
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
