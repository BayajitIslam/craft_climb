import 'package:craft_climb/features/account/presentation/pages/account_page.dart';
import 'package:craft_climb/features/account/presentation/widgets/account_menu_section.dart';
import 'package:craft_climb/features/career_seeker/presentation/pages/certificates_page.dart';
import 'package:craft_climb/features/career_seeker/presentation/pages/my_applications_page.dart';
import 'package:craft_climb/features/career_seeker/presentation/pages/my_orders_page.dart';
import 'package:craft_climb/features/career_seeker/presentation/pages/my_resume_page.dart';
import 'package:craft_climb/features/forum/presentation/pages/my_forum_post_page.dart';
import 'package:craft_climb/features/profile/presentation/pages/apply_as_page.dart';
import 'package:craft_climb/features/profile/presentation/pages/career_seeker/cs_profile_view_page.dart';
import 'package:craft_climb/features/profile/presentation/pages/desire_position_page.dart';
import 'package:flutter/material.dart';

class CarrerSeekerAccountPage extends StatelessWidget {
  const CarrerSeekerAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountPage(
      userName: 'Kurt Cobain',
      userEmail: 'kurtcobain@email.com',
      careerProgress: 80,
      profileItems: [
        AccountMenuItem(
          title: 'Profile Update',
          onTap: () {
            Navigator.push(context, CSProfileViewPage.route());
          },
        ),
        AccountMenuItem(
          title: 'My Resume',
          onTap: () {
            Navigator.push(context, MyResumePage.route());
          },
        ),
        AccountMenuItem(
          title: 'Desire Position',
          onTap: () {
            Navigator.push(context, DesirePositionPage.route());
          },
        ),
        AccountMenuItem(
          title: 'Apply as a Trade Person',
          onTap: () {
            Navigator.push(
              context,
              ApplyAsPage.route(applyfor: 'Trade Person'),
            );
          },
        ),
        AccountMenuItem(
          title: 'My Applications',
          onTap: () {
            Navigator.push(context, MyApplicationsPage.route());
          },
        ),
        AccountMenuItem(
          title: 'Certificates',
          onTap: () {
            Navigator.push(context, CertificatesPage.route());
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
