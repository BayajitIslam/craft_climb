import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/custome_app_bar.dart';
import 'package:craft_climb/core/widgets/custome_searchbar.dart';
import 'package:craft_climb/core/widgets/state_card.dart';
import 'package:craft_climb/features/job/presentation/pages/create_job/create_job_page.dart';
import 'package:craft_climb/features/job/presentation/pages/create_job/employer_job_detail_page.dart';
import 'package:craft_climb/features/job/presentation/widgets/job_card.dart';
import 'package:flutter/material.dart';

class EmployerDashboardPage extends StatefulWidget {
  const EmployerDashboardPage({super.key});

  @override
  State<EmployerDashboardPage> createState() => _EmployerDashboardPageState();
}

class _EmployerDashboardPageState extends State<EmployerDashboardPage> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> jobs = [
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'days': '2 Days Left',
      'salary': '\$500 - \$1,000',
    },
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'days': '2 Days Left',
      'salary': '\$500 - \$1,000',
    },
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'days': '2 Days Left',
      'salary': '\$500 - \$1,000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── AppBar ──
        CustomAppBar(name: 'Ovie Rahaman', role: 'Employer', badge: 'Wolf'),

        // ── Blue curve + Search + Stats ──
        SizedBox(
          height: context.screenHeight * 0.26,
          child: Stack(
            children: [
              // Blue background
              Container(
                width: context.screenWidth,
                height: context.screenHeight * 0.07,
                decoration: BoxDecoration(
                  color: AppPallete.accent,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.elliptical(55, 33),
                    bottomRight: Radius.elliptical(55, 33),
                  ),
                ),
              ),

              // Search
              Positioned(
                top: 33,
                left: 24,
                right: 24,
                child: CustomeSearchbar(
                  controller: _searchController,
                  hintText: 'Search ....',
                  onChanged: (v) => setState(() => searchQuery = v),
                  onClear: () {
                    _searchController.clear();
                    setState(() => searchQuery = '');
                  },
                ),
              ),

              // Stat Cards
              Positioned(
                top: 100,
                left: 24,
                right: 24,
                child: Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        value: '29',
                        label: 'Live Jobs',
                        color: const Color(0xFF4C6EF5),
                        icon: Icons.check_circle_outline_rounded,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3B5BDB), Color(0xFF5C7CFA)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    SizedBox(width: context.spacing8),
                    Expanded(
                      child: StatCard(
                        value: '3',
                        label: 'Interview',
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

        // ── My Jobs Header ──
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing24,
            vertical: context.spacing12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Jobs',
                style: AppTextStyle.s16w4i(fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, CreateJobPage.route());
                },
                child: Text(
                  'Create New',
                  style: AppTextStyle.s14w4i(
                    color: AppPallete.accent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        // ── Jobs List ──
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: context.spacing24),
            itemCount: jobs.length,
            itemBuilder: (_, index) => JobCard(
              title: jobs[index]['title']!,
              location: jobs[index]['location']!,
              daysLeft: jobs[index]['days']!,
              salary: jobs[index]['salary']!,
              onTap: () =>
                  Navigator.push(context, EmployerJobDetailPage.route()),
            ),
          ),
        ),
      ],
    );
  }
}
