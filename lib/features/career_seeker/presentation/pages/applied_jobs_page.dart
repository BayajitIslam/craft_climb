import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/custome_searchbar.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:flutter/material.dart';

class AppliedJobsPage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const AppliedJobsPage());
  const AppliedJobsPage({super.key});

  @override
  State<AppliedJobsPage> createState() => _AppliedJobsPageState();
}

class _AppliedJobsPageState extends State<AppliedJobsPage> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';
  int selectedFilter = 0;

  final filters = [
    'Civil Engineering',
    'Electrical Supply',
    'Civil Engineering',
    'Mechanical',
  ];

  final List<Map<String, String>> appliedJobs = [
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'salary': '\$5500',
      'status': 'Shortlisted',
      'image':
          'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=200',
    },
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'salary': '\$5500',
      'status': 'Shortlisted',
      'image':
          'https://images.unsplash.com/photo-1590674899484-d5640e854abe?w=200',
    },
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'salary': '\$5500',
      'status': 'Rejected',
      'image':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
    },
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'salary': '\$5500',
      'status': 'Interview',
      'image':
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
    },
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'salary': '\$5500',
      'status': 'Shortlisted',
      'image':
          'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=200',
    },
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'salary': '\$5500',
      'status': 'Rejected',
      'image':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
    },
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'salary': '\$5500',
      'status': 'Shortlisted',
      'image':
          'https://images.unsplash.com/photo-1590674899484-d5640e854abe?w=200',
    },
  ];

  List<Map<String, String>> get filtered => searchQuery.isEmpty
      ? appliedJobs
      : appliedJobs
            .where(
              (j) =>
                  j['title']!.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList();

  // ✅ Status style — color + label
  Map<String, dynamic> _statusStyle(String status) {
    switch (status) {
      case 'Shortlisted':
        return {
          'color': const Color(0xFF3B5BDB),
          'bg': const Color(0xFFE8EDFF),
        };
      case 'Rejected':
        return {
          'color': const Color(0xFFE03131),
          'bg': const Color(0xFFFFEBEB),
        };
      case 'Interview':
        return {
          'color': const Color(0xFFE67700),
          'bg': const Color(0xFFFFF3E0),
        };
      default:
        return {'color': AppPallete.accent, 'bg': AppPallete.accent10};
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Column(
                children: [
                  SecandAppBar(title: 'Applied Jobs'),
                  // ── Search + Filter Icon ──
                  SizedBox(height: context.spacing8),
                  Row(
                    children: [
                      Expanded(
                        child: CustomeSearchbar(
                          controller: _searchController,
                          hintText: 'Construction',
                          onChanged: (v) => setState(() => searchQuery = v),
                          onClear: () {
                            _searchController.clear();
                            setState(() => searchQuery = '');
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.tune_rounded,
                          color: AppPallete.accent,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // ── Filter Chips ──
                  SizedBox(
                    height: 36,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filters.length,
                      itemBuilder: (_, index) {
                        final isSelected = selectedFilter == index;
                        return GestureDetector(
                          onTap: () => setState(() => selectedFilter = index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppPallete.accent
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? AppPallete.accent
                                    : Colors.grey.shade300,
                              ),
                            ),
                            child: Text(
                              filters[index],
                              style: AppTextStyle.s16w4i(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey.shade600,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),

            // ── Jobs List ──
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filtered.length,
                itemBuilder: (_, index) {
                  final job = filtered[index];
                  final style = _statusStyle(job['status']!);

                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // ── Image ──
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            job['image']!,
                            height: 60,
                            width: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => Container(
                              height: 60,
                              width: 80,
                              color: AppPallete.accent10,
                              child: Icon(
                                Icons.image_outlined,
                                color: AppPallete.accent,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),

                        // ── Info ──
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title + Badge
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      job['title']!,
                                      style: AppTextStyle.s14w4i(
                                        fontWeight: FontWeight.w700,
                                        color: AppPallete.bodyText,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 6),

                                  // Status Badge
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: style['bg'],
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: style['color']),
                                    ),
                                    child: Text(
                                      job['status']!,
                                      style: AppTextStyle.s14w4i(
                                        color: style['color'],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),

                              // Location
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 13,
                                    color: Colors.grey.shade500,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    job['location']!,
                                    style: AppTextStyle.s14w4i(
                                      color: AppPallete.extraAsh,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),

                              // Salary
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    size: 13,
                                    color: AppPallete.black75,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    job['salary']!,
                                    style: AppTextStyle.s16w4i(
                                      color: AppPallete.black75,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),

                        // ── Arrow Button ──
                        Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            color: AppPallete.accent10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: AppPallete.accent,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
