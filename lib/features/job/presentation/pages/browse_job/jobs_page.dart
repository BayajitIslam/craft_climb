import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/custome_searchbar.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/job/presentation/pages/browse_job/job_detail_page.dart';
import 'package:craft_climb/features/job/presentation/widgets/job_card.dart';
import 'package:craft_climb/features/job/presentation/widgets/job_filter_chip.dart';
import 'package:flutter/material.dart';

class JobsPage extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const JobsPage());
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  final searchController = TextEditingController();
  int selectedFilter = 0;
  String searchQuery = '';

  final filters = [
    'Civil Engineering',
    'Electrical Supply',
    'Civil Engineering',
  ];

  // ── Dummy Data ──
  final List<Map<String, String>> allJobs = [
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'days': '2 Days Left',
      'salary': '\$5500',
    },
    {
      'title': 'Electrical Wiring',
      'location': 'Jakarta, Indonesia',
      'days': '3 Days Left',
      'salary': '\$4500',
    },
    {
      'title': 'Civil Engineering',
      'location': 'Jakarta, Indonesia',
      'days': '1 Days Left',
      'salary': '\$6000',
    },
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'days': '2 Days Left',
      'salary': '\$5500',
    },
    {
      'title': 'Site Supervisor',
      'location': 'Jakarta, Indonesia',
      'days': '5 Days Left',
      'salary': '\$7000',
    },
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'days': '2 Days Left',
      'salary': '\$5500',
    },
  ];

  // ── Filtered List ──
  List<Map<String, String>> get filteredJobs {
    if (searchQuery.isEmpty) return allJobs;
    return allJobs
        .where(
          (job) =>
              job['title']!.toLowerCase().contains(searchQuery.toLowerCase()) ||
              job['location']!.toLowerCase().contains(
                searchQuery.toLowerCase(),
              ),
        )
        .toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // ── AppBar ─────────────────────────────────────────────
              SecandAppBar(title: 'Jobs'),
              const SizedBox(height: 12),

              CustomeSearchbar(
                controller: searchController,
                onChanged: (value) => setState(() => searchQuery = value),
              ),

              const SizedBox(height: 12),

              // ── Filter Chips ──
              SizedBox(
                height: 34,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (_, index) => JobFilterChip(
                    label: filters[index],
                    isSelected: selectedFilter == index,
                    onTap: () => setState(() => selectedFilter = index),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ── Jobs List or Empty State ──
              Expanded(
                child: filteredJobs.isEmpty
                    ? Center(
                        child: Text(
                          'No jobs found',
                          style: AppTextStyle.s16w4i(
                            color: AppPallete.bodyText,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredJobs.length,
                        itemBuilder: (_, index) => JobCard(
                          title: filteredJobs[index]['title']!,
                          location: filteredJobs[index]['location']!,
                          daysLeft: filteredJobs[index]['days']!,
                          salary: filteredJobs[index]['salary']!,
                          onTap: () =>
                              Navigator.push(context, JobDetailPage.route()),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
