import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/custome_app_bar.dart';
import 'package:craft_climb/core/widgets/custome_searchbar.dart';
import 'package:craft_climb/core/widgets/state_card.dart';
import 'package:craft_climb/features/career_seeker/presentation/pages/applied_jobs_page.dart';
import 'package:craft_climb/features/career_seeker/presentation/widgets/career_roadmap_banner.dart';
import 'package:craft_climb/features/career_seeker/presentation/widgets/complete_profile_banner.dart';
import 'package:craft_climb/features/career_seeker/presentation/widgets/cs_course_card.dart';
import 'package:craft_climb/features/career_seeker/presentation/widgets/cs_featured_job_card.dart';
import 'package:craft_climb/features/career_seeker/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';

class CareerSeekerDashboardPage extends StatefulWidget {
  const CareerSeekerDashboardPage({super.key});

  @override
  State<CareerSeekerDashboardPage> createState() =>
      _CareerSeekerDashboardPageState();
}

class _CareerSeekerDashboardPageState extends State<CareerSeekerDashboardPage> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> courses = [
    {
      'title': 'Construction Visit',
      'lectures': 32,
      'progress': 0.65,
      'image':
          'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=400',
    },
    {
      'title': 'Construction Visit',
      'lectures': 32,
      'progress': 0.65,
      'image':
          'https://images.unsplash.com/photo-1590674899484-d5640e854abe?w=400',
    },
    {
      'title': 'Construction Visit',
      'lectures': 32,
      'progress': 0.65,
      'image':
          'https://images.unsplash.com/photo-1590674899484-d5640e854abe?w=400',
    },
  ];

  final List<Map<String, String>> featuredJobs = [
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'salary': '\$5500',
      'type': 'Full Time',
      'image':
          'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=200',
    },
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'salary': '\$5500',
      'type': 'Full Time',
      'image':
          'https://images.unsplash.com/photo-1590674899484-d5640e854abe?w=200',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // ── AppBar ──────────────────────────────
        SliverToBoxAdapter(
          child: CustomAppBar(
            name: 'Ovie Rahaman',
            role: 'Career Seeker',
            badge: 'Wolf',
          ),
        ),

        // ── Blue hero: search + banner + stat cards ──
        SliverToBoxAdapter(
          child: SizedBox(
            height: 330,
            child: Stack(
              children: [
                // Blue curved background
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

                // Search bar
                Positioned(
                  top: context.spacing32,
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

                // Complete Profile Banner
                Positioned(
                  top: context.spacing32 * 3,
                  left: 24,
                  right: 24,
                  child: CompleteProfileBanner(progress: 0.75, onTap: () {}),
                ),

                // Stat cards
                Positioned(
                  top: context.spacing32 * 6 - context.spacing8,
                  left: 24,
                  right: 24,
                  child: Row(
                    children: [
                      Expanded(
                        child: StatCard(
                          value: '29',
                          label: 'Jobs Applied',
                          color: const Color(0xFF4C6EF5),
                          icon: Icons.check_circle_outline_rounded,
                          gradient: const LinearGradient(
                            colors: [Color(0xFF3B5BDB), Color(0xFF5C7CFA)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          onTap: () =>
                              Navigator.push(context, AppliedJobsPage.route()),
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
                            colors: [Color(0xFF0f1729), Color(0xFF1e3b8a)],
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
        ),

        SliverToBoxAdapter(child: SizedBox(height: context.spacing16)),

        // ── My Courses — 2-column responsive grid ──
        if (courses.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.spacing24),
              child: SectionHeader(title: 'My Courses', onSeeAll: () {}),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: context.spacing12)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: context.spacing24),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // always 2 columns
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85, // adjust to match CSCourseCard height
              ),
              delegate: SliverChildBuilderDelegate(
                (_, index) => CSCourseCard(
                  title: courses[index]['title'],
                  lectures: courses[index]['lectures'],
                  progress: courses[index]['progress'],
                  imageUrl: courses[index]['image'],
                  onTap: () {},
                ),
                childCount: courses.length,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: context.spacing16)),
        ],

        // ── Featured Jobs — horizontal scroll ──
        if (featuredJobs.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.spacing24),
              child: SectionHeader(title: 'Featured Jobs', onSeeAll: () {}),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: context.spacing8)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: context.spacing24),
                itemCount: featuredJobs.length,
                itemBuilder: (_, index) => SizedBox(
                  width: 270,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index == featuredJobs.length - 1 ? 0 : 10,
                    ),
                    child: CSFeaturedJobCard(
                      title: featuredJobs[index]['title']!,
                      location: featuredJobs[index]['location']!,
                      salary: featuredJobs[index]['salary']!,
                      type: featuredJobs[index]['type']!,
                      imageUrl: featuredJobs[index]['image']!,
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: context.spacing16)),
        ],

        // ── Career Roadmap ──
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spacing24),
            child: CareerRoadmapBanner(progress: 65, onViewDetails: () {}),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: context.spacing24)),
      ],
    );
  }
}
