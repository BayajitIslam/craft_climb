import 'package:craft_climb/features/account/presentation/pages/account_page.dart';
import 'package:craft_climb/features/account/presentation/widgets/account_menu_section.dart';
import 'package:craft_climb/features/career_seeker/presentation/pages/my_orders_page.dart';
import 'package:craft_climb/features/forum/presentation/pages/my_forum_post_page.dart';
import 'package:craft_climb/features/profile/presentation/pages/employer/employer_profile_view_page.dart';
import 'package:flutter/material.dart';

class EmployerAccountPage extends StatelessWidget {
  const EmployerAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountPage(
      userName: 'Kurt Cobain',
      userEmail: 'kurtcobain@email.com',
      disableProgress: true,
      profileItems: [
        AccountMenuItem(
          title: 'Company Profile',
          onTap: () {
            Navigator.push(context, EmployerProfileViewPage.route());
          },
        ),
        AccountMenuItem(
          title: 'My Orders',
          onTap: () {
            Navigator.push(context, MyOrdersPage.route());
          },
        ),

        AccountMenuItem(
          title: 'My Forum Posts',
          onTap: () {
            Navigator.push(context, MyForumPostPage.route());
          },
        ),
      ],
    );
  }
}
