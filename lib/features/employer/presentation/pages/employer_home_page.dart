import 'package:flutter/material.dart';

class EmployerHomePage extends StatelessWidget {
  //route
  static Route route() {
    return MaterialPageRoute(builder: (context) => EmployerHomePage());
  }

  const EmployerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Employer Homepage Page')));
  }
}
