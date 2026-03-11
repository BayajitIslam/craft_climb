import 'package:craft_climb/core/local_storage/local_storage.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/app_navbar.dart';
import 'package:craft_climb/features/courses/presentation/pages/browse_course/career_hub_page.dart';
import 'package:craft_climb/features/employer/presentation/pages/employer_dashboard_page.dart';
import 'package:craft_climb/features/forum/presentation/pages/forum_page.dart';
import 'package:craft_climb/features/job/presentation/pages/create_job/my_job_page.dart';
import 'package:craft_climb/features/tools/presentation/pages/tools_page.dart';
import 'package:flutter/material.dart';

class EmployerHomePage extends StatefulWidget {
  //route
  static Route route() {
    return MaterialPageRoute(builder: (context) => EmployerHomePage());
  }

  const EmployerHomePage({super.key});

  @override
  State<EmployerHomePage> createState() => _EmployerHomePageState();
}

class _EmployerHomePageState extends State<EmployerHomePage> {
  //STATE
  int selectedIndex = 0;

  //PAGES
  final List<Widget> pages = [
    EmployerDashboardPage(),
    MyJobPage(),
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
