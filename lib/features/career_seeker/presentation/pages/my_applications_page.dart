import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:flutter/material.dart';

class MyApplicationsPage extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const MyApplicationsPage());
  const MyApplicationsPage({super.key});

  final List<Map<String, String>> _applications = const [
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'salary': '\$500 - \$1,000',
      'status': 'In Progress',
      'image':
          'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=200',
    },
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'salary': '\$500 - \$1,000',
      'status': 'Short Listed',
      'image':
          'https://images.unsplash.com/photo-1590674899484-d5640e854abe?w=200',
    },
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'salary': '\$500 - \$1,000',
      'status': 'Short Listed',
      'image':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
    },
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'salary': '\$500 - \$1,000',
      'status': 'Interview Selected',
      'image':
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
    },
    {
      'title': 'Construction Visit',
      'location': 'Jakarta, Indonesia',
      'salary': '\$500 - \$1,000',
      'status': 'Interview Selected',
      'image':
          'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=200',
    },
  ];

  // Status style
  Map<String, dynamic> _statusStyle(String status) {
    switch (status) {
      case 'In Progress':
        return {'color': AppPallete.primary, 'bg': AppPallete.extraAsh};
      case 'Short Listed':
        return {'color': AppPallete.primary, 'bg': const Color(0xFFAE8355)};
      case 'Interview Selected':
        return {'color': Colors.white, 'bg': AppPallete.accent};
      default:
        return {'color': AppPallete.accent, 'bg': AppPallete.accent10};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            SecandAppBar(title: 'My Applications'),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                itemCount: _applications.length,
                itemBuilder: (_, index) {
                  final app = _applications[index];
                  final style = _statusStyle(app['status']!);
                  return _ApplicationCard(
                    title: app['title']!,
                    location: app['location']!,
                    salary: app['salary']!,
                    status: app['status']!,
                    imageUrl: app['image']!,
                    statusColor: style['color'],
                    statusBg: style['bg'],
                    onTap: () {},
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

// ── Application Card ──
class _ApplicationCard extends StatelessWidget {
  final String title;
  final String location;
  final String salary;
  final String status;
  final String imageUrl;
  final Color statusColor;
  final Color statusBg;
  final VoidCallback onTap;

  const _ApplicationCard({
    required this.title,
    required this.location,
    required this.salary,
    required this.status,
    required this.imageUrl,
    required this.statusColor,
    required this.statusBg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppPallete.border),
        boxShadow: [
          BoxShadow(
            color: const Color(0x142E048E),
            blurRadius: 21,
            offset: const Offset(0, 11),
          ),
        ],
      ),
      child: Row(
        children: [
          // ── Image ──
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                height: 80,
                width: 80,
                color: AppPallete.accent10,
                child: Icon(Icons.image_outlined, color: AppPallete.accent),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // ── Info ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: AppTextStyle.s14w4i(
                    fontWeight: FontWeight.w700,
                    color: AppPallete.black,
                  ),
                ),
                const SizedBox(height: 2),

                // Location
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 13,
                      color: AppPallete.black,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      location,
                      style: AppTextStyle.s12w4i(color: AppPallete.black),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                //  Status Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: AppTextStyle.s12w4i(
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                ),
                const SizedBox(height: 6),

                // Salary
                Row(
                  children: [
                    Icon(
                      Icons.handyman_outlined,
                      size: 13,
                      color: AppPallete.black,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      salary,
                      style: AppTextStyle.s12w4i(
                        color: AppPallete.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // ── Arrow ──
          GestureDetector(
            onTap: onTap,
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
