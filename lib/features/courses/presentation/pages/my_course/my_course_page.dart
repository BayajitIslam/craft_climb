import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/courses/presentation/pages/my_course/course_detail_page.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/course_card.dart';
import 'package:flutter/material.dart';

class MyCoursePage extends StatelessWidget {
  //route
  static Route route() {
    return MaterialPageRoute(builder: (context) => const MyCoursePage());
  }

  const MyCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //App Bar
        SecandAppBar(title: 'My Courses'),

        //Course List
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => TrainerCourseCard(
              title: 'Construction Visit',
              lectures: 2,
              imageUrl:
                  'https://images.unsplash.com/photo-1590674899484-d5640e854abe?w=120&q=80',
              isLast: true,
              onTap: () {
                Navigator.push(context, CourseDetailPage.route());
              },
            ),
          ),
        ),
      ],
    );
  }
}
