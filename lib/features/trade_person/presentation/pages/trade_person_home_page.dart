import 'package:craft_climb/core/local_storage/local_storage.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/app_navbar.dart';
import 'package:craft_climb/features/account/presentation/pages/trade_person/trade_person_account_page.dart';
import 'package:craft_climb/features/courses/presentation/pages/browse_course/career_hub_page.dart';
import 'package:craft_climb/features/forum/presentation/pages/forum_page.dart';
import 'package:craft_climb/features/job/presentation/pages/browse_job/jobs_page.dart';
import 'package:craft_climb/features/tools/presentation/pages/tools_page.dart';
import 'package:flutter/material.dart';

class TradePersonHomePage extends StatefulWidget {
  //route
  static Route route() {
    return MaterialPageRoute(builder: (context) => TradePersonHomePage());
  }

  const TradePersonHomePage({super.key});

  @override
  State<TradePersonHomePage> createState() => _TradePersonHomePageState();
}

class _TradePersonHomePageState extends State<TradePersonHomePage> {
  //STATE
  int selectedIndex = 0;

  //PAGES
  List<Widget> get pages => [
    ForumPage(),
    JobsPage(),
    ToolsPage(),
    CareerHubPage(),
    TradePersonAccountPage(),
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
