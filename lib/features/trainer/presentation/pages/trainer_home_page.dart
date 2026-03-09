import 'package:craft_climb/core/local_storage/local_storage.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/app_navbar.dart';
import 'package:craft_climb/features/forum/presentation/pages/forum_page.dart';
import 'package:craft_climb/features/tools/presentation/pages/tools_page.dart';
import 'package:craft_climb/features/trainer/presentation/pages/trainer_dashboard_page.dart';
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
  final List<Widget> pages = [TrainerDashboardPage(), ForumPage(), ToolsPage()];

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
