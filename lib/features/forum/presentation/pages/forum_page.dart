import 'package:flutter/material.dart';

class ForumPage extends StatelessWidget {
  //route
  static Route route() {
    return MaterialPageRoute(builder: (context) => ForumPage());
  }

  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text('Forum  Page'));
  }
}
