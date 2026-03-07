import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  static final MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => const SignInPage(),
  );
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Sign In')));
  }
}
