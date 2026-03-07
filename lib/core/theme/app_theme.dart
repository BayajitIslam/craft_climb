import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.primary,
    appBarTheme: const AppBarTheme(backgroundColor: AppPallete.transparent),
  );
}
  