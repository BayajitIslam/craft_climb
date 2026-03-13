import 'package:craft_climb/features/account/presentation/pages/account_page.dart';
import 'package:craft_climb/features/account/presentation/widgets/account_menu_section.dart';
import 'package:craft_climb/features/profile/presentation/pages/trainer/trainer_profile_view_page.dart';
import 'package:flutter/material.dart';

class TrainerAccountPage extends StatelessWidget {
  const TrainerAccountPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountPage(
      userName: 'Kurt Cobain',
      userEmail: 'kurtcobain@email.com',
      disableProgress: true,
      profileItems: [
        AccountMenuItem(title: 'Company Profile', onTap: () {
          Navigator.push(context, TrainerProfileViewPage.route());
        }),
        AccountMenuItem(title: 'My Orders', onTap: () {}),
      ],
    );
  }
}
