import 'package:flutter/material.dart';

class TradePersonHomePage extends StatelessWidget {
  //route
  static Route route() {
    return MaterialPageRoute(builder: (context) => TradePersonHomePage());
  }

  const TradePersonHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Trade Person Homepage Page')));
  }
}
