import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart' show SecandAppBar;
import 'package:craft_climb/features/courses/presentation/widgets/browse_widgets/course_lecture_tile.dart';
import 'package:craft_climb/features/courses/presentation/widgets/browse_widgets/teacher_card.dart';
import 'package:flutter/material.dart';

class CourseDetailPageView extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const CourseDetailPageView());
  const CourseDetailPageView({super.key});

  static const List<String> lectures = [
    'Demo Class',
    'Lecture 1',
    'Lecture 1',
    'Lecture 1',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
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
                    // ── Summary + Price ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Course Summary',
                          style: AppTextStyle.s16w4i(
                            fontWeight: FontWeight.w700,
                            color: AppPallete.bodyText,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: AppPallete.primary),
                          child: Text(
                            '\$20',
                            style: AppTextStyle.s16w4i(
                              color: AppPallete.accent,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                    Text(
                      'To obtain a challenging position in a growth-oriented organization where I can apply my skills, contribute to meaningful projects, and continue developing professionally while supporting the company\'s goals and vision.',
                      style: AppTextStyle.s14w4i(
                        color: AppPallete.extraAsh,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── Course Teachers ──
                    Text(
                      'Course Teachers',
                      style: AppTextStyle.s16w4i(
                        fontWeight: FontWeight.w700,
                        color: AppPallete.bodyText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        TeacherCard(
                          name: 'Dr. Tasnim Zara',
                          role: 'Sr. Al Developer',
                          imageUrl:
                              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
                        ),
                        const SizedBox(width: 10),
                        TeacherCard(
                          name: 'Dr. Tasnim Zara',
                          role: 'Sr. Al Developer',
                          imageUrl:
                              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // ── Modules ──
                    Text(
                      'Modules',
                      style: AppTextStyle.s16w4i(
                        fontWeight: FontWeight.w700,
                        color: AppPallete.bodyText,
                      ),
                    ),
                    const SizedBox(height: 10),

                    ...List.generate(
                      lectures.length,
                      (index) => CourseLectureTileView(
                        title: lectures[index],
                        isLocked: index != 0,
                        onTap: () {},
                      ),
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),

            // ── Purchase Button pinned ──
            Padding(
              padding: EdgeInsets.fromLTRB(
                16,
                8,
                16,
                16 + MediaQuery.of(context).padding.bottom,
              ),
              child: PrimaryButton(
                buttonName: 'Purchase Course with \$20',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
