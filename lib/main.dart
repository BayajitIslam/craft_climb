import 'package:craft_climb/app.dart';
import 'package:craft_climb/core/local_storage/local_storage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(const App());
}
