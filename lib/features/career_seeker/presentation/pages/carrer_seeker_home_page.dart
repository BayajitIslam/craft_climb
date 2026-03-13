import 'package:craft_climb/core/local_storage/local_storage.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/app_navbar.dart';
import 'package:craft_climb/features/career_seeker/presentation/pages/carrer_seeker_dashboard_page.dart';
import 'package:craft_climb/features/courses/presentation/pages/browse_course/career_hub_page.dart';
import 'package:craft_climb/features/forum/presentation/pages/forum_page.dart';
import 'package:craft_climb/features/job/presentation/pages/browse_job/jobs_page.dart';
import 'package:craft_climb/features/tools/presentation/pages/tools_page.dart';
import 'package:flutter/material.dart';

class CarrerSeekerHomePage extends StatefulWidget {
  //route
  static Route route() {
    return MaterialPageRoute(builder: (context) => CarrerSeekerHomePage());
  }

  const CarrerSeekerHomePage({super.key});

  @override
  State<CarrerSeekerHomePage> createState() => _CarrerSeekerHomePageState();
}

class _CarrerSeekerHomePageState extends State<CarrerSeekerHomePage> {
  //SELECTED INDEX
  int selectedIndex = 0;
  //PAGES LIST
  final List<Widget> pages = [
    CareerSeekerDashboardPage(),
    JobsPage(),
    ToolsPage(),
    ForumPage(),
    CareerHubPage(),
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
