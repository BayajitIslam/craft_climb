import 'package:flutter/material.dart';

class ToolsPage extends StatelessWidget {
  //route
  static Route route() {
    return MaterialPageRoute(builder: (context) => ToolsPage());
  }

  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Tools  Page'));
  }
}
