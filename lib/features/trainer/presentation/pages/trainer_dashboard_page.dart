import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/custome_app_bar.dart';
import 'package:craft_climb/core/widgets/custome_searchbar.dart';
import 'package:craft_climb/core/widgets/state_card.dart';
import 'package:craft_climb/features/trainer/presentation/pages/my_course/course_detail_page.dart';
import 'package:craft_climb/features/trainer/presentation/pages/new_course/new_course_page.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/course_card.dart';
import 'package:flutter/material.dart';

class TrainerDashboardPage extends StatelessWidget {
  const TrainerDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //App Bar
        CustomAppBar(name: 'Ovie Rahman', role: 'Trainer', badge: 'Wolf'),

        //Body
        SizedBox(
          height: context.screenHeight * 0.25,
          child: Stack(
            children: [
              //Container
              Container(
                width: context.screenWidth,
                height: context.screenHeight * 0.07,
                decoration: BoxDecoration(
                  color: AppPallete.accent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(55, 33),
                    bottomRight: Radius.elliptical(55, 33),
                  ),
                ),
              ),

              Positioned(
                top: 33,
                left: 24,
                right: 24,
                child: CustomeSearchbar(),
              ),

              //Informatin
              Positioned(
                top: 100,
                left: 24,
                right: 24,
                child: Row(
                  spacing: context.spacing8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Courses card
                    Expanded(
                      child: StatCard(
                        value: '3',
                        label: 'Courses',
                        color: const Color(0xFF4C6EF5),
                        icon: Icons.check_circle_outline_rounded,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3B5BDB), Color(0xFF5C7CFA)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),

                    // Earnings card
                    Expanded(
                      child: StatCard(
                        value: '\$34',
                        label: 'Total\nEarning',
                        color: const Color(0xFFF59F00),
                        icon: Icons.monetization_on_outlined,
                        gradient: const LinearGradient(
                          colors: [Color(0xFFE67700), Color(0xFFFCC419)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),

                    // Students card
                    Expanded(
                      child: StatCard(
                        value: '114',
                        label: 'Total\nStudents',
                        color: const Color(0xFF4DABF7),
                        icon: Icons.help_outline_rounded,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1C7ED6), Color(0xFF74C0FC)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // ── My Courses header ────────────────────────────────────
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing24,
            vertical: context.spacing12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Courses',
                style: AppTextStyle.s16w4i(
                  fontWeight: FontWeight.w500,
                  color: AppPallete.bodyText,
                ),
              ),
              Row(
                children: [
                  Text(
                    'See All',
                    style: AppTextStyle.s14w4i(
                      color: AppPallete.accent,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 2),
                  Icon(Icons.chevron_right, color: AppPallete.accent, size: 18),
                ],
              ),
            ],
          ),
        ),

        // ── Course list ──────────────────────────────────────────
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spacing24),
          child: Column(
            children: [
              CourseCard(
                title: 'Construction Visit',
                lectures: 32,
                imageUrl:
                    'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=120&q=80',
                isLast: false,
                onTap: () {
                  Navigator.push(context, CourseDetailPage.route());
                },
              ),
              CourseCard(
                title: 'Construction Visit',
                lectures: 32,
                imageUrl:
                    'https://images.unsplash.com/photo-1590674899484-d5640e854abe?w=120&q=80',
                isLast: true,
                onTap: () {
                  Navigator.push(context, CourseDetailPage.route());
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // ── Create New Course button ─────────────────────────────
        Center(
          child: TextButton.icon(
            onPressed: () {
              Navigator.push(context, NewCoursePage.route());
            },
            icon: const Icon(
              Icons.add_circle_outline,
              color: AppPallete.accent,
              size: 20,
            ),
            label: Text(
              'Create New Course',
              style: AppTextStyle.s14w4i(
                color: AppPallete.accent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
