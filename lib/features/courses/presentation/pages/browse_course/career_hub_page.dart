import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/custome_searchbar.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/courses/presentation/pages/browse_course/course_detail_page.dart';
import 'package:craft_climb/features/courses/presentation/widgets/browse_widgets/course_card.dart';
import 'package:flutter/material.dart';

class CareerHubPage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const CareerHubPage());
  const CareerHubPage({super.key});

  @override
  State<CareerHubPage> createState() => _CareerHubPageState();
}

class _CareerHubPageState extends State<CareerHubPage> {
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
      'badge': 'Free',
      'image':
          'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=400',
    },
    {
      'title': 'Construction Visit',
      'lectures': 32,
      'badge': 'Free',
      'image':
          'https://images.unsplash.com/photo-1590674899484-d5640e854abe?w=400',
    },
    {
      'title': 'Construction Visit',
      'lectures': 32,
      'badge': 'Free',
      'image':
          'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=400',
    },
    {
      'title': 'Construction Visit',
      'lectures': 32,
      'badge': '\$31',
      'image':
          'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=400',
    },
    {
      'title': 'Construction Visit',
      'lectures': 32,
      'badge': 'Free',
      'image':
          'https://images.unsplash.com/photo-1590674899484-d5640e854abe?w=400',
    },
    {
      'title': 'Construction Visit',
      'lectures': 32,
      'badge': '\$18',
      'image':
          'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=400',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacing16),
      child: Column(
        children: [
          const SecandAppBar(title: 'Career Hub'),
          SizedBox(height: context.spacing12),

          // ── Search ──
          CustomeSearchbar(
            controller: _searchController,
            hintText: 'Search job here...',
            onChanged: (v) => setState(() => searchQuery = v),
            onClear: () {
              _searchController.clear();
              setState(() => searchQuery = '');
            },
          ),

          SizedBox(height: context.spacing16),

          // ── Grid ──
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: courses.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 12,
                mainAxisExtent: 175,
              ),
              itemBuilder: (_, index) => CourseCard(
                title: courses[index]['title'],
                lectures: courses[index]['lectures'],
                imageUrl: courses[index]['image'],
                badge: courses[index]['badge'],
                onTap: () =>
                    Navigator.push(context, CourseDetailPageView.route()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
