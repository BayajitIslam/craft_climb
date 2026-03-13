import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/custome_app_bar.dart';
import 'package:craft_climb/core/widgets/custome_searchbar.dart';
import 'package:craft_climb/core/widgets/state_card.dart';
import 'package:craft_climb/features/job/presentation/pages/browse_job/job_detail_page.dart';
import 'package:craft_climb/features/job/presentation/widgets/job_card.dart';
import 'package:flutter/material.dart';

class TradePersonDashboardPage extends StatefulWidget {
  const TradePersonDashboardPage({super.key});

  @override
  State<TradePersonDashboardPage> createState() =>
      _TradePersonDashboardPageState();
}

class _TradePersonDashboardPageState extends State<TradePersonDashboardPage> {
  //  Controller
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── AppBar ──
        CustomAppBar(name: 'Ovie Rahaman', role: 'Trade Person', badge: 'Wolf'),

        // ── Blue curve + Search + Banner ──
        SizedBox(
          height: context.screenHeight * 0.20,
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
                child: CustomeSearchbar(controller: _searchController),
              ),

              // Complete Profile Banner
              Positioned(
                top: 100,
                left: 24,
                right: 24,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppPallete.primary,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: AppPallete.dropShadow,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppPallete.accent10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.person_outline,
                          color: AppPallete.accent,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Complete Your Profile',
                              style: AppTextStyle.s14w4i(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Update your Resume',
                              style: AppTextStyle.s14w4i(
                                color: AppPallete.bodyText,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 6),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: 0.75,
                                backgroundColor: AppPallete.accent10,
                                color: AppPallete.accent,
                                minHeight: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '75%',
                        style: AppTextStyle.s16w4i(
                          color: AppPallete.accent,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // ── Stat Cards ──
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing24,
            vertical: context.spacing8,
          ),
          child: Row(
            children: [
              Expanded(
                child: StatCard(
                  value: '29',
                  label: 'Jobs Applied',
                  color: const Color(0xFF4C6EF5),
                  icon: Icons.work_outline,
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
                  label: 'Interviews',
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

        SizedBox(height: context.spacing12),

        // ── Featured Jobs Header ──
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spacing24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured Jobs',
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
                  const SizedBox(width: 2),
                  Icon(Icons.chevron_right, color: AppPallete.accent, size: 18),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: context.spacing8),

        // ── Jobs List ──
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: context.spacing24),
            itemCount: 3,
            itemBuilder: (context, index) => JobCard(
              title: 'Construction Visit',
              location: 'Jakarta, Indonesia',
              daysLeft: '2 Days Left',
              salary: '\$500 - \$1,000',
              onTap: () => Navigator.push(context, JobDetailPage.route()),
            ),
          ),
        ),
      ],
    );
  }
}
