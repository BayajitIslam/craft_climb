import 'package:flutter/material.dart';

class CarrerSeekerHomePage extends StatelessWidget {
  //route
  static Route route() {
    return MaterialPageRoute(builder: (context) => CarrerSeekerHomePage());
  }

  const CarrerSeekerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Carrer Seeker Homepage Page')));
  }
}
