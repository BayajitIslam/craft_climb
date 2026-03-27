import 'package:craft_climb/app.dart';
import 'package:craft_climb/core/di/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}
