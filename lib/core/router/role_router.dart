import 'package:craft_climb/features/auth/presentation/pages/login_and_signup_page.dart';
import 'package:craft_climb/features/career_seeker/presentation/pages/carrer_seeker_home_page.dart';
import 'package:craft_climb/features/employer/presentation/pages/employer_home_page.dart';
import 'package:craft_climb/features/trade_person/presentation/pages/trade_person_home_page.dart';
import 'package:craft_climb/features/trainer/presentation/pages/trainer_home_page.dart';
import 'package:flutter/material.dart';

class RoleRouter {
  static void goToHome(BuildContext context, String role) {
    switch (role) {
      case 'career_seeker':
        Navigator.pushReplacement(context, CarrerSeekerHomePage.route());
        break;
      case 'employer':
        Navigator.pushReplacement(context, EmployerHomePage.route());
        break;
      case 'trainer':
        Navigator.pushReplacement(context, TrainerHomePage.route());
        break;
      case 'trade_person':
        Navigator.pushReplacement(context, TradePersonHomePage.route());
        break;
      default:
        Navigator.pushReplacement(context, LoginAndSignupPage.routeWith());
    }
  }
}
