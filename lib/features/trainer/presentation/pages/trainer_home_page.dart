import 'package:craft_climb/core/local_storage/local_storage.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/app_navbar.dart';
import 'package:craft_climb/features/account/presentation/pages/trainer/trainer_account_page.dart';
import 'package:craft_climb/features/forum/presentation/pages/forum_page.dart';
import 'package:craft_climb/features/job/presentation/pages/browse_job/jobs_page.dart';
import 'package:craft_climb/features/tools/presentation/pages/tools_page.dart';
import 'package:craft_climb/features/courses/presentation/pages/my_course/my_course_page.dart';
import 'package:flutter/material.dart';

class TrainerHomePage extends StatefulWidget {
  //route
  static Route route() {
    return MaterialPageRoute(builder: (context) => TrainerHomePage());
  }

  const TrainerHomePage({super.key});

  @override
  State<TrainerHomePage> createState() => _TrainerHomePageState();
}

class _TrainerHomePageState extends State<TrainerHomePage> {
  //SELECTED INDEX
  int selectedIndex = 0;
  //PAGES LIST
  List<Widget> get pages => [
    ForumPage(),
    JobsPage(),
    ToolsPage(),
    MyCoursePage(),
    TrainerAccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(child: pages[selectedIndex]),
      bottomNavigationBar: AppNavbar(
        role: LocalStorage.userRole,
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() => selectedIndex = index);
        },
      ),
    );
  }
}
